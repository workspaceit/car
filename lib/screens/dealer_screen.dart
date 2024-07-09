import 'dart:math';

import 'package:car_dealer_app/models/dealer_list_response.dart';
import 'package:car_dealer_app/networking/service_dealer.dart';
import 'package:car_dealer_app/screens/tab_controller.dart';
import 'package:car_dealer_app/screens/vehicle_screen.dart';
import 'package:car_dealer_app/theme/theme_colors.dart';
import 'package:car_dealer_app/theme/theme_custom_button.dart';
import 'package:car_dealer_app/theme/theme_style.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DealerScreen extends StatefulWidget {
  static const String route = '/dealer';

  TabContainerBottomState tabContainerBottomState;
  DealerScreen(this.tabContainerBottomState);

  @override
  _DealerScreenState createState() => _DealerScreenState();
}

class _DealerScreenState extends State<DealerScreen> {
  final SearchBarController<Post> _searchBarController = SearchBarController();
  ServiceDealer _serviceDealer = new ServiceDealer();
  List<Dealer> dealers;
  DealerJson dealerJson;
  var isLoading = true;
  bool isLoadingMore = false;
  Map<String, dynamic> bodyParams;

  bool isFilterLoading = true;

  Future<List<Post>> _getALlPosts(String text) async {
    if (text.length > 0) {
      var data = {
        "perpage": 6,
        "filter": {"query": text, "status": "", "dealerIds": []}
      };
      setState(() {
        isFilterLoading = true;
      });
      _serviceDealer.getAllDealer(data).then((response) {
        print('done2');
        DealerListResponse json = DealerListResponse.fromJson(response.data);
        print(json);
        setState(() {
          bodyParams = data;
          dealerJson = json.data;
          dealers = json.data.dealers;
          isLoading = false;
        });
      });
    } else {
      //FocusScope.of(context).unfocus();
      FocusScope.of(context).requestFocus(new FocusNode());
      getAllDealers();
    }

    List<Post> posts = [];

    var random = new Random();
    for (int i = 0; i < 10; i++) {
      posts.add(Post("$text $i", "body random number : ${random.nextInt(100)}"));
    }

    return []; //posts;
  }

  @override
  void initState() {
    // TODO: implement initState
    getAllDealers();

    super.initState();
  }

  Future<void> _reloadData() async {
    setState(() {
      getAllDealers();
    });
  }

  getAllDealers() async {
    var data = {
      "perpage": 6,
      "filter": {"query": ""},
      "sortBy": ""
    };

    setState(() {
      isFilterLoading = false;
    });
    callDealerServiceAPI(data);
  }

  callDealerServiceAPI([Map<String, Object> data]) {
    _serviceDealer.getAllDealer(data).then((response) {
      print('done2');
      DealerListResponse json = DealerListResponse.fromJson(response.data);
      print(response);
      setState(() {
        bodyParams = data;
        dealerJson = json.data;
        dealers = json.data.dealers;
        isLoading = false;
      });
    });
  }

  loadMoreData() async {
    print("load more");
    _serviceDealer.getMoreDealer(dealerJson.links.nextPage, bodyParams).then((response) {
      print('more vehicle');
      DealerListResponse moreJson = DealerListResponse.fromJson(response.data);
      setState(() {
        isLoadingMore = false;
        dealerJson = moreJson.data;
        List<Dealer> moreData = moreJson.data.dealers;
        dealers.addAll(moreData);
        // allData = moreNoticeResponse.data;
      });
    });
  }

  void choiceAction(String choice) {
    // if (choice == DealerConstants.FirstItem) {
    //   print(choice);
    //
    //   print('I First Item');
    // } else if (choice == DealerConstants.SecondItem) {
    //   print('I Second Item');
    // } else if (choice == DealerConstants.ThirdItem) {
    //   print('I Third Item');
    // }
    setState(() {
      isFilterLoading = true;
      isLoading = true;
      dealers = null;
      bodyParams = {
        "perpage": 6,
        "filter": {"query": choice},
        "sortBy": ""
      };
    });
    callDealerServiceAPI(bodyParams);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dealers == null && isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : dealers == null
              ? Center(
                  child: Text(
                  "Something went wrong",
                  style: TextStyle(),
                ))
              : dealers.length == 0 && isFilterLoading == false
                  ? Center(
                      child: SizedBox(),
                      // Text(
                      //   "No dealer found",
                      //   style: gcPlaceholderTextStyle,
                      // ),
                    )
                  : NotificationListener(
                      onNotification: (ScrollNotification scrollInfo) {
                        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                          if (!isLoadingMore && dealerJson.links.nextPage != null) {
                            // start loading data
                            print("Scrolling to end...");
                            setState(() {
                              isLoadingMore = true;
                            });
                            loadMoreData();
                          } else if (dealerJson.links.nextPage == null) {
                            print("Data end");
                            setState(() {
                              isLoadingMore = false;
                            });
                          } else {}
                        }
                        return;
                      },
                      child: RefreshIndicator(
                        onRefresh: _reloadData,
                        child: CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: Column(
                                children: [
                                  Container(
                                    color: themeBlueColor,
                                    height: 44,
                                  ),
                                  Container(
                                    color: themeBlueColor,
                                    height: 80,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          // height:40,
                                          width: MediaQuery.of(context).size.width / 1.5,
                                          child: SearchBar<Post>(
                                            searchBarStyle: SearchBarStyle(backgroundColor: Colors.yellow.withOpacity(0.2)),
                                            minimumChars: 0,
                                            searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
                                            headerPadding: EdgeInsets.symmetric(horizontal: 10),
                                            listPadding: EdgeInsets.symmetric(horizontal: 10),
                                            onSearch: _getALlPosts,
                                            loader: Text("loading..."),
                                            emptyWidget: Text("empty"),
                                            debounceDuration: Duration(milliseconds: 500),
                                            hintText: 'search dealer ',
                                            iconActiveColor: Colors.blue,
                                            hintStyle: TextStyle(color: Colors.white), textStyle: GoogleFonts.poppins(color: themeWhiteColor),
                                            searchBarController: _searchBarController,
                                            // placeHolder: Text("placeholder"),
                                            cancellationWidget: Text(
                                              "Cancel",
                                              style: GoogleFonts.poppins(color: themeWhiteColor),
                                            ),
                                            //emptyWidget: Text("empty"),
                                            indexedScaledTileBuilder: (int index) => ScaledTile.count(1, index.isEven ? 2 : 1),
                                            onCancelled: () {
                                              print("Cancelled triggered");
                                              // getAllMembers();
                                              // FocusScope.of(context).unfocus();
                                              isLoading = true;
                                              getAllDealers();
                                              FocusScope.of(context).unfocus();
                                            },
                                            mainAxisSpacing: 10,
                                            crossAxisSpacing: 10,
                                            crossAxisCount: 2,
                                            onItemFound: (Post post, int index) {
                                              return Container(
                                                color: Colors.lightBlue,
                                                child: ListTile(
                                                  title: Text(post.title),
                                                  isThreeLine: true,
                                                  subtitle: Text(post.body),
                                                  onTap: () {},
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        // SvgPicture.asset(
                                        //   "assets/icons/filter.svg",
                                        //   // width: 50,height: 50,
                                        //   fit: BoxFit.contain,
                                        // ),
                                        Container(
                                          height: 100,
                                          width: 100,
                                          child: PopupMenuButton<String>(
                                            // offset: Offset(0,0),
                                            icon: SvgPicture.asset(
                                              "assets/icons/filter.svg",
                                              // width: 50,height: 50,
                                              fit: BoxFit.contain,
                                            ),
                                            onSelected: choiceAction,
                                            itemBuilder: (BuildContext context) {
                                              return DealerConstants.choices.map((String choice) {
                                                return PopupMenuItem<String>(
                                                  value: choice,
                                                  child: Text(choice),
                                                );
                                              }).toList();
                                            },
                                          ),
                                        ),

                                        SvgPicture.asset(
                                          "assets/icons/more_vertical.svg",
                                          // width: 50,height: 50,
                                          fit: BoxFit.contain,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        )
                                      ],
                                    ),
                                  ),
                                  (dealers.length == 0 && isFilterLoading == true)
                                      ? Center(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top: 18.0),
                                                child: Text(
                                                  "No dealer found",
                                                  style: gcPlaceholderTextStyle,
                                                ),
                                              ),
                                              FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      dealers = null;
                                                      isLoading = true;
                                                      _reloadData();
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 30,
                                                    child: Icon(Icons.refresh),
                                                  ))
                                            ],
                                          ),
                                        )
                                      : SizedBox()
                                ],
                              ),
                            ),
                            SliverList(
                              delegate: SliverChildBuilderDelegate((BuildContext context, int position) {
                                return Card(
                                  color: themeWhiteColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Dealer',
                                          style: currencyTextStyle,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                dealers[position].name.toString(),
                                                style: gcTitleTextStyle,
                                              ),
                                            ),
                                            MyCustomButton(
                                              height: 30,
                                              color: themeYellowColor,
                                              child: Padding(
                                                padding: const EdgeInsets.all(0.0),
                                                child: Text('Publish', style: buttonSubTextStyle),
                                              ),
                                              onPressed: () {
                                                print('tapped');
                                              },
                                            ),
                                          ],
                                        ),
                                        Wrap(
                                          direction: Axis.horizontal,
                                          crossAxisAlignment: WrapCrossAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(8.0),
                                              child: Container(
                                                width: 140,
                                                height: 30,
                                                child: Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      child: Container(
                                                        color: themeGreenColor,
                                                        height: 16,
                                                        width: 16,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                        "Active ${dealers[position].activeCount.toString()}",
                                                        style: TextStyle(color: themeGreenColor),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(8.0),
                                              child: Container(
                                                width: 120,
                                                height: 30,
                                                child: Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      child: Container(
                                                        color: themeYellowColor,
                                                        height: 16,
                                                        width: 16,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                        "On Hold ${dealers[position].holdCount.toString()}",
                                                        style: TextStyle(color: themeYellowColor),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(8.0),
                                              child: Container(
                                                width: 120,
                                                height: 30,
                                                child: Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      child: Container(
                                                        color: Colors.grey,
                                                        height: 16,
                                                        width: 16,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                        "Draft ${dealers[position].draftCount.toString()}",
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(8.0),
                                              child: Container(
                                                width: 120,
                                                height: 30,
                                                child: Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      child: Container(
                                                        color: themeBlueColor,
                                                        height: 16,
                                                        width: 16,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                        "Sold ${dealers[position].soldCount.toString()}",
                                                        style: TextStyle(color: themeBlueColor),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(8.0),
                                              child: Container(
                                                width: 120,
                                                height: 30,
                                                child: Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      child: Container(
                                                        color: themeStatusColor,
                                                        height: 16,
                                                        width: 16,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                        "Total ${dealers[position].totalCount.toString()}",
                                                        style: TextStyle(color: themeStatusColor),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }, childCount: dealers.length),
                            )
                          ],
                        ),
                      ),
                    ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {},
        tooltip: 'add dealer',
        child: SvgPicture.asset('assets/icons/add.svg'),
      ),
      // ),
    );
  }
}

class DealerConstants {
  static const String FirstItem = 'Active';
  static const String SecondItem = 'Hold';
  static const String ThirdItem = 'Draft';
  static const String FourthItem = 'Sold';
  static const String FifthItem = 'Total';

  static const List<String> choices = <String>[FirstItem, SecondItem, ThirdItem, FourthItem, FifthItem];
}

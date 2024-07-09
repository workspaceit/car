import 'dart:math';

import 'package:car_dealer_app/models/dealer_list_response.dart';
import 'package:car_dealer_app/models/vehicle_list_response.dart';
import 'package:car_dealer_app/networking/service_dealer.dart';
import 'package:car_dealer_app/networking/service_vehicle.dart';
import 'package:car_dealer_app/networking/url_manager.dart';
import 'package:car_dealer_app/screens/tab_controller.dart';
import 'package:car_dealer_app/theme/theme_colors.dart';
import 'package:car_dealer_app/theme/theme_custom_button.dart';
import 'package:car_dealer_app/theme/theme_style.dart';
import 'package:car_dealer_app/utils/custom_dropdown.dart';
import 'package:car_dealer_app/utils/resources.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleScreen extends StatefulWidget {
  static const String route = '/vehicle';

  TabContainerBottomState tabContainerBottomState;

  VehicleScreen(this.tabContainerBottomState);

  @override
  _VehicleScreenState createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  final SearchBarController<Post> _searchBarController = SearchBarController();

  ServiceVehicle _serviceVehicle = new ServiceVehicle();
  List<Car> cars;
  VehicleJson vehicleJson;
  var isLoading = true;
  var isFilterLoading = true;
  bool isLoadingMore = false;
  Map<String, dynamic> bodyParams;
  String dropdownValue = 'First';
  Future<List<Post>> _getALlPosts(String text) async {
    if (text.length > 0) {
      var data = {
        "perpage": 6,
        "filter": {"query": text, "status": "", "dealerIds": []}
      };
      setState(() {
        isFilterLoading = true;
      });
      _serviceVehicle.getAllVehicle(data).then((response) {
        print('done2');
        VehicleListResponse json = VehicleListResponse.fromJson(response.data);
        print(json);
        setState(() {
          bodyParams = data;
          vehicleJson = json.data;
          cars = json.data.cars;
          isLoading = false;
        });
      });
    } else {
      //FocusScope.of(context).unfocus();
      FocusScope.of(context).requestFocus(new FocusNode());
      getAllCars();
    }

    List<Post> posts = [];

    var random = new Random();
    for (int i = 0; i < 10; i++) {
      posts.add(Post("$text $i", "body random number : ${random.nextInt(100)}"));
    }

    return []; //posts;
  }

  final FocusNode _genderSelectionNode = FocusNode();
  List<String> genderDropDownList = ["Male", "Female", "Trans Gender", "Other"];

  @override
  void initState() {
    // TODO: implement initState
    print("call init");
    getAllCars();
    getAllDealers();
    super.initState();
  }

  Future<void> _reloadData() async {
    setState(() {
      getAllCars();
    });
  }

  getAllCars() async {
    var data = {
      "perpage": 6,
      "filter": {"query": "", "status": "", "dealerIds": []}
    };
    setState(() {
      isFilterLoading = false;
      callCarServiceAPI(data);
    });
  }

  loadMoreData() async {
    print("load more");
    _serviceVehicle.getMoreVehicle(vehicleJson.links.nextPage, bodyParams).then((response) {
      print('more vehicle');
      VehicleListResponse moreJson = VehicleListResponse.fromJson(response.data);
      setState(() {
        isLoadingMore = false;
        vehicleJson = moreJson.data;
        List<Car> moreData = moreJson.data.cars;
        cars.addAll(moreData);
        // allData = moreNoticeResponse.data;
      });
    });
  }

  callCarServiceAPI([Map<String, Object> data]) {
    _serviceVehicle.getAllVehicle(data).then((response) {
      print('done2');
      VehicleListResponse json = VehicleListResponse.fromJson(response.data);
      print(json);
      setState(() {
        bodyParams = data;
        vehicleJson = json.data;
        cars = json.data.cars;
        isLoading = false;
      });
    });
  }

  void choiceAction(String choice) {
    setState(() {
      isFilterLoading = true;
      isLoading = true;
      cars = null;

      bodyParams = {
        "perpage": 6,
        "filter": {"query": choice, "status": "", "dealerIds": []}
      };
      callCarServiceAPI(bodyParams);
    });
    // if (choice == VehicleConstants.FirstItem) {
    //   print('I First Item');
    // } else if (choice == VehicleConstants.SecondItem) {
    //   print('I Second Item');
    // } else if (choice == VehicleConstants.ThirdItem) {
    //   print('I Third Item');
    // }
  }

  List<Dealer> dealers;
  ServiceDealer _serviceDealer = new ServiceDealer();

  List<String> dealerNames;
  List<int> dealerIds;

  getAllDealers() async {
    var data = {
      "perpage": 99999,
      "filter": {"query": ""},
      "sortBy": ""
    };

    _serviceDealer.getAllDealer(data).then((response) {
      print('done2');
      DealerListResponse json = DealerListResponse.fromJson(response.data);
      print(response);

      setState(() {
        bodyParams = data;
        dealers = json.data.dealers;

        for (Dealer dealer in dealers) {
          dealerNames.add(dealer.name.toString());
          dealerIds.add(dealer.id);
        }
        Resources.allDealersName = dealerNames;
        Resources.allDealersId = dealerIds;
      });
    });
  }

  settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new DropdownButton(
                  items: dealerNames.map((item) {
                    return new DropdownMenuItem(
                      child: new Text(item),
                      value: item.toString(),
                    );
                  }).toList(),
                  onChanged: (newVal) {
                    setState(() {
                      Resources.selectedDealerName = newVal;
                    });
                  },
                  value: dealerNames,
                ),
                new ListTile(leading: new Icon(Icons.music_note), title: new Text('Music'), onTap: () => {}),
                new ListTile(
                  leading: new Icon(Icons.videocam),
                  title: new Text('Video'),
                  onTap: () => {},
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // SafeArea(
          //
          // child:
          cars == null && isLoading
              ? Center(child: CircularProgressIndicator())
              : cars == null
                  ? Center(
                      child: Text(
                      "Something went wrong",
                      style: TextStyle(),
                    ))
                  : cars.length == 0 && isFilterLoading == false
                      ? Center(
                          child: Text(
                            "No Car found",
                            style: gcPlaceholderTextStyle,
                          ),
                        )
                      : NotificationListener(
                          onNotification: (ScrollNotification scrollInfo) {
                            if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                              if (!isLoadingMore && vehicleJson.links.nextPage != null) {
                                // start loading data
                                print("Scrolling to end...");
                                setState(() {
                                  isLoadingMore = true;
                                });
                                loadMoreData();
                              } else if (vehicleJson.links.nextPage == null) {
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

                                                emptyWidget: Text("empty"), debounceDuration: Duration(milliseconds: 500),
                                                hintText: 'search vehicle ',
                                                hintStyle: TextStyle(color: Colors.white),
                                                // icon: Icon(Icons.search, color: Colors.white),
                                                textStyle: GoogleFonts.poppins(color: themeWhiteColor),
                                                iconActiveColor: Colors.blue,
                                                searchBarController: _searchBarController,
                                                // placeHolder: Text("Search here", style:listSubTitleTextStyle),
                                                cancellationWidget: Text(
                                                  "Cancel",
                                                  style: GoogleFonts.poppins(color: themeWhiteColor),
                                                ),
                                                //emptyWidget: Text("empty"),
                                                indexedScaledTileBuilder: (int index) => ScaledTile.count(1, index.isEven ? 2 : 1),
                                                onCancelled: () {
                                                  print("Cancelled triggered");
                                                  // getAllMembers();
                                                  isLoading = true;
                                                  getAllCars();
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
                                                  return VehicleConstants.choices.map((String choice) {
                                                    return PopupMenuItem<String>(
                                                      value: choice,
                                                      child: Text(choice),
                                                    );
                                                  }).toList();
                                                },
                                              ),
                                            ),

                                            // SvgPicture.asset(
                                            //   "assets/icons/filter.svg",
                                            //   // width: 50,height: 50,
                                            //   fit: BoxFit.contain,
                                            // ),
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
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Want to publish now?',
                                              style: appTextFieldTextStyle,
                                            ),
                                            MyCustomButton(
                                              height: 40,
                                              color: themeGreenColor,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text('Publish Now', style: buttonSubTextStyle),
                                              ),
                                              onPressed: () {
                                                print('tapped');
                                                //settingModalBottomSheet(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      // (cars.length == 0 && isFilterLoading == true)
                                      //     ? Center(
                                      //         child: Text(
                                      //           "No Car found",
                                      //           style: gcPlaceholderTextStyle,
                                      //         ),
                                      //       )
                                      //     : SizedBox()

                                      (cars.length == 0 && isFilterLoading == true)
                                          ? Center(
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 18.0),
                                                    child: Text(
                                                      "No Car found",
                                                      style: gcPlaceholderTextStyle,
                                                    ),
                                                  ),
                                                  FlatButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          cars = null;
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
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Resources.selectedCarID = cars[position].id;
                                          Resources.selectedDealerID = cars[position].dealerId;
                                        });
                                        Navigator.pushNamed(context, '/vehicle_details');
                                      },
                                      child: Card(
                                        color: themeWhiteColor,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(16.0),
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  child: FadeInImage(
                                                    width: 180,
                                                    image: NetworkImage(
                                                      cars[position].photo.toString(),
                                                      // width: 180,
                                                    ),
                                                    placeholder: AssetImage(
                                                      'assets/images/car.png',
                                                      // width: 180,
                                                    ),
                                                  )
                                                  // Image.asset(
                                                  //   'assets/images/car.png',
                                                  //   width: 180,
                                                  // ),
                                                  ),
                                            ),
                                            Flexible(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  MyCustomButton(
                                                    height: 30,
                                                    color: themeStatusColor,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(cars[position].postStatus.toString(), style: GoogleFonts.sourceSansPro(color: themeWhiteColor, fontSize: 12, fontWeight: FontWeight.w600)),
                                                    ),
                                                    onPressed: () {
                                                      print('tapped');
                                                    },
                                                  ),
                                                  Text(
                                                    cars[position].postTitle.toString(),
                                                    style: gcTitleTextStyle,
                                                  ),
                                                  Text(
                                                    '\$${cars[position].carPrice.toString()}',
                                                    style: currencyTextStyle,
                                                  ),
                                                  //currencyTextStyle
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }, childCount: cars.length),
                                )
                              ],
                            ),
                          ),
                        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () async {
          // var url = NetworkManager.apiUrl + '/api/v1/cars?page=1';
          //
          // // Await the http get response, then decode the json-formatted response.
          // var response = await http.get(url,headers: {
          //   'Authorization': "Bearer " + accessToken
          // }
          // );
          // if (response.statusCode == 200) {
          //   var jsonResponse = convert.jsonDecode(response.body);
          //   var itemCount = jsonResponse['totalItems'];
          //   print('Number of books about http: $itemCount.');
          // } else {
          //   print('Request failed with status: ${response.statusCode}.');
          // }

          Navigator.pushNamed(context, '/add_vehicle');
        },
        tooltip: 'add vehicle',
        child: SvgPicture.asset('assets/icons/add.svg'),
      ),
      // ),
    );
  }
}

class Post {
  final String title;
  final String body;

  Post(this.title, this.body);
}

class VehicleConstants {
  static const String FirstItem = 'active';
  static const String SecondItem = 'hold';
  static const String ThirdItem = 'draft';
  static const String FourthItem = 'sold';

  static const List<String> choices = <String>[FirstItem, SecondItem, ThirdItem, FourthItem];
}

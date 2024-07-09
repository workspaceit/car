import 'package:car_dealer_app/screens/add_support_screen.dart';
import 'package:car_dealer_app/screens/add_vehicle.dart';
import 'package:car_dealer_app/screens/car_details_screen.dart';
import 'package:car_dealer_app/screens/tab_controller.dart';
import 'package:car_dealer_app/screens/welcome_screen.dart';
import 'package:car_dealer_app/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: themeBlueColor
    ));

    return MaterialApp(
      title: 'MonezSoft',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
       initialRoute: WelcomeScreen.route,
      theme: ThemeData(
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // accentColor: themeGolderColor,
        primaryColor: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class RouteConfiguration {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      case '/welcome':
        return MaterialPageRoute<void>(
          builder: (context) => WelcomeScreen(),
          settings: settings,
        );
      case '/tab':
        return MaterialPageRoute<void>(
          builder: (context) => TabContainerBottom(),
          settings: settings,
        );
      case '/vehicle_details':
        return MaterialPageRoute<void>(
          builder: (context) => VehicleDetailsScreen(),
          settings: settings,
        );


      case '/add_support':
        return MaterialPageRoute<void>(
          builder: (context) => AddSupportScreen(),
          settings: settings,
        );

      case '/add_vehicle':
        return MaterialPageRoute<void>(
          builder: (context) => AddVehicleScreen(),
          settings: settings,
        );
      //
      // case '/notice':
      //   return MaterialPageRoute<void>(
      //     builder: (context) => NoticeScreen(),
      //     settings: settings,
      //   );
      //
      // case '/building_directory':
      //   return MaterialPageRoute<void>(
      //     builder: (context) => BuildingDirectoryScreen(),
      //     settings: settings,
      //   );
      //
      // case '/club_facilities':
      //   return MaterialPageRoute<void>(
      //     builder: (context) => ClubFacilitiesScreen(),
      //     settings: settings,
      //   );
      // case '/facility_details':
      //   return MaterialPageRoute<void>(
      //     builder: (context) => FacilityDetails(),
      //     settings: settings,
      //   );
      //
      // case '/members_directory':
      //   return MaterialPageRoute<void>(
      //     builder: (context) => MembersDirectoryScreen(),
      //     settings: settings,
      //   );
      // case '/obituary':
      //   return MaterialPageRoute<void>(
      //     builder: (context) => ObituaryScreen(),
      //     settings: settings,
      //   );
      //
      // case '/members_ledger':
      //   return MaterialPageRoute<void>(
      //     builder: (context) => MembersLedgerScreen(),
      //     settings: settings,
      //   );
      //
      // case '/events':
      //   return MaterialPageRoute<void>(
      //     builder: (context) => EventsScreen(),
      //     settings: settings,
      //   );
      //
      // case '/event_details':
      //   return MaterialPageRoute<void>(
      //     builder: (context) => EventDetailsScreen(),
      //     settings: settings,
      //   );
      //
      // case '/messages':
      //   return MaterialPageRoute<void>(
      //     builder: (context) => MessagesScreen(),
      //     settings: settings,
      //   );
      //
      // case '/chat':
      //   return MaterialPageRoute<void>(
      //     builder: (context) => SingleChatScreen(),
      //     settings: settings,
      //   );
      //
      // case '/employee_directory':
      //   return MaterialPageRoute<void>(
      //     builder: (context) => EmployeeDirectoryScreen(),
      //     settings: settings,
      //   );
      //
      // case '/profile':
      //   return MaterialPageRoute<void>(
      //     builder: (context) => ProfileScreen(),
      //     settings: settings,
      //   );
      //
      // case '/contact':
      //   return MaterialPageRoute<void>(
      //     builder: (context) => ContactScreen(),
      //     settings: settings,
      //   );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

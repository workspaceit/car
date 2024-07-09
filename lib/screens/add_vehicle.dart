import 'package:car_dealer_app/theme/theme_colors.dart';
import 'package:car_dealer_app/theme/theme_custom_button.dart';
import 'package:car_dealer_app/theme/theme_custom_input_field.dart';
import 'package:car_dealer_app/theme/theme_custom_validator.dart';
import 'package:car_dealer_app/theme/theme_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddVehicleScreen extends StatefulWidget {
  static const String route = '/add_vehicle';

  @override
  _AddVehicleScreenState createState() => _AddVehicleScreenState();
}

List<GlobalKey<FormState>> formKeys = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>()
];

class _AddVehicleScreenState extends State<AddVehicleScreen> {

  final TextEditingController _nameCtrl = new TextEditingController();
  final FocusNode _nameNode = FocusNode();

  final TextEditingController _passwordController = new TextEditingController();
  final FocusNode _passwordNode = FocusNode();

  final TextEditingController _emailController = new TextEditingController();
  final FocusNode _emailNode = FocusNode();

  final TextEditingController _emailController2 = new TextEditingController();
  final FocusNode _emailNode2 = FocusNode();

  final TextEditingController _emailController3 = new TextEditingController();
  final FocusNode _emailNode3 = FocusNode();

  final TextEditingController _emailController4 = new TextEditingController();
  final FocusNode _emailNode4 = FocusNode();

  TextEditingController  _currentAddressController = new TextEditingController();
  final FocusNode _currentAddressNode = FocusNode();

  TextEditingController  _descCtrl = new TextEditingController();
  final FocusNode _descNode = FocusNode();

  final FocusNode _genderSelectionNode = FocusNode();
  List<String> genderDropDownList = [];


  var _index = 0;
  BuildContext myContext;
  int currentStep = 0;
  bool complete = false;


  next() {
    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState(() {
      complete = true;
      currentStep = 0;
      print(complete);
//        MyCustomDialog.showCustomDialog(
//            "Congratulations!", "Account Created!", myContext);
    });
//     if (formKeys[currentStep].currentState.validate()) {
// //      if (currentStep < steps.length - 1) {
// //        currentStep = currentStep + 1;
// //
// //        currentStep + 1 != steps.length
// //            ? goTo(currentStep + 1)
// //            : setState(() => complete = true);
// //
// //      } else {
// //        currentStep = 0;
// //      }
//       currentStep + 1 != steps.length
//           ? goTo(currentStep + 1)
//           : setState(() {
//         complete = true;
//         currentStep = 0;
//         print(complete);
// //        MyCustomDialog.showCustomDialog(
// //            "Congratulations!", "Account Created!", myContext);
//       });
//     }
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    if (formKeys[currentStep].currentState.validate()) {
      setState(() => currentStep = step);
    }
    else if (step<currentStep){
      setState(() => currentStep = step);
    }
  }

  List<Step> steps = [];

  @override
  Widget build(BuildContext context) {

    myContext = context;

    steps = [
      Step(
        title: const Text('Vehicle Info'),
        isActive:  currentStep >= 0,
        state: currentStep > 0 ? StepState.complete : StepState.editing,//StepState.indexed,
        content: Form(
          key: formKeys[0],
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Dealer',
                    style: appTextFieldTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 48,
                    color: Colors.white,
                    child: TextFormField(
                      controller: _nameCtrl,
                      focusNode: _nameNode,
                      // validator: (value) => MyCustomValidator.validateIsEmpty(_userIdCtrl.text, 'userID', context),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        // border: new OutlineInputBorder(
                        //   borderSide: new BorderSide(
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),

                          //  when the TextFormField in unfocused
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange), //HexColor("#FF7300"
                          //  when the TextFormField in focused
                        ),
                        // hintText: 'enter email/username',
                        // hintStyle: gcPlaceholderTextStyle,
                      ),
                      onFieldSubmitted: (value) {},
                      // style: gcInputFieldTextStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'VIN',
                    style: appTextFieldTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 48,
                    color: Colors.white,
                    child: TextFormField(
                      controller: _nameCtrl,
                      focusNode: _nameNode,
                      // validator: (value) => MyCustomValidator.validateIsEmpty(_userIdCtrl.text, 'userID', context),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        // border: new OutlineInputBorder(
                        //   borderSide: new BorderSide(
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),

                          //  when the TextFormField in unfocused
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange), //HexColor("#FF7300"
                          //  when the TextFormField in focused
                        ),
                        // hintText: 'enter email/username',
                        // hintStyle: gcPlaceholderTextStyle,
                      ),
                      onFieldSubmitted: (value) {},
                      // style: gcInputFieldTextStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Make',
                    style: appTextFieldTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 48,
                    color: Colors.white,
                    child: TextFormField(
                      controller: _nameCtrl,
                      focusNode: _nameNode,
                      // validator: (value) => MyCustomValidator.validateIsEmpty(_userIdCtrl.text, 'userID', context),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        // border: new OutlineInputBorder(
                        //   borderSide: new BorderSide(
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),

                          //  when the TextFormField in unfocused
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange), //HexColor("#FF7300"
                          //  when the TextFormField in focused
                        ),
                        // hintText: 'enter email/username',
                        // hintStyle: gcPlaceholderTextStyle,
                      ),
                      onFieldSubmitted: (value) {},
                      // style: gcInputFieldTextStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Model',
                    style: appTextFieldTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 48,
                    color: Colors.white,
                    child: TextFormField(
                      controller: _nameCtrl,
                      focusNode: _nameNode,
                      // validator: (value) => MyCustomValidator.validateIsEmpty(_userIdCtrl.text, 'userID', context),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        // border: new OutlineInputBorder(
                        //   borderSide: new BorderSide(
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),

                          //  when the TextFormField in unfocused
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange), //HexColor("#FF7300"
                          //  when the TextFormField in focused
                        ),
                        // hintText: 'enter email/username',
                        // hintStyle: gcPlaceholderTextStyle,
                      ),
                      onFieldSubmitted: (value) {},
                      // style: gcInputFieldTextStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Trim',
                    style: appTextFieldTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 48,
                    color: Colors.white,
                    child: TextFormField(
                      controller: _nameCtrl,
                      focusNode: _nameNode,
                      // validator: (value) => MyCustomValidator.validateIsEmpty(_userIdCtrl.text, 'userID', context),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        // border: new OutlineInputBorder(
                        //   borderSide: new BorderSide(
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),

                          //  when the TextFormField in unfocused
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange), //HexColor("#FF7300"
                          //  when the TextFormField in focused
                        ),
                        // hintText: 'enter email/username',
                        // hintStyle: gcPlaceholderTextStyle,
                      ),
                      onFieldSubmitted: (value) {},
                      // style: gcInputFieldTextStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Year',
                    style: appTextFieldTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 48,
                    color: Colors.white,
                    child: TextFormField(
                      controller: _nameCtrl,
                      focusNode: _nameNode,
                      // validator: (value) => MyCustomValidator.validateIsEmpty(_userIdCtrl.text, 'userID', context),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        // border: new OutlineInputBorder(
                        //   borderSide: new BorderSide(
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),

                          //  when the TextFormField in unfocused
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange), //HexColor("#FF7300"
                          //  when the TextFormField in focused
                        ),
                        // hintText: 'enter email/username',
                        // hintStyle: gcPlaceholderTextStyle,
                      ),
                      onFieldSubmitted: (value) {},
                      // style: gcInputFieldTextStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'URL of the Vehicle',
                    style: appTextFieldTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 48,
                    color: Colors.white,
                    child: TextFormField(
                      controller: _nameCtrl,
                      focusNode: _nameNode,
                      // validator: (value) => MyCustomValidator.validateIsEmpty(_userIdCtrl.text, 'userID', context),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        // border: new OutlineInputBorder(
                        //   borderSide: new BorderSide(
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),

                          //  when the TextFormField in unfocused
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange), //HexColor("#FF7300"
                          //  when the TextFormField in focused
                        ),
                        // hintText: 'enter email/username',
                        // hintStyle: gcPlaceholderTextStyle,
                      ),
                      onFieldSubmitted: (value) {},
                      // style: gcInputFieldTextStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Stock',
                    style: appTextFieldTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 48,
                    color: Colors.white,
                    child: TextFormField(
                      controller: _nameCtrl,
                      focusNode: _nameNode,
                      // validator: (value) => MyCustomValidator.validateIsEmpty(_userIdCtrl.text, 'userID', context),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        // border: new OutlineInputBorder(
                        //   borderSide: new BorderSide(
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),

                          //  when the TextFormField in unfocused
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange), //HexColor("#FF7300"
                          //  when the TextFormField in focused
                        ),
                        // hintText: 'enter email/username',
                        // hintStyle: gcPlaceholderTextStyle,
                      ),
                      onFieldSubmitted: (value) {},
                      // style: gcInputFieldTextStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Condition',
                    style: appTextFieldTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 48,
                    color: Colors.white,
                    child: TextFormField(
                      controller: _nameCtrl,
                      focusNode: _nameNode,
                      // validator: (value) => MyCustomValidator.validateIsEmpty(_userIdCtrl.text, 'userID', context),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        // border: new OutlineInputBorder(
                        //   borderSide: new BorderSide(
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),

                          //  when the TextFormField in unfocused
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange), //HexColor("#FF7300"
                          //  when the TextFormField in focused
                        ),
                        // hintText: 'enter email/username',
                        // hintStyle: gcPlaceholderTextStyle,
                      ),
                      onFieldSubmitted: (value) {},
                      // style: gcInputFieldTextStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Body Type',
                    style: appTextFieldTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 48,
                    color: Colors.white,
                    child: TextFormField(
                      controller: _nameCtrl,
                      focusNode: _nameNode,
                      // validator: (value) => MyCustomValidator.validateIsEmpty(_userIdCtrl.text, 'userID', context),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        // border: new OutlineInputBorder(
                        //   borderSide: new BorderSide(
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),

                          //  when the TextFormField in unfocused
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange), //HexColor("#FF7300"
                          //  when the TextFormField in focused
                        ),
                        // hintText: 'enter email/username',
                        // hintStyle: gcPlaceholderTextStyle,
                      ),
                      onFieldSubmitted: (value) {},
                      // style: gcInputFieldTextStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Mileage',
                    style: appTextFieldTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 48,
                    color: Colors.white,
                    child: TextFormField(
                      controller: _nameCtrl,
                      focusNode: _nameNode,
                      // validator: (value) => MyCustomValidator.validateIsEmpty(_userIdCtrl.text, 'userID', context),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        // border: new OutlineInputBorder(
                        //   borderSide: new BorderSide(
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),

                          //  when the TextFormField in unfocused
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange), //HexColor("#FF7300"
                          //  when the TextFormField in focused
                        ),
                        // hintText: 'enter email/username',
                        // hintStyle: gcPlaceholderTextStyle,
                      ),
                      onFieldSubmitted: (value) {},
                      // style: gcInputFieldTextStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Engine',
                    style: appTextFieldTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 48,
                    color: Colors.white,
                    child: TextFormField(
                      controller: _nameCtrl,
                      focusNode: _nameNode,
                      // validator: (value) => MyCustomValidator.validateIsEmpty(_userIdCtrl.text, 'userID', context),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        // border: new OutlineInputBorder(
                        //   borderSide: new BorderSide(
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),

                          //  when the TextFormField in unfocused
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange), //HexColor("#FF7300"
                          //  when the TextFormField in focused
                        ),
                        // hintText: 'enter email/username',
                        // hintStyle: gcPlaceholderTextStyle,
                      ),
                      onFieldSubmitted: (value) {},
                      // style: gcInputFieldTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      Step(
        isActive: currentStep >= 1,
        state: currentStep > 1 ? StepState.complete : StepState.editing, //StepState.indexed,
        title: const Text('Spec'),
        content: Form(
          key: formKeys[1],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Number of doors',
                  style: appTextFieldTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: 48,
                  color: Colors.white,
                  child: TextFormField(
                    controller: _nameCtrl,
                    focusNode: _nameNode,
                    // validator: (value) => MyCustomValidator.validateIsEmpty(_userIdCtrl.text, 'userID', context),
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      // border: new OutlineInputBorder(
                      //   borderSide: new BorderSide(
                      //     color: Colors.grey,
                      //   ),
                      // ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),

                        //  when the TextFormField in unfocused
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange), //HexColor("#FF7300"
                        //  when the TextFormField in focused
                      ),
                      // hintText: 'enter email/username',
                      // hintStyle: gcPlaceholderTextStyle,
                    ),
                    onFieldSubmitted: (value) {},
                    // style: gcInputFieldTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Transmission',
                  style: appTextFieldTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: 48,
                  color: Colors.white,
                  child: TextFormField(
                    controller: _nameCtrl,
                    focusNode: _nameNode,
                    // validator: (value) => MyCustomValidator.validateIsEmpty(_userIdCtrl.text, 'userID', context),
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      // border: new OutlineInputBorder(
                      //   borderSide: new BorderSide(
                      //     color: Colors.grey,
                      //   ),
                      // ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),

                        //  when the TextFormField in unfocused
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange), //HexColor("#FF7300"
                        //  when the TextFormField in focused
                      ),
                      // hintText: 'enter email/username',
                      // hintStyle: gcPlaceholderTextStyle,
                    ),
                    onFieldSubmitted: (value) {},
                    // style: gcInputFieldTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Fuel Type',
                  style: appTextFieldTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: 48,
                  color: Colors.white,
                  child: TextFormField(
                    controller: _nameCtrl,
                    focusNode: _nameNode,
                    // validator: (value) => MyCustomValidator.validateIsEmpty(_userIdCtrl.text, 'userID', context),
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      // border: new OutlineInputBorder(
                      //   borderSide: new BorderSide(
                      //     color: Colors.grey,
                      //   ),
                      // ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),

                        //  when the TextFormField in unfocused
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange), //HexColor("#FF7300"
                        //  when the TextFormField in focused
                      ),
                      // hintText: 'enter email/username',
                      // hintStyle: gcPlaceholderTextStyle,
                    ),
                    onFieldSubmitted: (value) {},
                    // style: gcInputFieldTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Cylinder',
                  style: appTextFieldTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: 48,
                  color: Colors.white,
                  child: TextFormField(
                    controller: _nameCtrl,
                    focusNode: _nameNode,
                    // validator: (value) => MyCustomValidator.validateIsEmpty(_userIdCtrl.text, 'userID', context),
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      // border: new OutlineInputBorder(
                      //   borderSide: new BorderSide(
                      //     color: Colors.grey,
                      //   ),
                      // ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),

                        //  when the TextFormField in unfocused
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange), //HexColor("#FF7300"
                        //  when the TextFormField in focused
                      ),
                      // hintText: 'enter email/username',
                      // hintStyle: gcPlaceholderTextStyle,
                    ),
                    onFieldSubmitted: (value) {},
                    // style: gcInputFieldTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Inside Color',
                  style: appTextFieldTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: 48,
                  color: Colors.white,
                  child: TextFormField(
                    controller: _nameCtrl,
                    focusNode: _nameNode,
                    // validator: (value) => MyCustomValidator.validateIsEmpty(_userIdCtrl.text, 'userID', context),
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      // border: new OutlineInputBorder(
                      //   borderSide: new BorderSide(
                      //     color: Colors.grey,
                      //   ),
                      // ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),

                        //  when the TextFormField in unfocused
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange), //HexColor("#FF7300"
                        //  when the TextFormField in focused
                      ),
                      // hintText: 'enter email/username',
                      // hintStyle: gcPlaceholderTextStyle,
                    ),
                    onFieldSubmitted: (value) {},
                    // style: gcInputFieldTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Drive Train',
                  style: appTextFieldTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: 48,
                  color: Colors.white,
                  child: TextFormField(
                    controller: _nameCtrl,
                    focusNode: _nameNode,
                    // validator: (value) => MyCustomValidator.validateIsEmpty(_userIdCtrl.text, 'userID', context),
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      // border: new OutlineInputBorder(
                      //   borderSide: new BorderSide(
                      //     color: Colors.grey,
                      //   ),
                      // ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),

                        //  when the TextFormField in unfocused
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange), //HexColor("#FF7300"
                        //  when the TextFormField in focused
                      ),
                      // hintText: 'enter email/username',
                      // hintStyle: gcPlaceholderTextStyle,
                    ),
                    onFieldSubmitted: (value) {},
                    // style: gcInputFieldTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      Step(
        isActive: currentStep >= 2,
        state: currentStep > 2 ? StepState.complete : StepState.editing, //StepState.indexed,
        title: const Text('Images'),
        content: Form(
          key: formKeys[2],
          child: Column(
            children: <Widget>[


              MyInputField(
                required: true,
                controller: _emailController3,
                focusNode: _emailNode3,
                icon: Icons.email,
                validator: (value) =>
                    MyCustomValidator.validateEmail(value, context),
                type: TextInputType.emailAddress,
                hint: "enter your email",
                labelText: "Office Email 2",
                onComplete: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),

              MyInputField(
                required: true,
                controller: _emailController4,
                focusNode: _emailNode4,
                icon: Icons.email,
                validator: (value) =>
                    MyCustomValidator.validateEmail(value, context),
                type: TextInputType.emailAddress,
                hint: "enter your email",
                labelText: "Office Email 3",
                onComplete: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
            ],
          ),
        ),
      ),

      Step(
        isActive: currentStep >= 3,
        state: currentStep > 3 ? StepState.complete : StepState.editing, //StepState.indexed,
        title: const Text('Desc'),
        content: Form(
          key: formKeys[3],
          child: Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Description',
                  style: appTextFieldTextStyle,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: 120,
                color: Colors.white,
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: _descCtrl,
                  focusNode: _descNode,
                  // validator: (value) => MyCustomValidator.validateIsEmpty(_userIdCtrl.text, 'userID', context),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),

                      //  when the TextFormField in unfocused
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange), //HexColor("#FF7300"
                      //  when the TextFormField in focused
                    ),
                    // hintText: 'enter email/username',
                    // hintStyle: gcPlaceholderTextStyle,
                  ),
                  onFieldSubmitted: (value) {},
                  // style: gcInputFieldTextStyle,
                ),
              ),


            ],
          ),
        ),
      ),

    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Vehicle'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            SingleChildScrollView(
             // constraints: BoxConstraints.tightFor(height: 1000.0),
              child: Container(
                // color: Colors.white,
                height: MediaQuery.of(context).size.height +500,
                child: Stepper(
                  physics: ClampingScrollPhysics(),
                  steps: steps,
                  type: StepperType.horizontal,
                  currentStep: currentStep,
                  onStepContinue: next,
                  onStepTapped: (step) => goTo(step),
                  onStepCancel: cancel,
                  controlsBuilder:
                      (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.red,
                            child: FlatButton(
                              onPressed: onStepCancel,
                              child: const Text('BACK',style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                        (currentStep == 3)? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.blue,
                            child: FlatButton(
                              onPressed: onStepContinue,
                              child: const Text('Complete',style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ):Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.blue,
                            child: FlatButton(
                              onPressed: onStepContinue,
                              child: const Text('CONTINUE',style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomDropDown extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String> onChange;
  final String hintText;
  final Icon leadingIcon;
  final FocusNode focusNode;
  final String initialValue;


  const MyCustomDropDown({Key key,
    this.items,
    this.onChange,
    this.hintText,
    this.leadingIcon,

    this.focusNode, this.initialValue})
      : super(key: key);

  @override
  _MyCustomDropdownState createState() => _MyCustomDropdownState();
}

class _MyCustomDropdownState extends State<MyCustomDropDown> {
  List<DropdownMenuItem<int>> dropDownList = [];
  String _selectedGender;

//  @override
//  void setState(fn) {
//    dropDownList = [];
//    _selectedGender = widget.initialValue ?? "";
//    super.setState(fn);
//  }
  @override
  void initState() {
    // TODO: implement initState
    _selectedGender = widget.initialValue ;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:16,right:  16, top: 8, bottom: 8),
      child: DropdownButtonFormField(
        isExpanded: true,
        isDense: true,
        dropdownColor: Colors.white70,

        decoration: InputDecoration(

          border: UnderlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(-8, 0, 0, 0),
          labelText: widget.hintText,
          prefixIcon: widget.leadingIcon,
          enabledBorder: UnderlineInputBorder(
            //borderRadius: BorderRadius.circular(2),

            borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 0),
          ),
        ),
        onTap: () {
          setState(() {
            widget.focusNode.requestFocus();
          });
        },

        focusNode: widget.focusNode,

        items: widget.items
            .map((region) =>
            DropdownMenuItem<String>(
                child:
                Text(
                  region,
                  style: TextStyle(color: Colors.black),
                ),

                value: region))
            .toList(),
        value: _selectedGender,
        onChanged: widget.onChange,
//            (String value) {
//          setState(() {
//            _selectedGender = value;
//            // widget.focusNode.requestFocus();
//          });
//          print(value);
//        },
        //isExpanded: true,
      ),
    );
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = new List();
    formWidget.add(
      Container(
        padding: EdgeInsets.fromLTRB(16, 4, 16, 4),

        child: new
        DropdownButtonFormField(
          dropdownColor: Colors.white70,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
//            contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 6),
            labelText: widget.hintText,
            icon: widget.leadingIcon,
            enabledBorder: UnderlineInputBorder(
              //borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 0),
            ),
          ),
          onTap: () {
            setState(() {
              widget.focusNode.requestFocus();
            });
          },
          focusNode: widget.focusNode,
          items: widget.items
              .map((region) =>
              DropdownMenuItem<String>(
                  child:
                  Text(
                    region,
                    style: TextStyle(color: Colors.black),
                  ),

                  value: region))
              .toList(),
          value: _selectedGender,
          onChanged: widget.onChange,
//              (value) {
//            setState(() {
//              _selectedGender = value;
//              // widget.focusNode.requestFocus();
//            });
//            print(value);
//          },
          //isExpanded: true,
        ),
      ),
    );

    return formWidget;
  }
}

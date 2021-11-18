import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_localizations.dart';

class MyCountryCPicker extends StatefulWidget {
  const MyCountryCPicker({Key? key}) : super(key: key);

  @override
  _MyCountryCPickerState createState() => _MyCountryCPickerState();
}

class _MyCountryCPickerState extends State<MyCountryCPicker> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: CountryCodePicker(
            onChanged: print,
            enabled: true,
           textStyle: TextStyle(fontSize: 20), 
            showDropDownButton: true,
            flagDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
            ),
            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
            initialSelection: 'PK',
            favorite: ['+92', 'PK'],
            // optional. Shows only country name and flag
            showCountryOnly: false,
            // optional. Shows only country name and flag when popup is closed.
            showOnlyCountryWhenClosed: false,
            // optional. aligns the flag and the Text left
            alignLeft: false,
          ),
        ),
      ),
    );
  }
}

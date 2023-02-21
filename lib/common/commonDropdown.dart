
import 'package:flutter/material.dart';


class CommonDropdown extends StatelessWidget {
   String? chosenValue;
  final String? hintText;
  final List<String>? itemsList;
  final Function(dynamic value)? onChanged;
  final String? Function(String?)? validator;
    CommonDropdown({
     Key? key,
     this.chosenValue,
     this.hintText,
     this.itemsList,
     this.onChanged,
     this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      elevation: 10,
      validator:validator,
      dropdownColor: Colors.white,
      isExpanded: true,
      hint: Text(hintText ?? '',),
      iconSize: 30,
      iconEnabledColor: Colors.black,
      icon: Icon(Icons.arrow_drop_up),
      value: chosenValue ,
      items: itemsList?.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged:onChanged,
    );
  }
}

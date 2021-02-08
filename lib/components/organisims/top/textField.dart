import 'package:flutter/material.dart';
import 'package:renda_clone/components/atoms/button.dart';
import 'package:renda_clone/util/hook/lengthLimit.dart';

const hintText = 'Enter Nickname...';
const submitText = "done";
const cancelText = "cancel";
const maxLength = 10;

class UserTextField extends StatelessWidget {
  final String userName;
  final String inputName;
  final Function closeDialog;
  final Function onChange;
  final Function createUser;
  final TextEditingController controller;
  UserTextField(
      {this.inputName,
      this.userName,
      this.onChange,
      this.closeDialog,
      this.createUser,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      child: Column(children: [
        Expanded(
            child: TextFormField(
          autofocus: true,
          controller: this.controller,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15.0, color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            isDense: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
            hintText: hintText,
            enabledBorder: UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.white),
              borderRadius: new BorderRadius.circular(25.7),
            ),
          ),
          inputFormatters: [
            LengthLimitingTextFieldFormatterFixed(maxLength),
          ],
          onChanged: (value) {
            this.onChange(value);
          },
        )),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
              width: 80,
              height: 30,
              child: Button(
                  text: submitText,
                  color: Colors.blue,
                  fontColor: Colors.black,
                  selected: true,
                  onTap: () => {
                        this.createUser(this.controller.text),
                        this.onChange(this.controller.text),
                        FocusScope.of(context).unfocus(),
                        this.closeDialog()
                      })),
          SizedBox(
              width: 80,
              height: 30,
              child: Button(
                  text: cancelText,
                  color: Colors.red,
                  fontColor: Colors.black,
                  selected: true,
                  onTap: () => {
                        this.controller.text = this.userName,
                        this.onChange(this.controller.text),
                        FocusScope.of(context).unfocus(),
                        this.closeDialog(),
                      })),
        ]),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:renda_clone/components/organisims/top/textField.dart';
// import 'package:renda_clone/components/atoms/input.dart';

const hintText = 'Enter Nickname...';
const submitText = "done";
const cancelText = "cancel";

class UserName extends StatefulWidget {
  final String name;
  final Function createUser;
  final double height;
  final double width;
  UserName(
      {@required this.name,
      this.createUser,
      @required this.width,
      @required this.height,
      Key key})
      : super(key: key);

  @override
  _UserNameState createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  String _name;
  TextEditingController _textEditingController;
  void _updateName(String name) {
    setState(() {
      _name = name;
    });
  }

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _textEditingController = TextEditingController(text: widget.name);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget textWidget = _name != ""
        ? Text(_name, style: TextStyle(color: Colors.black))
        : Text('Enter Nickname...', style: TextStyle(color: Colors.grey));
    Future<Null> _showDialog() async {
      await showDialog<String>(
          context: context,
          barrierColor: Colors.transparent,
          builder: (context) => Padding(
                padding: EdgeInsets.only(top: 200.0),
                child: AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    content: UserTextField(
                        inputName: _name,
                        userName: widget.name,
                        onChange: (String value) => _updateName(value),
                        createUser: (String value) => widget.createUser(value),
                        closeDialog: () => Navigator.pop(context),
                        controller: _textEditingController)),
              ));
    }

    return Container(
        height: widget.height,
        width: widget.width,
        child: GestureDetector(
            onTap: _showDialog,
            child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(child: textWidget))));
  }
}

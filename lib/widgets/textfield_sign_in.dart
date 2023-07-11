import 'package:flutter/material.dart';
import 'package:myapp/color_items.dart';
import 'package:myapp/pages/products_selling_page.dart';

class TextFieldSignIn extends StatefulWidget {
  const TextFieldSignIn({
    Key? key,
    this.hintText,
    this.textInputType,
    this.obscureText,
    this.maxLength,
    this.validator,
    this.textInputAction,
    this.textEditingController,
    this.suffixIcon,
    this.prefixIcon,
  }) : super(key: key);
  final String? hintText;
  final TextInputType? textInputType;
  final bool? obscureText;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final bool? suffixIcon;
  final Icon? prefixIcon;

  @override
  State<TextFieldSignIn> createState() => _TextFieldSignInState();
}

class _TextFieldSignInState extends State<TextFieldSignIn> {
  bool isOpen = true;
  void changeOpen() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 10),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color: ColorItems.mercury,
        shadowColor: ColorItems.hex,
        //elevation: 7,
        child: TextFormField(
            //initialValue: '+90',
            //autofocus: true,
            controller: widget.textEditingController,
            //autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator,
            maxLength: widget.maxLength,
            keyboardType: widget.textInputType,
            textInputAction: TextInputAction.next,
            //textInputAction:(widget.textInputAction == null) ? TextInputAction.next:widget.textInputAction,
            obscureText: isOpen ? (widget.obscureText ?? false) : false,
            decoration: InputDecoration(
                prefixIcon: widget.prefixIcon,
                suffixIcon: (widget.suffixIcon ?? false)
                    ? GestureDetector(
                    onTap: () {changeOpen();},
                    child: Icon(isOpen ? Icons.remove_red_eye :Icons.panorama_fish_eye_outlined)): null,
                label: Text(widget.hintText ?? ''),
                fillColor: Colors.transparent,
                //hintText: hintText,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)))),
      ),
    );
  }
}
//bidaha inkwell kullanma kardeşim !!!

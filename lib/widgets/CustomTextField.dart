import 'package:flutter/material.dart';

import '../Constants/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged});

  final String hint;

  final int maxLines;

  final void Function(String?)? onSaved;
  final Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        border: BuildBorder(),
        enabledBorder: BuildBorder(),
        focusedBorder: BuildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder BuildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}

// class CustomFormTextField extends StatelessWidget {
//   CustomFormTextField({this.hintText, this.onChanged, this.obs = false});
//   Function(String)? onChanged;
//   String? hintText;
//   bool? obs = true;
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       obscureText: obs!,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return 'Fireld is required';
//         }
//       },
//       onChanged: onChanged,
//       decoration: InputDecoration(
//         hintText: hintText,
//         hintStyle: TextStyle(color: Colors.white),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.white,
//           ),
//         ),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.red,
//           ),
//         ),
//       ),
//     );
//   }
// }

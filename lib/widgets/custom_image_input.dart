// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomImageInput extends StatefulWidget {
  final String label;
  final TextEditingController imageController;

  const CustomImageInput({
    Key? key,
    required this.label,
    required this.imageController,
  }) : super(key: key);

  @override
  State<CustomImageInput> createState() => _CustomImageInputState();
}

class _CustomImageInputState extends State<CustomImageInput> {
  var image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: image != null && image.isNotEmpty
              ? Image.network(
                  image,
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                )
              : Center(child: Text("Rasm kiriting")),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextField(
            controller: widget.imageController,
            decoration: InputDecoration(
              labelText: widget.label,
            ),
            onSubmitted: (value) {
              setState(() {
                image = value.toString();
              });
            },
          ),
        ),
      ],
    );
  }
}

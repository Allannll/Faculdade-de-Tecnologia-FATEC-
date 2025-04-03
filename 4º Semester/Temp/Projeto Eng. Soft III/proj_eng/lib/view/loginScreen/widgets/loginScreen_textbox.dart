import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreenTextBox extends StatelessWidget {
  const LoginScreenTextBox({
    super.key, 
    required this.text
    });

  final String text;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFF2F2F2),
              suffixIcon: Icon(Icons.check, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
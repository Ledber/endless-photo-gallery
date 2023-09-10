import 'package:flutter/material.dart';

class LikeButtonWidget extends StatelessWidget {
  final bool isLiked;
  final VoidCallback onPressed;

  LikeButtonWidget({required this.isLiked, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Row(
        children: [
          const Spacer(),
          ElevatedButton.icon(
            icon: isLiked
                ? Icon(Icons.thumb_up, color: Colors.white)
                : Icon(Icons.thumb_up_alt_outlined, color: Colors.red),
            style: ElevatedButton.styleFrom(
              elevation: 5,
              foregroundColor: isLiked ? Colors.white : Colors.red,
              backgroundColor: isLiked ? Colors.red : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            label: isLiked
                ? Text('1')
                : Text('0'),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({ Key? key, required this.imageUrl }) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(
                  0,
                  10,
                ),
                spreadRadius: -8
              )
            ],
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover
            ),
          ),
        );
  }
}
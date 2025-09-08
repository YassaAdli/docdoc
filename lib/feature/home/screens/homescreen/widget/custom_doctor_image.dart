import 'package:Docdoc/core/utils/image_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomDoctorImage extends StatelessWidget {
  const CustomDoctorImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 1,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          errorWidget: (context, url, error) => Stack(children: [
            Image.asset(TImage.testCard, width: 110, height: 110),
            Positioned(top: 0,left: 0,right:0,bottom: 0,  child: Icon(Icons.error, color: Colors.red),),
          ],),

        ),
      ),
    );
  }
}

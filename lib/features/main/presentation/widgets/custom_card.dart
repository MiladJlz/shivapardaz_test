import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../domain/entities/photo.dart';

class CustomCard extends StatefulWidget {
  final Photo photo;

  const CustomCard({super.key, required this.photo});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const Text(
                      Constants.albumIDText,
                      style: TextStyle(fontSize: Constants.primaryFontSize),
                    ),
                    Text(
                      widget.photo.id.toString(),
                      style: const TextStyle(
                          fontSize: Constants.secondaryFontSize),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      Constants.titleText,
                      style: TextStyle(fontSize: Constants.primaryFontSize),
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        widget.photo.title ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: Constants.secondaryFontSize),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10000.0),
              child: CachedNetworkImage(
                width: 50,
                height: 50,
                imageUrl: "${widget.photo.thumbnailUrl}",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/video_model.dart';

Widget videoCard(Video video) {
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      // Calculate responsive values based on the available constraints
      final double cardWidth = constraints.maxWidth;
      final double cardHeight = cardWidth * 1.3;
      final double thumbnailHeight = cardHeight;

      return InkWell(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: cardWidth,
                    height: thumbnailHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.grey,
                      image: DecorationImage(
                        image: NetworkImage(video.thumbnail),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          video.title,
                          style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 16)
                        ),
                        Text('${video.reactionCount} reactions', style: GoogleFonts.roboto(fontSize: 14),),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

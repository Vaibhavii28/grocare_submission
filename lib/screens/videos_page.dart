import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocare_submission/provider/video_provider.dart';
import 'package:grocare_submission/utils/api_call.dart';
import 'package:provider/provider.dart';
import '../utils/video_card.dart';
import 'home_page.dart';
import 'package:number_paginator/number_paginator.dart';


class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
 // List<Video> videosFuture = [];
  int numberOfPages = 6;
  ValueNotifier<int> currentPage = ValueNotifier<int>(0);


  @override
  void initState() {
    super.initState();
    updateVideos();
    //fetchVideos2();
  }


  Future<void> updateVideos() async {
    final videoProvider= Provider.of<VideoProvider>(context, listen: false);
    videoProvider.videos = await fetchVideos(currentPage.value);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF5957d3),
          title: Text('Flutter Shorts', style: GoogleFonts.allura(fontSize: 35, fontWeight: FontWeight.bold),),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.camera_alt))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: Consumer<VideoProvider>(
                  builder: (context, value, child) {
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 0.6,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: value.videos.length,
                      itemBuilder: (context, index) {
                        final video = value.videos[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return HomePage(
                                  currentpage: currentPage.value,
                                  currentindex: index,
                                );
                              }),
                            );
                          },
                          child: videoCard(video),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: currentPage,
              builder: (context, value, child) {
                return NumberPaginator(
                  config: NumberPaginatorUIConfig(
                    buttonSelectedBackgroundColor: const Color(0xFF5957d3),
                    buttonSelectedForegroundColor: Colors.white,
                    // buttonUnselectedBackgroundColor: Colors.grey[700],
                    buttonUnselectedForegroundColor: Colors.grey,
                    buttonShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  numberPages: numberOfPages,
                  onPageChange: (index) async {
                    currentPage.value = index;
                    await updateVideos();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

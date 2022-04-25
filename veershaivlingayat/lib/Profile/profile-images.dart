import 'package:flutter/material.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;

class ProfileImages extends StatefulWidget {
  String pageTitle;
  List<String> images;
  ProfileImages({Key? key, required this.pageTitle, required this.images})
      : super(key: key);

  @override
  _ProfileImagesState createState() => _ProfileImagesState();
}

class _ProfileImagesState extends State<ProfileImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
        backgroundColor: Color(c.appColor),
      ),
      body: Center(
          child: SizedBox.fromSize(
        size: const Size.fromHeight(550.0),
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.8),
          itemCount: widget.images.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    InteractiveViewer(
                      minScale: 0.1,
                      maxScale: 2.5,
                      child: Image.network(
                        widget.images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}

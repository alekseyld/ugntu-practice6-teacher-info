import 'dart:io';

import 'package:file_icon/file_icon.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PhotoCard extends StatefulWidget {
  PhotoCard({Key? key}) : super(key: key);

  @override
  PhotoCardState createState() => PhotoCardState();
}

class PhotoCardState extends State<PhotoCard> {
  List<String> photoPathList = [];

  void _navigateTakePicturePage(BuildContext context) async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        setState(() {
          photoPathList.addAll(result.files
              .map((e) => e.name ?? "")
              .where((element) => element.isNotEmpty));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding:
            const EdgeInsets.only(right: 16, left: 16, top: 27, bottom: 27),
        height: 180,
        child: ListView.builder(
          itemCount: photoPathList.length + 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (index == 0) {
              return GestureDetector(
                onTap: () => _navigateTakePicturePage(context),
                child: Container(
                  height: 125,
                  width: 125,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    color: Color(0xFFC4C4C4),
                    child: Icon(
                      Icons.file_upload,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }

            return Container(
              height: 125,
              width: 125,
              margin: EdgeInsets.all(4.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Stack(
                  children: [
                    Center(
                      child: FileIcon(
                        photoPathList[index - 1],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          photoPathList[index - 1],
                          style: TextStyle(fontSize: 11),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

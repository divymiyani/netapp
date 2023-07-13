import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:netapp/image_store.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  late ImageStore imageStore;

  @override
  void initState() {
    super.initState();
    imageStore = ImageStore();
    imageStore.getData();
  }

  @override
  Widget build(BuildContext context) {
    final _samplePostsImageList = imageStore.samplePostsImages;
    return Scaffold(
      body: Observer(
        builder: (context) {
          if (_samplePostsImageList.isNotEmpty) {
            return ListView.builder(
              itemCount: _samplePostsImageList.length,
              itemBuilder: (context, index) {
                final samplePostImage = _samplePostsImageList[index];

                return Container(
                  height: 670,
                  color: Colors.grey[100],
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AlbumId : ${samplePostImage.albumId}',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Id : ${samplePostImage.id}',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Title : ${samplePostImage.title}',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.network(samplePostImage.url),
                      Image.network(samplePostImage.thumbnailUrl),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

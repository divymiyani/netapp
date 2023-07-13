import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:netapp/sample_post_image.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  final _samplePostsImages = ObservableList<SamplePostImages>();

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (_samplePostsImages.isNotEmpty) {
          return ListView.builder(
            itemCount: _samplePostsImages.length,
            itemBuilder: (context, index) {
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
                      'AlbumId : ${_samplePostsImages[index].albumId}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Id : ${_samplePostsImages[index].id}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Title : ${_samplePostsImages[index].title}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.network(_samplePostsImages[index].url),
                    Image.network(_samplePostsImages[index].thumbnailUrl),
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
    );
  }

  Future<void> getData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());
      final newPostsImages = List<SamplePostImages>.from(
          data.map((x) => SamplePostImages.fromJson(x)));

      _samplePostsImages.addAll(newPostsImages);
    }
  }
}

import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:netapp/sample_post_image.dart';
import 'package:http/http.dart' as http;

part 'image_store.g.dart';

class ImageStore = _ImageStore with _$ImageStore;

abstract class _ImageStore with Store {
  @observable
  ObservableList<SamplePostImages> samplePostsImages =
      ObservableList<SamplePostImages>.of([]);

  @action
  void setSamplePostsImages(List<SamplePostImages> images) {
    samplePostsImages.clear();
    samplePostsImages.addAll(images);
  }

  @action
  Future<void> getData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());
      final newPostsImages = List<SamplePostImages>.from(
          data.map((x) => SamplePostImages.fromJson(x)));

      setSamplePostsImages(newPostsImages);
    }
  }
}

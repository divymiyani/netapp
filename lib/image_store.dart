import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:netapp/sample_post_image.dart';
import 'package:http/http.dart' as http;

part 'image_store.g.dart';

class ImageStore = _ImageStore with _$ImageStore;

abstract class _ImageStore with Store {
  int currentPage = 1;
  int itemsPerPage = 10;
  int loadedPages = 0;
  int loadedPagesLimit = 6;
  int totalPages = 10;

  @observable
  ObservableList<SamplePostImages> samplePostsImages =
      ObservableList<SamplePostImages>.of([]);

  @action
  void setSamplePostsImages(List<SamplePostImages> data) {
    samplePostsImages.addAll(data);
  }

  @action
  Future<void> getData() async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/users?_page=$currentPage&_limit=$itemsPerPage'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final newPostsImages = List<SamplePostImages>.from(
          data.map((x) => SamplePostImages.fromJson(x)));

      setSamplePostsImages(newPostsImages);
    }

    loadedPages++;
  }

  @action
  void loadMoreData() {
    if (loadedPages < loadedPagesLimit) {
      getData();
    }
  }

  @action
  void reset() {
    currentPage = 1;
    loadedPages = 0;
    samplePostsImages.clear();
  }
}





// import 'dart:convert';
// import 'package:mobx/mobx.dart';
// import 'package:netapp/sample_post_image.dart';
// import 'package:http/http.dart' as http;

// part 'image_store.g.dart';

// class ImageStore = _ImageStore with _$ImageStore;

// abstract class _ImageStore with Store {
//   int currentPage = 1;
//   int itemsPerPage = 10;
//   int loadedPages = 0;
//   int loadedPagesLimit = 6;

//   @observable
//   ObservableList<SamplePostImages> samplePostsImages =
//       ObservableList<SamplePostImages>.of([]);

//   @action
//   void setSamplePostsImages(List<SamplePostImages> data) {
//     samplePostsImages.addAll(data);
//   }

//   @action
//   Future<void> getData() async {
//     final response = await http.get(Uri.parse(
//         'https://jsonplaceholder.typicode.com/users?_page=$currentPage&_limit=$itemsPerPage'));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       final newPostsImages = List<SamplePostImages>.from(
//           data.map((x) => SamplePostImages.fromJson(x)));

//       setSamplePostsImages(newPostsImages);
//     }

//     loadedPages++;
//   }

//   @action
//   void loadMoreData() {
//     if (loadedPages < loadedPagesLimit && currentPage <= loadedPages) {
//       getData();
//     }
//   }

//   @action
//   void showRemainingPages() {
//     if (loadedPages >= loadedPagesLimit) {
//       currentPage = loadedPages + 1;
//     }
//   }
// }

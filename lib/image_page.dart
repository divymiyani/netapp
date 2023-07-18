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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    imageStore = ImageStore();
    imageStore.getData();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      imageStore.loadMoreData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _samplePostsImageList = imageStore.samplePostsImages;
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.blue, child: const Text('NetApp')),
      ),
      body: Observer(
        builder: (context) {
          if (_samplePostsImageList.isNotEmpty) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: _samplePostsImageList.length + 1, //indicator
              itemBuilder: (context, index) {
                if (index < _samplePostsImageList.length) {
                  final samplePostImage = _samplePostsImageList[index];

                  return Container(
                    color: Colors.grey[100],
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Id : ${samplePostImage.id}',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Name : ${samplePostImage.name}',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Email : ${samplePostImage.email}',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Phone : ${samplePostImage.phone}',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'WebSite : ${samplePostImage.website}',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Company Name : ${samplePostImage.company.name}',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Address : ${samplePostImage.address.suite},${samplePostImage.address.street} ${samplePostImage.address.city} - ${samplePostImage.address.zipcode}',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (imageStore.loadedPagesLimit !=
                    imageStore.loadedPages) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return null;
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}



















// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:netapp/image_store.dart';

// class ImagePage extends StatefulWidget {
//   const ImagePage({Key? key}) : super(key: key);

//   @override
//   _ImagePageState createState() => _ImagePageState();
// }

// class _ImagePageState extends State<ImagePage> {
//   late ImageStore imageStore;
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     imageStore = ImageStore();
//     imageStore.getData();
//     _scrollController.addListener(_scrollListener);
//   }

//   @override
//   void dispose() {
//     _scrollController.removeListener(_scrollListener);
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _scrollListener() {
//     if (_scrollController.position.pixels ==
//         _scrollController.position.maxScrollExtent) {
//       imageStore.loadMoreData();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final _samplePostsImageList = imageStore.samplePostsImages;
//     return Scaffold(
//       appBar: AppBar(
//         title: Title(color: Colors.blue, child: const Text('NetApp')),
//       ),
//       body: Observer(
//         builder: (context) {
//           if (_samplePostsImageList.isNotEmpty) {
//             return ListView.builder(
//               controller: _scrollController,
//               itemCount: _samplePostsImageList.length +
//                   1, // Add 1 for progress indicator
//               itemBuilder: (context, index) {
//                 if (index < _samplePostsImageList.length) {
//                   final samplePostImage = _samplePostsImageList[index];

//                   return Container(
//                     height: 670,
//                     color: Colors.grey[100],
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 10, horizontal: 10),
//                     margin: const EdgeInsets.all(10),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'AlbumId : ${samplePostImage.albumId}',
//                           style: const TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         Text(
//                           'Id : ${samplePostImage.id}',
//                           style: const TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         Text(
//                           'Title : ${samplePostImage.title}',
//                           style: const TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         Image.network(samplePostImage.url),
//                         Image.network(samplePostImage.thumbnailUrl),
//                       ],
//                     ),
//                   );
//                 } else if (imageStore.currentPage != 1) {
//                   // Show progress indicator if there are more pages to load
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else {
//                   // If the list is empty and there are no more pages, show a message
//                   return const Center(
//                     child: Text('No data available.'),
//                   );
//                 }
//               },
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }








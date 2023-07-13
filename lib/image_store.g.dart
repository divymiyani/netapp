// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImageStore on _ImageStore, Store {
  late final _$samplePostsImagesAtom =
      Atom(name: '_ImageStore.samplePostsImages', context: context);

  @override
  ObservableList<SamplePostImages> get samplePostsImages {
    _$samplePostsImagesAtom.reportRead();
    return super.samplePostsImages;
  }

  @override
  set samplePostsImages(ObservableList<SamplePostImages> value) {
    _$samplePostsImagesAtom.reportWrite(value, super.samplePostsImages, () {
      super.samplePostsImages = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_ImageStore.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_ImageStoreActionController =
      ActionController(name: '_ImageStore', context: context);

  @override
  void setSamplePostsImages(List<SamplePostImages> images) {
    final _$actionInfo = _$_ImageStoreActionController.startAction(
        name: '_ImageStore.setSamplePostsImages');
    try {
      return super.setSamplePostsImages(images);
    } finally {
      _$_ImageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
samplePostsImages: ${samplePostsImages}
    ''';
  }
}

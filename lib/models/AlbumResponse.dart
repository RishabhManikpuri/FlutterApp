import 'Album.dart';

class AlbumList {
  final List<Album> albumList;

  AlbumList({
    this.albumList,
  });

  factory AlbumList.fromJson(List<dynamic> parsedJson) {
    List<Album> mAlbumList = new List<Album>();

    return new AlbumList(
      albumList: mAlbumList,
    );
  }
}

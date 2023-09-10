import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inf_gallery/model/galleryModel.dart';
import 'package:inf_gallery/api/apiConstants.dart';

class Repository {
  static Repository? repo;

  static Repository getInstance() {
    repo ??= Repository();
    return repo!;
  }

  Future<List<Gallery>> loadGalleryPage(int page) async {
    final url = Uri.parse("$apiURL/?client_id=$apiKEY&page=$page");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return _parseGalleryResponse(response);
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  List<Gallery> _parseGalleryResponse(response) {
    if (response.statusCode == 200) {
      final body = utf8.decode(response.bodyBytes);
      final list = jsonDecode(body) as List;
      return list.map((item) {
        final id = item["id"];
        final urls = Urls(item["urls"]["regular"]);
        final userName = item["user"]["name"];
        final isLiked = false;
        return Gallery(id, urls, User(userName), isLiked);
      }).toList();
    } else {
      throw Exception("failed request");
    }
  }
}
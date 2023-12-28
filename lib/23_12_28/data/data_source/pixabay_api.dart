import 'dart:convert';

import '../dto/pixabaydto.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  Future<PixabayDto> getImagesResult(String query) async {
    final response = await http.get(Uri.parse('https://pixabay.com/api/?key=41482985-c526f1f433dbd01f22f58e852&q=$query&image_type=photo&pretty=true'));
    return PixabayDto.fromJson(jsonDecode(response.body));
  }
}
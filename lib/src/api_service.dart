import 'package:http/http.dart' as http;

import 'emoji_model.dart';

/// Data source URL
const dataSource = 'https://raw.githubusercontent.com/missive/emoji-mart/master/data/all.json';

/// Fetch available emojis from the remote data source
Future<String> fetchEmojis() async {
  final url = Uri.parse(dataSource);
  final response = await http.get(url);
  print(response.body);
  final emoji = emojiFromJson(response.body);
  return response.body;
}
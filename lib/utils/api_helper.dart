import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/custom_audio_model.dart';

class Apihelper {
  Apihelper._();

  static final Apihelper helper = Apihelper._();

  Future<AudioModel> getApi() async {
    String link = "http://api.audiokumbh.in/mobile/homepage/get";
    var response = await http.post(Uri.parse(link),
        headers: {
          "Content-Type": "application/json",
          "x-auth-token":
              "U2FsdGVkX18HncEy8lhKLk8pIVKWYTPwcNC/FQhb+EphURd+k7F1SJFeL8V1jMomgnHTBkMw3oO3yqjXeNq3ORa/LDRnS7mA2HtkxuWLQghkGfXnypKL3QLkQMd/cT9HFd6LjWizDjBi1G7w7MDUNyG2kDOQr/6Z9uSyK2Zku8X8tKL/yBjw/vkCWPCYeKMXz5wZw+oNObR9pcuXHIv+p7PRlkIrbGiqtdtJQ7h6OQ3zRLHeFQDFVqwDdqUA9gv7"
        },
        body: jsonEncode({"useFor": "audiobook"}));
    var json = jsonDecode(response.body);
    print(json);
    AudioModel audioModel = AudioModel.fromJson(json);
    return audioModel;
  }
}

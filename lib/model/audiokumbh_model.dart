// To parse this JSON data, do
//
//     final audioModel = audioModelFromJson(jsonString);

import 'dart:convert';

AudioModel audioModelFromJson(String str) =>
    AudioModel.fromJson(json.decode(str));

String audioModelToJson(AudioModel data) => json.encode(data.toJson());

class AudioModel {
  Data data;

  AudioModel({
    required this.data,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) => AudioModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  List<Banner> banner;
  List<Category> category;
  List<Section> section;
  List<Language> language;

  Data({
    required this.banner,
    required this.category,
    required this.section,
    required this.language,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        banner:
            List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
        section:
            List<Section>.from(json["section"].map((x) => Section.fromJson(x))),
        language: List<Language>.from(
            json["language"].map((x) => Language.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "section": List<dynamic>.from(section.map((x) => x.toJson())),
        "language": List<dynamic>.from(language.map((x) => x.toJson())),
      };
}

class Banner {
  String id;
  String useFor;
  String img;
  String linkType;
  String audioBook;
  dynamic podCast;
  dynamic song;
  dynamic author;
  dynamic publisher;
  dynamic speaker;
  dynamic video;
  dynamic url;
  int position;
  int status;
  DateTime startScheduleTime;
  DateTime endScheduleTime;
  DateTime createdAt;
  int v;

  Banner({
    required this.id,
    required this.useFor,
    required this.img,
    required this.linkType,
    required this.audioBook,
    required this.podCast,
    required this.song,
    required this.author,
    required this.publisher,
    required this.speaker,
    required this.video,
    required this.url,
    required this.position,
    required this.status,
    required this.startScheduleTime,
    required this.endScheduleTime,
    required this.createdAt,
    required this.v,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["_id"],
        useFor: json["useFor"],
        img: json["img"],
        linkType: json["linkType"],
        audioBook: json["audioBook"],
        podCast: json["podCast"],
        song: json["song"],
        author: json["author"],
        publisher: json["publisher"],
        speaker: json["speaker"],
        video: json["video"],
        url: json["url"],
        position: json["position"],
        status: json["status"],
        startScheduleTime: DateTime.parse(json["startScheduleTime"]),
        endScheduleTime: DateTime.parse(json["endScheduleTime"]),
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "useFor": useFor,
        "img": img,
        "linkType": linkType,
        "audioBook": audioBook,
        "podCast": podCast,
        "song": song,
        "author": author,
        "publisher": publisher,
        "speaker": speaker,
        "video": video,
        "url": url,
        "position": position,
        "status": status,
        "startScheduleTime": startScheduleTime.toIso8601String(),
        "endScheduleTime": endScheduleTime.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
      };
}

class Category {
  String? shareMessage;
  String id;
  String name;
  String img;
  int v;
  String useFor;
  int total;
  DateTime createdAt;
  int position;

  Category({
    required this.shareMessage,
    required this.id,
    required this.name,
    required this.img,
    required this.v,
    required this.useFor,
    required this.total,
    required this.createdAt,
    required this.position,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        shareMessage: json["shareMessage"],
        id: json["_id"],
        name: json["name"],
        img: json["img"],
        v: json["__v"],
        useFor: json["useFor"],
        total: json["total"],
        createdAt: DateTime.parse(json["createdAt"]),
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "shareMessage": shareMessage,
        "_id": id,
        "name": name,
        "img": img,
        "__v": v,
        "useFor": useFor,
        "total": total,
        "createdAt": createdAt.toIso8601String(),
        "position": position,
      };
}

class Language {
  String id;
  String name;
  int status;
  DateTime createdAt;
  int position;

  Language({
    required this.id,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.position,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["_id"],
        name: json["name"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "position": position,
      };
}

class Section {
  String id;
  String useFor;
  String title;
  String type;
  List<AudioBook> audioBook;
  List<dynamic> podCast;
  List<dynamic> song;
  List<AuthorElement> author;
  List<Publisher> publisher;
  List<dynamic> speaker;
  dynamic banner;
  int position;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Section({
    required this.id,
    required this.useFor,
    required this.title,
    required this.type,
    required this.audioBook,
    required this.podCast,
    required this.song,
    required this.author,
    required this.publisher,
    required this.speaker,
    required this.banner,
    required this.position,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["_id"],
        useFor: json["useFor"],
        title: json["title"],
        type: json["type"],
        audioBook: List<AudioBook>.from(
            json["audioBook"].map((x) => AudioBook.fromJson(x))),
        podCast: List<dynamic>.from(json["podCast"].map((x) => x)),
        song: List<dynamic>.from(json["song"].map((x) => x)),
        author: List<AuthorElement>.from(
            json["author"].map((x) => AuthorElement.fromJson(x))),
        publisher: List<Publisher>.from(
            json["publisher"].map((x) => Publisher.fromJson(x))),
        speaker: List<dynamic>.from(json["speaker"].map((x) => x)),
        banner: json["banner"],
        position: json["position"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "useFor": useFor,
        "title": title,
        "type": type,
        "audioBook": List<dynamic>.from(audioBook.map((x) => x.toJson())),
        "podCast": List<dynamic>.from(podCast.map((x) => x)),
        "song": List<dynamic>.from(song.map((x) => x)),
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "publisher": List<dynamic>.from(publisher.map((x) => x.toJson())),
        "speaker": List<dynamic>.from(speaker.map((x) => x)),
        "banner": banner,
        "position": position,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class AudioBook {
  String id;
  String name;
  AudioBookAuthor author;
  String img;
  dynamic tag;
  int forGuestUser;
  int isLive;

  AudioBook({
    required this.id,
    required this.name,
    required this.author,
    required this.img,
    required this.tag,
    required this.forGuestUser,
    required this.isLive,
  });

  factory AudioBook.fromJson(Map<String, dynamic> json) => AudioBook(
        id: json["_id"],
        name: json["name"],
        author: AudioBookAuthor.fromJson(json["author"]),
        img: json["img"],
        tag: json["tag"],
        forGuestUser: json["forGuestUser"],
        isLive: json["isLive"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "author": author.toJson(),
        "img": img,
        "tag": tag,
        "forGuestUser": forGuestUser,
        "isLive": isLive,
      };
}

class AudioBookAuthor {
  String id;
  String name;

  AudioBookAuthor({
    required this.id,
    required this.name,
  });

  factory AudioBookAuthor.fromJson(Map<String, dynamic> json) =>
      AudioBookAuthor(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}

class AuthorElement {
  String id;
  String name;
  String? jobTitle;
  String img;
  String? about;
  int v;
  int totalAudiobook;

  AuthorElement({
    required this.id,
    required this.name,
    required this.jobTitle,
    required this.img,
    required this.about,
    required this.v,
    required this.totalAudiobook,
  });

  factory AuthorElement.fromJson(Map<String, dynamic> json) => AuthorElement(
        id: json["_id"],
        name: json["name"],
        jobTitle: json["jobTitle"],
        img: json["img"],
        about: json["about"],
        v: json["__v"],
        totalAudiobook: json["totalAudiobook"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "jobTitle": jobTitle,
        "img": img,
        "about": about,
        "__v": v,
        "totalAudiobook": totalAudiobook,
      };
}

class Publisher {
  String id;
  String name;
  String img;
  int v;
  String location;
  int totalAudiobook;

  Publisher({
    required this.id,
    required this.name,
    required this.img,
    required this.v,
    required this.location,
    required this.totalAudiobook,
  });

  factory Publisher.fromJson(Map<String, dynamic> json) => Publisher(
        id: json["_id"],
        name: json["name"],
        img: json["img"],
        v: json["__v"],
        location: json["location"],
        totalAudiobook: json["totalAudiobook"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "img": img,
        "__v": v,
        "location": location,
        "totalAudiobook": totalAudiobook,
      };
}

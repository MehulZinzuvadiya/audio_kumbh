class AudioModel {
  Data data;

  AudioModel({
    required this.data,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) => AudioModel(
        data: Data.fromJson(json["data"]),
      );
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
        banner: List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
        category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
        section: List<Section>.from(json["section"].map((x) => Section.fromJson(x))),
        language: List<Language>.from(json["language"].map((x) => Language.fromJson(x))),
      );
}

class Banner {
  String img;

  Banner({
    required this.img,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        img: json["img"],
      );
}

class Category {
  String name;
  String img;
  String useFor;
  int total;

  Category({
    required this.name,
    required this.img,
    required this.useFor,
    required this.total,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        img: json["img"],
        useFor: json["useFor"],
        total: json["total"],
      );
}

class Language {
  String name;

  Language({
    required this.name,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: json["name"],
      );
}

class Section {
  String title;
  String type;
  List<AudioBook> audioBook;
  List<AuthorElement> author;
  List<Publisher> publisher;
  bool isShow = true;

  Section({
    required this.title,
    required this.type,
    required this.audioBook,
    required this.author,
    required this.publisher,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        title: json["title"],
        type: json["type"],
        audioBook: List<AudioBook>.from(json["audioBook"].map((x) => AudioBook.fromJson(x))),
        author: List<AuthorElement>.from(json["author"].map((x) => AuthorElement.fromJson(x))),
        publisher: List<Publisher>.from(json["publisher"].map((x) => Publisher.fromJson(x))),
      );
}

class AudioBook {
  String name;
  AudioBookAuthor author;
  String img;
  bool isHide;

  AudioBook({
    required this.isHide,
    required this.name,
    required this.author,
    required this.img,
  });

  factory AudioBook.fromJson(Map<String, dynamic> json) => AudioBook(
        name: json["name"],
        author: AudioBookAuthor.fromJson(json["author"]),
        img: json["img"],
        isHide: false,
      );
}

class AudioBookAuthor {
  String name;

  AudioBookAuthor({
    required this.name,
  });

  factory AudioBookAuthor.fromJson(Map<String, dynamic> json) => AudioBookAuthor(
        name: json["name"],
      );
}

class AuthorElement {
  String name;
  String img;

  AuthorElement({
    required this.name,
    required this.img,
  });

  factory AuthorElement.fromJson(Map<String, dynamic> json) => AuthorElement(
        name: json["name"],
        img: json["img"],
      );
}

class Publisher {
  String name;
  String img;

  Publisher({
    required this.name,
    required this.img,
  });

  factory Publisher.fromJson(Map<String, dynamic> json) => Publisher(
        name: json["name"],
        img: json["img"],
      );
}

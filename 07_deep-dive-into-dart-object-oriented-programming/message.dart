abstract class Message {
  String get sender;
  String get content;
  DateTime get timestamp;

  void display();
  String printMessage();

  // void display() {
  //   print('Hello');
  // };
}

class TextMessage extends Message {
  final String sender;
  final String content;
  final DateTime timestamp;

  TextMessage(this.sender, this.content, this.timestamp);

  @override
  void display() {
    print('[$timestamp] $sender: $content');
  }

  @override
  String printMessage() {
    return content;
  }
}

class ImageMessage extends Message {
  final String sender;
  final String imageUrl;
  final DateTime timestamp;

  ImageMessage(this.sender, this.imageUrl, this.timestamp);

  @override
  void display() {
    print('[$timestamp] $sender sent an image: $imageUrl');
  }

  @override
  String printMessage() {
    return imageUrl;
  }

  @override
  String get content => imageUrl;
}

class CarouselItem {
  final String tag;
  final String title;
  final String imageUrl;
  final String description;
  final String url;

  CarouselItem({
    required this.tag,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.url,
  });

  static Map<String, List<CarouselItem>> categorizedItems = {};

  factory CarouselItem.fromJson(Map<String, dynamic> json) {
    return CarouselItem(
      tag: json['tag'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      url: json['url'],
    );
  }

  static void categorizeItems(List<CarouselItem> items) {
    for (var item in items) {
      categorizedItems.putIfAbsent(item.tag, () => []).add(item);
    }
  }
}

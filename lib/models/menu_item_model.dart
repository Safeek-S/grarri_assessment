class MenuItem {
  final int id;
  final String name;
  final String category;
  final String imagePath;
  bool isSpecial;
  int count;

  MenuItem({required this.id , required this.name, required this.category, this.count = 0, this.isSpecial = false, required this.imagePath});
  MenuItem copyWith({
    int? id,
    String? name,
    String? category,
    int? count,
    String? imagePath,
    bool? isSpecial,
  }) {
    return MenuItem(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      count: count ?? this.count,
      imagePath: imagePath ?? this.imagePath,
      isSpecial: isSpecial ?? this.isSpecial,
    );
  }
}
class Category {
  final String id;
  final String name;
  final String icon; // Icon name or asset path
  final String description;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    this.description = '',
  });
}

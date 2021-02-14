abstract class Entity {
  final createdAt = DateTime.now();
  final updatedAt = DateTime.now();

  static String createdAtColumn = "created_at";
  static String updatedAtColumn = "updated_at";

  Entity();

  static String createColumnsSql = """
    $createdAtColumn TEXT
    , $updatedAtColumn TEXT
  """;
}

class Entity {
  final createdAt = DateTime.now();
  final updatedAt = DateTime.now();

  static String createdAtColumn = "created_at";
  static String updatedAtColumn = "updated_at";

  Entity(createdAt, updatedAt);
  Entity.make();

  static String createEntityColumnsSql = """
    , $createdAtColumn TEXT
    , $updatedAtColumn TEXT
  """;

  static Entity fromMap(Map<String, dynamic> entityMap) {
    var entity = Entity(entityMap[createdAtColumn], entityMap[updatedAtColumn]);

    return entity;
  }

  Map<String, dynamic> toMap() {
    var entityMap = Map<String, dynamic>();

    entityMap[Entity.createdAtColumn] = this.createdAt.toString();
    entityMap[Entity.updatedAtColumn] = this.updatedAt.toString();

    return entityMap;
  }
}

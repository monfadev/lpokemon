class Pokemon {
  Pokemon({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: (json["name"] == null) ? null : json["name"],
        url: (json["url"] == null) ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": (name == null) ? null : name,
        "url": (url == null) ? null : url,
      };
}

class Tourism {
  final int id;
  final String name;
  final String description;
  final String address;
  final double longitude;
  final double latitude;
  final int like;
  final String image;

  Tourism({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.like,
    required this.image,
  });

  factory Tourism.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "id": int id,
        "name": String name,
        "description": String description,
        "address": String address,
        "longitude": double longitude,
        "latitude": double latitude,
        "like": int like,
        "image": String image,
      } =>
        Tourism(
          id: id,
          name: name,
          description: description,
          address: address,
          longitude: longitude,
          latitude: latitude,
          like: like,
          image: image,
        ),
      _ => throw const FormatException('Failed to load tourism data.'),
    };
  }

  // todo-01-local-2: create a method to convert a class into map object
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "description": description,
      "address": address,
      "longitude": longitude,
      "latitude": latitude,
      "like": like,
      "image": image,
    };
  }
}

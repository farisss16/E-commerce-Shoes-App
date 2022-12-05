class Products {
  int? id;
  String? name;
  String? image;
  int? harga;

  Products(
      {required this.id,
      required this.name,
      required this.image,
      required this.harga});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['harga'] = this.harga;
    return data;
  }
}

class Details {
  String? price;
  String? description;
  String? color;

  Details({this.price, this.description, this.color});

  Details.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    description = json['description'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['description'] = this.description;
    data['color'] = this.color;
    return data;
  }
}
class Address {
  String? postalCode;
  String? city;

  Address({this.postalCode, this.city});

  Address.fromJson(Map<String, dynamic> json) {
    postalCode = json['postalCode'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postalCode'] = this.postalCode;
    data['city'] = this.city;
    return data;
  }
}
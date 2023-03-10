class Orders {
  String? createdAt;
  String? id;
  String? customerId;

  Orders({this.createdAt, this.id, this.customerId});

  Orders.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    id = json['id'];
    customerId = json['customerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['id'] = this.id;
    data['customerId'] = this.customerId;
    return data;
  }
}
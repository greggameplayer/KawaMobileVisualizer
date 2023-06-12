class TokenValidation {
  String? expiryDate;
  bool? valid;
  bool? expired;

  TokenValidation({this.expiryDate, this.valid, this.expired});

  TokenValidation.fromJson(Map<String, dynamic> json) {
    expiryDate = json['expiryDate'];
    valid = json['valid'];
    expired = json['expired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expiryDate'] = this.expiryDate;
    data['valid'] = this.valid;
    data['expired'] = this.expired;
    return data;
  }
}
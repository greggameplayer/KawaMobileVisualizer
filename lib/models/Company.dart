class Company {
  String? companyName;

  Company({this.companyName});

  Company.fromJson(Map<String, dynamic> json) {
    companyName = json['companyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyName'] = this.companyName;
    return data;
  }
}
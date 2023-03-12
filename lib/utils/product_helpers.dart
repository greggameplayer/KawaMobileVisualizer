import 'package:kawa_mobile_visualizer/models/Details.dart';
import 'package:kawa_mobile_visualizer/models/Product.dart';

Product getMockProduct() {
  return Product(
    id: "1",
    name: "Rex Bailey",
    details: Details(
      description: "The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J",
      price: "659.00",
      color: "red",
    ),
    stock: 1250,
    createdAt: "2023-02-19T13:42:19.010Z",
  );
}

String getMockProductJson() {
  return '''
    {
        "createdAt": "2023-02-19T13:42:19.010Z",
        "name": "Rex Bailey",
        "details": {
            "price": "659.00",
            "description": "The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J",
            "color": "red"
        },
        "stock": 12059,
        "id": "1"
    }
  ''';
}


String getMockProductsJson(){
  return '''
    [
      {
        "createdAt": "2023-02-19T13:42:19.010Z",
        "name": "Rex Bailey",
        "details": {
          "price": "659.00",
          "description": "The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J",
          "color": "red"
        },
        "stock": 12059,
        "id": "1"
      },
      {
        "createdAt": "2023-02-20T12:57:08.025Z",
        "name": "Israel Dooley",
        "details": {
          "price": "663.00",
          "description": "Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals",
          "color": "white"
        },
        "stock": 49835,
        "id": "2"
      },
      {
        "createdAt": "2023-02-20T09:57:59.008Z",
        "name": "Jan Boehm",
        "details": {
          "price": "80.00",
          "description": "The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J",
          "color": "indigo"
        },
        "stock": 34850,
        "id": "3"
      }
    ]
  ''';
}
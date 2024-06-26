import 'package:flutter/material.dart';
import 'package:lesson_64/model/category_model.dart';

class ProductsController extends ChangeNotifier {
  final List<Product> _list = [
    Product(
        id: "1",
        title: "Iphone 13 Pro",
        description:
            "Apple-ning eng yangi modelidagi yuqori darajadagi ishlash, ajoyib kamera sifati va elegant dizayn.",
        price: 1000),
    Product(
        id: "2",
        title: "Samsung Galaxy S21",
        description:
            "Samsungning flagman smartfoni, yuqori darajadagi ishlash, kuchli kamera va ajoyib ekran.",
        price: 900),
    Product(
        id: "3",
        title: "Google Pixel 5",
        description:
            "Google-ning sof Android tajribasi va kuchli kamera imkoniyatlari bilan tanilgan modeli.",
        price: 700),
    Product(
        id: "4",
        title: "OnePlus 9",
        description:
            "OnePlus kompaniyasining yuqori tezlikdagi ishlashi va mukammal ekrani bilan mashhur smartfoni.",
        price: 800),
    Product(
        id: "5",
        title: "Sony Xperia 5 II",
        description:
            "Sony-ning professional darajadagi kamera imkoniyatlari va ajoyib media tajribasi bilan tanilgan modeli.",
        price: 950),
    Product(
        id: "6",
        title: "Huawei P40 Pro",
        description:
            "Huawei-ning kuchli kameralari va yuqori darajadagi ishlashi bilan tanilgan flagman smartfoni.",
        price: 850),
    Product(
        id: "7",
        title: "Xiaomi Mi 11",
        description:
            "Xiaomi-ning kuchli ishlashi va qimmatbaho xususiyatlari bilan ajralib turadigan modeli.",
        price: 750),
    Product(
        id: "8",
        title: "Oppo Find X3 Pro",
        description:
            "Oppo-ning yuqori darajadagi ishlashi, ajoyib dizayni va kuchli kameralari bilan flagman smartfoni.",
        price: 1000),
    Product(
        id: "9",
        title: "LG Wing",
        description:
            "LG-ning noyob aylanma ekran dizayni va kuchli texnik xususiyatlari bilan innovatsion modeli.",
        price: 1000),
    Product(
        id: "10",
        title: "Motorola Edge Plus",
        description:
            "Motorola-ning yuqori darajadagi ishlashi va ajoyib kamera imkoniyatlari bilan flagman smartfoni.",
        price: 800),
    Product(
        id: "11",
        title: "Iphone 12",
        description:
            "Apple-ning o'tgan yilgi flagman modeli, hali ham kuchli va qimmatli xususiyatlarga ega.",
        price: 800),
    Product(
        id: "12",
        title: "Samsung Galaxy Note 20",
        description:
            "Samsungning stylus bilan ta'minlangan kuchli va samarali smartfoni.",
        price: 950),
    Product(
        id: "13",
        title: "Google Pixel 4a",
        description:
            "Google-ning arzonroq, ammo hali ham kuchli va yaxshi kamera bilan ta'minlangan modeli.",
        price: 500),
    Product(
        id: "14",
        title: "OnePlus Nord",
        description:
            "OnePlus kompaniyasining arzonroq, ammo kuchli xususiyatlarga ega bo'lgan smartfoni.",
        price: 400),
    Product(
        id: "15",
        title: "Sony Xperia 1 III",
        description:
            "Sony-ning professional darajadagi kameralar va yuqori sifatli ekran bilan jihozlangan flagman modeli.",
        price: 1200),
    Product(
        id: "16",
        title: "Huawei Mate 40 Pro",
        description:
            "Huawei-ning yuqori darajadagi ishlashi va kuchli kamera imkoniyatlari bilan tanilgan flagman smartfoni.",
        price: 1100),
    Product(
        id: "17",
        title: "Xiaomi Redmi Note 10",
        description:
            "Xiaomi-ning arzonroq, ammo kuchli va qimmatbaho xususiyatlarga ega bo'lgan smartfoni.",
        price: 300),
    Product(
        id: "18",
        title: "Oppo Reno 5",
        description:
            "Oppo-ning o'rta darajadagi, ammo yaxshi ishlash va kameraga ega bo'lgan smartfoni.",
        price: 400),
    Product(
        id: "19",
        title: "LG V60 ThinQ",
        description:
            "LG-ning kuchli ishlashi va ajoyib audio imkoniyatlari bilan tanilgan flagman smartfoni.",
        price: 900),
    Product(
        id: "20",
        title: "Motorola Razr 5G",
        description:
            "Motorola-ning nostaljik va zamonaviy dizaynni birlashtirgan, katlanadigan smartfoni.",
        price: 1400)
  ];

  List<Product> get list => [..._list];
}

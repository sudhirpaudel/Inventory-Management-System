import 'package:cloud_firestore/cloud_firestore.dart';

Future<List> getProducts() async {
  List allDataProducts = [];
  print('yes');
  await FirebaseFirestore.instance
      .collection('Products')
      .get()
      .then((QuerySnapshot querySnapshot) {
    for (var doc in querySnapshot.docs) {
      allDataProducts.add([
        doc['productId'], //0
        doc['articleNo'], //1
        doc['category'], //2
        doc['color'], //3
        doc['version'], //4
        doc['imageUrl'], //5
        doc['company'], //6
        doc['sizes'], //7
        doc['dateTime'], //8
      ]);
    }
  });
  print(allDataProducts);
  return allDataProducts;
}

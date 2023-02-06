import 'package:flutter/material.dart';
import 'package:inventorymanagementsystem/config/colors.dart';
import 'package:inventorymanagementsystem/models/product_model.dart';

productInfo(BuildContext context, width) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: 50,
        width: width / 24,
        child: Center(
            child: Text(
          'SN',
          style: Theme.of(context).textTheme.bodySmall,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'Product Name',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'Article No.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'Color',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
          child: Text(
            'Category',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        width: width / 8,
        child: Center(
          child: Text(
            'Product Type',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      SizedBox(
        width: width / 24,
      )
    ],
  );
}

productData(BuildContext context, width, ProductModel product,int index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: 50,
        width: width / 24,
        child: Center(
            child: Text(
          "$index",
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
            child: Text(
          product.productName,
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
            child: Text(
          product.articleNumber ?? '',
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
            child: Text(
          product.color ?? '',
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
            child: Text(
          product.productCategory ?? '',
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      // SizedBox(
      //   height: 50,
      //   width: width / 8,
      //   child: Center(
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //     children: List.generate(product[7].length, (index) {
      //       if (product[7][index]) {
      //         return Text(
      //           '$index  ',
      //           style: Theme.of(context).textTheme.displayLarge,
      //         );
      //       } else {
      //         return const SizedBox();
      //       }
      //     }),
      //   )),
      // ),
       SizedBox(
        height: 50,
        width: width / 12,
        child: Center(
            child: Text(
          product.productType ?? '',
          style: Theme.of(context).textTheme.displayLarge,
        )),
      ),
      SizedBox(
        height: 50,
        width: width / 24,
        child: Center(
            child: IconButton(
          onPressed: (){

          },
          icon:const Icon(Icons.arrow_drop_down),
          color: primaryColor,
        )),
      )
    ],
  );
}

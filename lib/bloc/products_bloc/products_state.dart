part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {
   final List<ProductModel> products;

  ProductsInitial({this.products = const []});
}

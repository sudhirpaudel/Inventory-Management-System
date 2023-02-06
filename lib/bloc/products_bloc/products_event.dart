part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent {}


class GetProducts extends ProductsEvent{
     final List<ProductModel> products;

  GetProducts({this.products = const []});
  @override
  // ignore: override_on_non_overriding_member

  List<Object> get props => [products];
}

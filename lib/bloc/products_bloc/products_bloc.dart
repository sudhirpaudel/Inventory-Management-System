import 'package:bloc/bloc.dart';
import 'package:inventorymanagementsystem/api/get_products.dart';
import 'package:inventorymanagementsystem/models/product_model.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<GetProducts>(_onGetProducts);
  }
  Future<void> _onGetProducts(
      GetProducts event, Emitter<ProductsState> emit) async {
    var productsDb = await getAllProducts();
    emit(
      ProductsInitial(products: productsDb),
    );
  }
}

Future<List<ProductModel>> getAllProducts() async {
  
  return await getProducts();
}

import 'package:bloc/bloc.dart';
import 'package:inventorymanagementsystem/api/get_inventory.dart';
import 'package:inventorymanagementsystem/models/inventory_model.dart';
import 'package:meta/meta.dart';

part 'inventory_event.dart';
part 'inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  InventoryBloc() : super(InventoryInitial()) {
    on<GetInventory>(_onGetInventory);
    }
   
   Future _onGetInventory( GetInventory event, Emitter<InventoryState> emit)async{
      var inventoryDb = await getInventory();
      emit(
     InventoryInitial(inventory: inventoryDb),
    );
   }
  }


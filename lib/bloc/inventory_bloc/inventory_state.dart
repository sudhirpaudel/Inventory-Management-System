part of 'inventory_bloc.dart';

@immutable
abstract class InventoryState {}

class InventoryInitial extends InventoryState {
  final List<InventoryModel> inventory;

  InventoryInitial({this.inventory = const []});
}

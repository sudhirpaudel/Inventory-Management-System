part of 'inventory_bloc.dart';

@immutable
abstract class InventoryEvent {}

class GetInventory extends InventoryEvent {
  final List<InventoryModel> inventory;

  GetInventory({this.inventory = const []});
  @override
  // ignore: override_on_non_overriding_member

  List<Object> get props => [inventory];
}

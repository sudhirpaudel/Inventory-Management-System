part of 'client_bloc.dart';

@immutable
abstract class ClientState {}

class ClientInitial extends ClientState {
  final List<ClientModel> clients;

  ClientInitial({this.clients = const []});
}

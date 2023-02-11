part of 'client_bloc.dart';

@immutable
abstract class ClientEvent {}


class GetClients extends ClientEvent{
     final List<ClientModel> clients;

  GetClients({this.clients = const []});
  @override
  // ignore: override_on_non_overriding_member

  List<Object> get props => [clients];
}

import 'package:bloc/bloc.dart';
import 'package:inventorymanagementsystem/api/get_clients.dart';
import 'package:inventorymanagementsystem/models/client_model.dart';
import 'package:meta/meta.dart';

part 'client_event.dart';
part 'client_state.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  ClientBloc() : super(ClientInitial()) {
    on<GetClients>(_onGetClients);
  }
  Future<void> _onGetClients(
      GetClients event, Emitter<ClientState> emit) async {
    var clientDb = await getAllClients();
    emit(
      ClientInitial(clients: clientDb),
    );
  }
}

Future<List<ClientModel>> getAllClients() async {
  
  return await getClients();
 
}

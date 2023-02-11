import 'package:bloc/bloc.dart';
import 'package:inventorymanagementsystem/api/get_transaction.dart';
import 'package:inventorymanagementsystem/models/transaction_model.dart';
import 'package:meta/meta.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
   on<GetTransactions>(_onGetTransactions);
  }
  Future<void> _onGetTransactions(
      GetTransactions event, Emitter<TransactionState> emit) async {
    var transactionsDb = await getAllTransactions();
    emit(
     TransactionInitial(transactions: transactionsDb),
    );
  }
}

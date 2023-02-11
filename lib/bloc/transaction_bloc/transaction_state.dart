part of 'transaction_bloc.dart';

@immutable
abstract class TransactionState {}

class TransactionInitial extends TransactionState {
    final List<OnlyTransactionModel> transactions;

  TransactionInitial({this.transactions= const []});
}

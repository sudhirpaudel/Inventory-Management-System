part of 'transaction_bloc.dart';

@immutable
abstract class TransactionEvent {}



class GetTransactions extends TransactionEvent{
     final List<OnlyTransactionModel> transactions;

  GetTransactions({this.transactions = const []});
  @override
  // ignore: override_on_non_overriding_member

  List<Object> get props => [transactions];
}

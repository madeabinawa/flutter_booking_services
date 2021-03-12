part of 'customer_cubit.dart';

@immutable
abstract class CustomerState {}

class CustomerInitial extends CustomerState {}

class CustomerLoading extends CustomerState {}

class CustomerLoginSuccess extends CustomerState {
  final CustomerApiResponse customerApiResponse;
  CustomerLoginSuccess(this.customerApiResponse);
}

class CustomerLoginFailed extends CustomerState {
  final String message;
  CustomerLoginFailed(this.message);
}

class CustomerLogout extends CustomerState {}

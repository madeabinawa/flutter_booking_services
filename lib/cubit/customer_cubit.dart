import 'package:bloc/bloc.dart';
import 'package:booking_services/api/apis.dart';
import 'package:meta/meta.dart';

part 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit() : super(CustomerInitial());

  void login(String email, String password) async {
    emit(CustomerLoading());

    CustomerApiResponse customerApiResponse =
        await CustomerApi.login(email, password);

    if (customerApiResponse.customer != null) {
      emit(CustomerLoginSuccess(customerApiResponse));
    } else {
      emit(CustomerLoginFailed(customerApiResponse.message!));
    }
  }

  void logout() async {
    await CustomerApi.logout();
    emit(CustomerLogout());
  }
}

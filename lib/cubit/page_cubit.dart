import 'package:bloc/bloc.dart';
import 'package:booking_services/models/customer_model.dart';
import 'package:meta/meta.dart';

part 'page_state.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit() : super(PageInitial());
  void goToHomepage(Customer customer) => emit(PageHomepage(customer));
  void goToLoginPage() => emit(PageLogin());
  void goToSettingsPage(Customer customer) => emit(PageSettings(customer));
}

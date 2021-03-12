part of 'page_cubit.dart';

@immutable
abstract class PageState {}

class PageInitial extends PageState {}

class PageHomepage extends PageState {
  final Customer customer;
  PageHomepage(this.customer);
}

class PageLogin extends PageState {}

class PageSettings extends PageState {
  final Customer customer;
  PageSettings(this.customer);
}

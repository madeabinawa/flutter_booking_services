import 'package:booking_services/cubit/customer_cubit.dart';
import 'package:booking_services/cubit/page_cubit.dart';
import 'package:booking_services/theme.dart';
import 'package:booking_services/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (contetxt) => CustomerCubit()),
        BlocProvider(create: (contetxt) => (PageCubit())),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarColor: mainColor),
        child: MaterialApp(
          title: 'Booking Services',
          theme: ThemeData(
            primaryColor: mainColor,
          ),
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<PageCubit, PageState>(
            builder: (context, state) {
              if (state is PageHomepage) {
                return Homepage(state.customer);
              } else if (state is PageLogin) {
                return Login();
              } else if (state is PageSettings) {
                return Settings(state.customer);
              }
              return Login();
            },
          ),
        ),
      ),
    );
  }
}

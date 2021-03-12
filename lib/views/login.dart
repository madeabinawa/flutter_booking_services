part of 'views.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    //get Screen size
    var screen = MediaQuery.of(context).size;
    //node textField
    final node = FocusScope.of(context);

    bool isControllerEmpty() {
      return _email.text != '' && _password.text != '';
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screen.height,
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  height: screen.height / 3.5,
                  width: screen.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/undraw_my_password.png'),
                    ),
                  ),
                ),
                Text(
                  'Booking Services',
                  style: purpleTextStyle.copyWith(fontSize: 28),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.person_outlined),
                        ),
                        controller: _email,
                        onEditingComplete: () => node.nextFocus(),
                        style: TextStyle(),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: _obscureText
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            )),
                        controller: _password,
                        onEditingComplete: () => node.unfocus(),
                        obscureText: _obscureText,
                        style: TextStyle(),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: BlocConsumer<CustomerCubit, CustomerState>(
                                listener: (context, state) {
                              if (state is CustomerLoginFailed) {
                                Flushbar(
                                  title: "Hey Ninja",
                                  message:
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                                  duration: Duration(seconds: 3),
                                )..show(context);
                              } else if (state is CustomerLoginSuccess) {
                                // HEADING TO HOMEPAGE
                                context.read<PageCubit>().goToHomepage(
                                    state.customerApiResponse.customer!);
                              }
                            }, builder: (context, state) {
                              if (state is CustomerLoading) {
                                return Container(
                                  height: 50,
                                  width: 50,
                                  child: Center(
                                    child: SpinKitWave(color: mainColor),
                                  ),
                                );
                              }
                              return RaisedButton(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                padding: EdgeInsets.only(top: 15, bottom: 15),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                onPressed: () async {
                                  isControllerEmpty()
                                      ? // CONNECT TO LOGIN API
                                      context
                                          .read<CustomerCubit>()
                                          .login(_email.text, _password.text)
                                      : Flushbar(
                                          title: "Hey Ninja",
                                          message:
                                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                                          duration: Duration(seconds: 3),
                                        ).show(context);
                                },
                                color: isControllerEmpty()
                                    ? mainColor
                                    : Colors.grey,
                              );
                            }),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
                SizedBox(height: screen.height / 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

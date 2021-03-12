part of 'views.dart';

class Homepage extends StatefulWidget {
  final Customer customer;
  Homepage(this.customer);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: screen.height * 0.28,
            width: screen.width,
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: screen.width - 2 * defaultMargin - 48,
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              style: TextStyle(fontSize: 25),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Hello, ',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                TextSpan(
                                  text:
                                      '${widget.customer.data!.user!.profile!.name}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.settings),
                          iconSize: 22,
                          color: Colors.white,
                          onPressed: () {
                            // * GOTO USER SETTINGS VIEW
                            context
                                .read<PageCubit>()
                                .goToSettingsPage(widget.customer);
                          },
                        ),
                      ],
                    ),
                    // * TODO: ADD LEVEL PRIORITY CUSTOMER
                    Text(
                      '${widget.customer.data!.user!.profile!.priority!.capitalize()} Priority Customer',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Beranda',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Pertemuan',
            icon: Icon(Icons.calendar_today),
          ),
          BottomNavigationBarItem(
            label: 'Riwayat',
            icon: Icon(Icons.watch_later_outlined),
          ),
        ],
      ),
    );
  }
}

import '../exports.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    Center(
      child: AppText.large('Driving'),
    ),
    Center(
      child: AppText.large('Safety'),
    ),
    Center(
      child: AppText.large('Chat'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        // backgroundColor: Colors.white,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: EdgeInsets.all(8.h),
            margin: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              bottom: 10.h,
            ),
            decoration: BoxDecoration(
              color: ColorName.whiteColor,
              // color: Colors.transparent,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.blue,
              iconSize: 20,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Icons.map,
                  text: 'Location',
                  iconColor: Colors.blue,
                  textStyle: TextStyle(color: Colors.blue),
                ),
                GButton(
                  icon: Icons.route,
                  text: 'Driving',
                ),
                GButton(
                  icon: Icons.safety_check,
                  text: 'Safety',
                ),
                GButton(
                  icon: Icons.wechat_outlined,
                  text: 'Chat',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      );
  }
}
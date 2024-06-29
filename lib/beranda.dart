import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tiktok_app/theme/theme.dart' as style;
import 'bloc/bottom_navbar_bloc.dart';
import 'home_screen/home_screen.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  final BottomNavBarBloc _bottomNavBarBloc = BottomNavBarBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _bottomNavBarBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<NavBarItem>(
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          switch (snapshot.data) {
            case NavBarItem.home:
              return const HomeScreen(); // Home
            case NavBarItem.favourite:
              return Container();
            case NavBarItem.plus:
              return Container();
            case NavBarItem.search:
              return Container();
            case NavBarItem.profile:
              return Container();
            default:
              return Container();
          }
        },
      ),
      bottomNavigationBar: StreamBuilder(
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 0.5,
                  color: Colors.grey.withOpacity(0.4),
                ),
              ),
            ),
            child: BottomNavigationBar(
              elevation: 0.9,
              iconSize: 21,
              unselectedFontSize: 10.0,
              selectedFontSize: 10.0,
              type: BottomNavigationBarType.fixed,
              currentIndex: snapshot.data!.index,
              onTap: _bottomNavBarBloc.pickItem,
              items: [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: SizedBox(
                    child: SvgPicture.asset(
                      "assets/icons/home.svg",
                      color: Colors.white,
                      height: 25.0,
                      width: 25.0,
                    ),
                  ),
                  activeIcon: SizedBox(
                    child: SvgPicture.asset(
                      "assets/icons/home-active.svg",
                      color: style.Colors.mainColor,
                      height: 25.0,
                      width: 25.0,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Discover",
                  icon: SvgPicture.asset(
                    "assets/icons/search.svg",
                    color: Colors.white,
                    height: 25.0,
                    width: 25.0,
                  ),
                  activeIcon: SizedBox(
                    child: SvgPicture.asset(
                      "assets/icons/search-active.svg",
                      color: style.Colors.mainColor,
                      height: 25.0,
                      width: 25.0,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Add",
                  icon: SvgPicture.asset(
                    "assets/icons/add-square.svg",
                    color: style.Colors.mainColor,
                    height: 30.0,
                    width: 30.0,
                  ),
                  activeIcon: SizedBox(
                    child: SvgPicture.asset(
                      "assets/icons/add-square-active.svg",
                      color: style.Colors.mainColor,
                      height: 30.0,
                      width: 30.0,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Trending",
                  icon: SvgPicture.asset(
                    "assets/icons/trend.svg",
                    color: Colors.white,
                    height: 25.0,
                    width: 25.0,
                  ),
                  activeIcon: SizedBox(
                    child: SvgPicture.asset(
                      "assets/icons/trend-active.svg",
                      color: style.Colors.mainColor,
                      height: 25.0,
                      width: 25.0,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Profile",
                  icon: SvgPicture.asset(
                    "assets/icons/profile.svg",
                    color: Colors.white,
                    height: 25.0,
                    width: 25.0,
                  ),
                  activeIcon: SizedBox(
                    child: SvgPicture.asset(
                      "assets/icons/profile-active.svg",
                      color: style.Colors.mainColor,
                      height: 25.0,
                      width: 25.0,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildAddButton(sizingInformation) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_) => AddVideoPage(),
          //   ),
          // );
        },
        child: Container(
          margin: EdgeInsets.only(top: 16.0),
          width: 64,
          height: sizingInformation.localWidgetSize.height * 0.07,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 22,
                  height: sizingInformation.localWidgetSize.height * 0.045,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.blue),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 22,
                  height: sizingInformation.localWidgetSize.height * 0.045,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.red),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 52,
                  height: sizingInformation.localWidgetSize.height * 0.045,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white),
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testpetsigo/home/segmentedButton/chatbots/chatbots_bloc.dart';
import 'package:testpetsigo/home/segmentedButton/contacts/contacts_bloc.dart';
import 'package:testpetsigo/home/segmentedButton/segmented_button_bloc.dart';

class HomePage extends StatefulWidget {
  var username;
  HomePage({
    this.username,
  });
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int Index = 0;
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: BlocBuilder<SegmentedButtonBloc, SegmentedButtonState>(
        bloc: SegmentedButtonBloc(),
        builder: (context, state){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // give the tab bar a height [can change hheight to preferred height]
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: TabBar(
                    onTap: (index) {
                      setState(() {
                        Index = index;
                      });
                      BlocBuilder<SegmentedButtonBloc, SegmentedButtonState>(
                          builder: (context, state) {
                            context.read<SegmentedButtonBloc>().add(loadindex(Index));
                            print(state.index.toString());
                            return const CircularProgressIndicator();
                          }
                      );
                    },
                    controller: _tabController,
                    // give the indicator a decoration (color and border radius)
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                      color: Colors.white,
                    ),
                    labelColor: Colors.orange[700],
                    unselectedLabelColor: Colors.grey[700],
                    unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    indicatorPadding: const EdgeInsets.only(
                        left: 5, top: 5, right: 5, bottom: 5),
                    tabs: const [
                      // first tab [you can add an icon using the icon property]
                      Tab(
                        text: 'Contacts',
                      ),

                      // second tab [you can add an icon using the icon property]
                      Tab(
                        text: 'Chatbots',
                      ),
                    ],
                  ),
                ),
                // tab bar view here
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      Center(
                        child: Text(
                          "Loading contacts...",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Center(
                          child: Text(
                            "Loading chatbots...",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )),

                      // second tab bar view widget
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        ,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'upload_image_widget.dart';
import 'prediction_result_widget.dart';
import 'history_section.dart';
import 'package:healingbloom/widgets/top_navigation_bar.dart';
import 'package:healingbloom/widgets/side_menu.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isImageUploaded = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: TopNavigationBar(
          userName: 'John Doe', // Replace with actual user name
          onProfileTap: () {
            // Logic to show the side menu
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      drawer: SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TabBarView(
          controller: _tabController,
          children: [
            UploadImageWidget(onImageUploaded: (uploaded) {
              setState(() {
                _isImageUploaded = uploaded;
              });
            }),
            HistorySection(),
          ],
        ),
      ),
    );
  }
}

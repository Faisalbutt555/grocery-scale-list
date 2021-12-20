import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:shopping/grocey_app/provider/createlist_provider.dart';
import 'package:shopping/grocey_app/screens/category/category_list.dart';

import 'package:shopping/widgets/custom_appbar.dart';
import 'package:shopping/widgets/empty_catscreen.dart';
import 'package:shopping/widgets/floating_button.dart';

class HomeScreen extends StatefulWidget {
  final int id;
  const HomeScreen({Key? key, required this.id}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final pro = Provider.of<AddListProvider>(context, listen: false);
    pro.loaddata();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddListProvider>(
      context,
    );
    return Scaffold(
      appBar: const CustomAppbar(),
      floatingActionButton: const Floatingbutton(),
      body: provider.list.isNotEmpty
          ? const CategoryList()
          : const EmptyCatScreen(),
    );
  }
}

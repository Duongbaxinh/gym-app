import 'package:flutter/material.dart';
import 'package:project_app/theme/custome_theme.dart';

import '../../theme/custom_theme.dart';

class LanguageSetting extends StatefulWidget {
  const LanguageSetting({super.key});

  @override
  State<LanguageSetting> createState() => _LanguageSettingState();
}

class _LanguageSettingState extends State<LanguageSetting> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _languagesList = [
      {'id': 1, 'name': 'English'},
      {'id': 2, 'name': 'Spanish'},
      {'id': 3, 'name': 'Japanese'},
      {'id': 4, 'name': 'French'},
      {'id': 5, 'name': 'German'},
      {'id': 6, 'name': 'Russian'},
      {'id': 7, 'name': 'Portugues'},
      {'id': 8, 'name': 'Italian'},
      {'id': 9, 'name': 'Korean'},
    ];
    List<Map<String, dynamic>> _foundLanguages = [];

    @override
    initState() {
      _foundLanguages = _languagesList;
      super.initState();
    }

    void _runFilter(String enterKeyword) {
      List<Map<String, dynamic>> results = [];
      if (enterKeyword.isEmpty) {
        results = _languagesList;
      } else {
        results = _languagesList
            .where((e) =>
                e["name"].toLowerCase().contains(enterKeyword.toLowerCase()))
            .toList();
      }
      print('ytytytyt$results');
      setState(() {
        _foundLanguages = results;
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                // expandedHeight: 40.0,
                floating: false,
                pinned: true,
                elevation: 0,
                backgroundColor: Colors.black12,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    'Language'.toUpperCase(),
                    style: CustomText.text5,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      cursorColor: Colors.white,
                      onChanged: (value) => _runFilter(value),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: 'Search',
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.white)),
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.white))),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    String languageName = _languagesList[index]['name'];
                    int languageId = _languagesList[index]['id'];
                    Key tileKey = ValueKey<int>(languageId);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        height: 50,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white10,
                                    width:
                                        0.7), // Đường viền màu xanh, chiều rộng 2.0
                                borderRadius:
                                    BorderRadius.circular(8.0), // Góc bo tròn
                              ),
                            ),
                            ListTile(
                              key: tileKey,
                              title: Text(
                                languageName,
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: _languagesList.length,
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white10, width: 0.7),
                    borderRadius: BorderRadius.circular(8.0), // Góc bo tròn
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

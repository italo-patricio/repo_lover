import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repo_lover/models/search_result_model.dart';
import 'package:repo_lover/pages/search_repo_page.dart';
import 'package:repo_lover/services/api_github_service.dart';
import 'package:repo_lover/store/search_store.dart';

void main() async {
  runApp(RepoLoverApp());
}


class RepoLoverApp extends StatefulWidget {
  @override
  _RepoStateLoverApp createState() => _RepoStateLoverApp();
}

class _RepoStateLoverApp extends State<RepoLoverApp> {
  final _searchStore = SearchStore();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    theme: ThemeData(
        primaryColor: Colors.white,
        buttonColor: Color(0xff8F8B8B),
        accentColor: Color(0xffFA9999),
        textTheme: TextTheme(
          bodyText2:  GoogleFonts.lato(
              fontSize: 17,
              fontWeight: FontWeight.normal,
              color: Color(0xff8F8B8B),
            )
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryTextTheme: TextTheme(),
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline6: GoogleFonts.lato(
              fontSize: 24,
              fontWeight: FontWeight.normal,
              color: Color(0xff8F8B8B),
            ),
          ),
          elevation: 0,
        )),
    debugShowCheckedModeBanner: false,
    home: SearchRepoPage(searchStore: _searchStore,),
  );
  }
}
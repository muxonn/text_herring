import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_herring/colors.dart';
import 'package:intl/intl.dart';
import 'package:text_herring/utils/user_preferences.dart';

class EditPage extends StatefulWidget {
  final id;
  const EditPage({super.key, required this.id});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  String header = 'Prezentacja PBL siarka';
  String pageBody =
      'Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis';
  DateTime now = DateTime.now();
  String date = '';
  Color bgColor = Colors.white;
  Color mainColor = secondaryColor;
  bool darkTheme = false;
  bool _keyboardActive = false;

  final _headerController = TextEditingController();
  final _pageBodyController = TextEditingController();

  void setTheme() {
    if (darkTheme) {
      setState(() {
        bgColor = secondaryColor;
        mainColor = Colors.white;
      });
    } else {
      setState(() {
        bgColor = Colors.white;
        mainColor = secondaryColor;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    print("$darkTheme");
    darkTheme = UserPreferences().getDarkTheme() ?? false;
    print("Got $darkTheme");
    setTheme();

    _headerController.text = header;
    _pageBodyController.text = pageBody;

    _headerController.addListener(() {
      header = _headerController.text;
      setState(() {
        _keyboardActive = true;
        date = DateFormat('dd-MM-yyyy - kk:mm').format(now);
      });
    });

    _pageBodyController.addListener(() {
      pageBody = _pageBodyController.text;
      setState(() {
        _keyboardActive = true;
        date = DateFormat('dd-MM-yyyy - kk:mm').format(now);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 60,
        iconTheme: IconThemeData(color: mainColor, size: 32),
        elevation: 0.0,
        leading: Icon(Icons.arrow_back_ios_new_rounded),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                //hide keyboard
                setState(() {
                  _keyboardActive = false;
                  darkTheme = !darkTheme;
                  UserPreferences.setDarkTheme(darkTheme);
                  setTheme();
                });
              },
              icon: _keyboardActive
                  ? Icon(Icons.download_done_rounded)
                  : Icon(Icons.menu),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  date,
                  style: TextStyle(color: mainColor),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.topLeft,
                child: TextFormField(
                  controller: _headerController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainColor),
                    ),
                  ),
                  style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                alignment: Alignment.topLeft,
                child: TextFormField(
                  maxLines: null,
                  controller: _pageBodyController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

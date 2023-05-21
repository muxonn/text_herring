import 'package:flutter/material.dart';
import 'package:text_herring/colors.dart';
import 'package:intl/intl.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

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

  @override
  void initState() {
    super.initState();
    date = DateFormat('dd-MM-yyyy - kk:mm').format(now);
    if (darkTheme) {
      setState(() {
        bgColor = secondaryColor;
        mainColor = Colors.white;
      });
    }
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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.menu),
          ),
        ],
      ),
      body: Padding(
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
            const SizedBox(height: 30),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                header,
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
              child: Text(
                pageBody,
                style: TextStyle(
                  color: mainColor,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:agecalculate/constant/color.dart';
import 'package:agecalculate/global/helper_function.dart';
import 'package:agecalculate/global/utils.dart';
import 'package:agecalculate/views/result.dart';
import 'package:agecalculate/widget/custom_large_button.dart';
import 'package:agecalculate/widget/date_picker_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Age Calculate",
          style: TextStyle(
              fontSize: 25,
              fontFamily: "roboto",
              color: Color.fromARGB(255, 29, 11, 78),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Find out your precise age and the number of days till your next birthday.',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'roboto',
                  color: textColor,
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              height: 10,
            ),
            DatePickerField(
              level: 'Select date of birth',
              onTap: () => _selectDate(context, selectedBithDate, "BirthDate"),
              hintText: "${getFormatedDate(selectedBithDate)}",
            ),
            SizedBox(
              height: 10,
            ),
            DatePickerField(
              level: 'Select today\'s date',
              onTap: () =>
                  _selectDate(context, selectedCurrentDate, "CurrentDate"),
              hintText: "${getFormatedDate(selectedCurrentDate)}",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: CustomLargeButton(
                buttonLevel: "Calculate",
                onPressed: () {
                  Route route =
                      MaterialPageRoute(builder: (context) => ResultPage());
                  Navigator.push(context, route);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  //This function used for open date picker
  Future<void> _selectDate(
      BuildContext context, DateTime initialDate, String from) async {
    if (from == 'BirthDate') {
      final DateTime? pickedBirthDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
      );
      if (pickedBirthDate != null && pickedBirthDate != selectedBithDate)
        setState(() {
          selectedBithDate = pickedBirthDate;
        });
    }
    if (from == "CurrentDate") {
      final DateTime? pickedCurrentDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
      );

      if (pickedCurrentDate != null && pickedCurrentDate != selectedCurrentDate)
        setState(() {
          selectedCurrentDate = pickedCurrentDate;
        });
    }
  }
}

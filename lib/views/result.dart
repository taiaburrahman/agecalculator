import 'package:agecalculate/controller/age_calculator.dart';
import 'package:agecalculate/global/helper_function.dart';
import 'package:agecalculate/global/utils.dart';
import 'package:agecalculate/widget/custom_divider.dart';
import 'package:agecalculate/widget/custom_large_button.dart';
import 'package:agecalculate/widget/custom_list_tile.dart';
import 'package:agecalculate/widget/summary_card_builder.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SizedBox(
              height: 10,
            ),
            Spacer(),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CustomListTile(
                      leading: "Date of birth",
                      trailing: getFormatedDate(selectedBithDate),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomListTile(
                      leading: "Todays",
                      trailing: getFormatedDate(selectedCurrentDate),
                    ),
                  ],
                )),
            Spacer(),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(15),
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Age"),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: AgeCalculator.age(selectedBithDate,
                                            today: selectedCurrentDate)
                                        .years
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28),
                                  ),
                                  TextSpan(
                                    text: ' Years',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                                "${AgeCalculator.age(selectedBithDate, today: selectedCurrentDate).months.toString()} Months | ${AgeCalculator.age(selectedBithDate, today: selectedCurrentDate).days.toString()} Days"),
                          ],
                        ),
                      ),
                    ),
                    CustomDivider(),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Next Birthday"),
                            Text(
                              AgeCalculator.findDayName().toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            Text(
                                "${AgeCalculator.timeToNextBirthday(selectedBithDate, fromDate: selectedCurrentDate).months} Months | ${AgeCalculator.timeToNextBirthday(selectedBithDate, fromDate: selectedCurrentDate).days} Days"),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Text(
                    "Age in",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SummaryCardBuilder(
                                title: "Years",
                                subTitle: AgeCalculator.age(selectedBithDate,
                                        today: selectedCurrentDate)
                                    .years
                                    .toString(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SummaryCardBuilder(
                                title: "Weeks",
                                subTitle: (AgeCalculator.age(selectedBithDate,
                                                today: selectedCurrentDate)
                                            .years *
                                        52)
                                    .toString(),
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              SummaryCardBuilder(
                                title: "Months",
                                subTitle: (AgeCalculator.age(selectedBithDate,
                                                today: selectedCurrentDate)
                                            .years *
                                        12)
                                    .toString(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SummaryCardBuilder(
                                title: "Hours",
                                subTitle: AgeCalculator.hoursBetween(
                                        selectedBithDate, selectedCurrentDate)
                                    .toString(),
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              SummaryCardBuilder(
                                title: "Days",
                                subTitle: AgeCalculator.daysBetween(
                                        selectedBithDate, selectedCurrentDate)
                                    .toString(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SummaryCardBuilder(
                                title: "Minutes",
                                subTitle: AgeCalculator.minutesBetween(
                                        selectedBithDate, selectedCurrentDate)
                                    .toString(),
                                fontSize: 14,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: CustomLargeButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                buttonLevel: "Re-Calculate",
              ),
            )
          ],
        ),
      ),
    );
  }
}
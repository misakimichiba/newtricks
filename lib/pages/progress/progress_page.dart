import 'package:flutter/material.dart';
import 'package:streak_calendar/streak_calendar.dart';

Color colorStringToDarken(String colorString) {
  String hexColor = colorString.toUpperCase().replaceAll('#', '');
  if (hexColor.length == 6) {
    hexColor = 'FF$hexColor'; // Add opacity if not provided
  }

  Color color = Color(int.parse(hexColor, radix: 16));

  final hsl = HSLColor.fromColor(color);
  final hslEnhanced = hsl
      .withSaturation((hsl.saturation + 0.1).clamp(0.0, 1.0))
      .withLightness((hsl.lightness - 0.1).clamp(0.0, 1.0));

  return hslEnhanced.toColor();
}

Color colorStringToLighten(String colorString) {
  String hexColor = colorString.toUpperCase().replaceAll('#', '');
  if (hexColor.length == 6) {
    hexColor = 'FF$hexColor'; // Add opacity if not provided
  }

  Color color = Color(int.parse(hexColor, radix: 16));

  final hsl = HSLColor.fromColor(color);
  final hslEnhanced = hsl
      .withSaturation((hsl.saturation - 0.1).clamp(0.0, 1.0))
      .withLightness((hsl.lightness + 0.1).clamp(0.0, 1.0));

  return hslEnhanced.toColor();
}

void main() {
  runApp(const ProgressPage());
}

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  // DateTime today = DateTime.now();

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(),
  //     body: Center(
  //         child: Padding(
  //       padding: const EdgeInsets.all(15.0),
  //       child: Column(
  //         // children: <Widget>[
  //         //   new CircularPercentIndicator(
  //         //     radius: 100.0,
  //         //     lineWidth: 50.0,
  //         //     percent: 0.1,
  //         //     center: new Text("10% Done"),
  //         //     backgroundColor: Colors.grey,
  //         //     progressColor: Colors.black,
  //         //   ),
  //         children: [
  //           Padding(padding: EdgeInsets.all(10)),
  //           TableCalendar(
  //               headerStyle: HeaderStyle(
  //                 formatButtonVisible: false,
  //                 titleCentered: true,
  //               ),
  //               daysOfWeekHeight: 25,
  //               calendarStyle: CalendarStyle(
  //                 markerDecoration: BoxDecoration(color: Colors.black),
  //                 defaultTextStyle: TextStyle(fontSize: 25),
  //                 outsideDaysVisible: false,
  //                 todayTextStyle: TextStyle(fontSize: 25, color: Colors.white),
  //               ),
  //               focusedDay: today,
  //               firstDay: DateTime.utc(2020, 1, 1),
  //               lastDay: DateTime.utc(2030, 12, 31))
  //         ],
  //       ),
  //     )),
  //   );
  // }

  List<DateTime> selectedDates = [];

  @override
  Widget build(BuildContext context) {
    var color = const Color(0xFFA3C6A5);
    // 0xFFF0DEAA
    // 0xFFF4DEC6
// 0xFFE4DABC
    // 0xFFB2D0C3
    var colorString =
        color.toString().replaceAll("Color(0xff", "#").replaceAll(")", "");
    Color darkenedColor = colorStringToDarken(colorString);
    Color lightenedColor = colorStringToLighten(colorString);
    // var colorO = Color(int.parse('0xFF'+colorString.replaceAll("#", "")));

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("Calendar"),
      ),
      body: SafeArea(
        left: false,
        right: false,
        top: false,
        bottom: false,
        child: Center(
          // child: ListView(
          //             padding: EdgeInsets.zero,
          // shrinkWrap: true,
          // scrollDirection: Axis.vertical,
          // children: [
          //     child:
          // Container(
          //   width: double.infinity,
          //   height: 600.0,
          //   children: [
          child: CleanCalendar(
            enableDenseViewForDates: true,
            enableDenseSplashForDates: true,
            datesForStreaks: [
              DateTime(2024, 05, 31),
              DateTime(2024, 06, 1),
              DateTime(2024, 06, 2),
              DateTime(2024, 06, 3),
              DateTime(2024, 06, 4),
              DateTime(2024, 06, 5),
              DateTime(2024, 06, 6),
              // DateTime(2024, 06, 8),
              DateTime(2024, 06, 9),
              DateTime(2024, 06, 10),
              DateTime(2024, 06, 15),
              DateTime(2024, 06, 17),
              DateTime(2024, 06, 26),
              // DateTime(2024, 07, 24),
              DateTime(2024, 06, 28),
              DateTime(2024, 06, 30),

              DateTime(2024, 07, 1),
              DateTime(2024, 07, 2),
              DateTime(2024, 07, 3),
              DateTime(2024, 07, 4),
              DateTime(2024, 07, 7),
              DateTime(2024, 07, 8),
              DateTime(2024, 07, 9),
              DateTime(2024, 07, 10),
              DateTime(2024, 07, 11),
              DateTime(2024, 07, 12),
              DateTime(2024, 07, 13),
              DateTime(2024, 07, 14),
              DateTime(2024, 07, 15),
              DateTime(2024, 07, 16),
              DateTime(2024, 07, 19),

              DateTime(2024, 07, 5),
              DateTime(2024, 07, 6),

              DateTime(2024, 07, 17),
              DateTime(2024, 07, 18),
              DateTime(2024, 07, 21),
              DateTime(2024, 07, 22),

              DateTime(2024, 07, 27),
              DateTime(2024, 07, 28),
              DateTime(2024, 07, 29),
              DateTime(2024, 07, 31),
              DateTime(2024, 08, 01),
            ],
            datesForSkips: [
              // DateTime(2024, 06, 3),
              DateTime(2024, 06, 10),
              DateTime(2024, 06, 22),
              DateTime(2024, 06, 29),
              DateTime(2024, 07, 26),
            ],
            datesForFails: [
              DateTime(2024, 06, 7),
              DateTime(2024, 06, 20),
              DateTime(2024, 06, 21),
              DateTime(2024, 06, 23),
              DateTime(2024, 06, 24),
              DateTime(2024, 06, 25),
              // DateTime(2024, 07, 21),
              // DateTime(2024, 07, 22),
              DateTime(2024, 07, 23),
              DateTime(2024, 07, 24),
            ],
            streakDatesProperties: DatesProperties(
              datesDecoration: DatesDecoration(
                datesBorderRadius: 10,
                datesBackgroundColor: darkenedColor, //Colors.green[400],
                datesBorderColor: darkenedColor, //Colors.green[400],
                datesTextColor: Colors.white,
              ),
            ),
            skipDatesProperties: DatesProperties(
              datesDecoration: DatesDecoration(
                datesBorderRadius: 10,
                datesBackgroundColor: lightenedColor, //Colors.white,
                datesBorderColor: darkenedColor, //Colors.green[400],
                datesTextColor: Colors.grey,
              ),
            ),
            failDatesProperties: DatesProperties(
              datesDecoration: DatesDecoration(
                datesBorderRadius: 10,
                datesBackgroundColor: lightenedColor, //Colors.white,
                datesBorderColor: lightenedColor, //Colors.red,
                datesTextColor: const Color.fromARGB(255, 168, 168, 168),
              ),
            ),
            currentDateProperties: DatesProperties(
              datesDecoration: DatesDecoration(
                datesBorderRadius: 10,
                datesBackgroundColor: lightenedColor, // Colors.green[400],
                datesBorderColor: lightenedColor, //Colors.green[400],
                datesTextColor: Colors.grey,
              ),
            ),
            generalDatesProperties: DatesProperties(
              datesDecoration: DatesDecoration(
                datesBorderRadius: 10,
                datesBackgroundColor: lightenedColor, //Colors.white,
                datesBorderColor: lightenedColor, //Colors.red,
                datesTextColor: Colors.grey,
              ),
            ),
            startWeekday: WeekDay.monday,
            leadingTrailingDatesProperties: DatesProperties(
              // To disable taps on leading and trailing dates.
              disable: true,
              // To hide leading and trailing dates.
              hide: false,
              datesDecoration: DatesDecoration(
                datesBorderRadius: 10,
                datesBackgroundColor: Colors.white,
                datesBorderColor: Colors.white,
                datesTextColor: const Color(0xFFB9B9B9),
              ),
            ),
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          // CleanCalendar(
          //   datePickerCalendarView: DatePickerCalendarView.weekView,
          //   enableDenseViewForDates: true,
          //   enableDenseSplashForDates: true,
          //   datesForStreaks: [
          //     DateTime(2023, 01, 5),
          //     DateTime(2023, 01, 6),
          //     DateTime(2023, 01, 7),
          //     DateTime(2023, 01, 9),
          //     DateTime(2023, 01, 10),
          //     DateTime(2023, 01, 11),
          //     DateTime(2023, 01, 13),
          //     DateTime(2023, 01, 20),
          //     DateTime(2023, 01, 21),
          //     DateTime(2023, 01, 23),
          //     DateTime(2023, 01, 24),
          //     DateTime(2023, 01, 25),
          //   ],
          //   dateSelectionMode: DatePickerSelectionMode.singleOrMultiple,
          //   onCalendarViewDate: (DateTime calendarViewDate) {
          //     // print(calendarViewDate);
          //   },
          //   selectedDates: selectedDates,
          //   onSelectedDates: (List<DateTime> value) {
          //     setState(() {
          //       if (selectedDates.contains(value.first)) {
          //         selectedDates.remove(value.first);
          //       } else {
          //         selectedDates.add(value.first);
          //       }
          //     });
          //     // print(selectedDates);
          //   },
          // ),
          // CleanCalendar(
          //   headerProperties: HeaderProperties(
          //     monthYearDecoration: MonthYearDecoration(
          //       monthYearTextColor: Colors.amber,
          //       monthYearTextStyle: Theme.of(context).textTheme.labelMedium,
          //     ),
          //     navigatorDecoration: NavigatorDecoration(
          //       navigatorResetButtonIcon: const Icon(
          //         Icons.restart_alt,
          //         color: Colors.amber,
          //       ),
          //       navigateLeftButtonIcon: const Icon(
          //         Icons.arrow_circle_left,
          //         color: Colors.amber,
          //       ),
          //       navigateRightButtonIcon: const Icon(
          //         Icons.arrow_circle_right,
          //         color: Colors.amber,
          //       ),
          //     ),
          //   ),
          //   datePickerCalendarView: DatePickerCalendarView.weekView,
          //   enableDenseViewForDates: true,
          //   enableDenseSplashForDates: true,
          //   datesForStreaks: [
          //     DateTime(2023, 01, 5),
          //     DateTime(2023, 01, 6),
          //     DateTime(2023, 01, 7),
          //     DateTime(2023, 01, 9),
          //     DateTime(2023, 01, 10),
          //     DateTime(2023, 01, 11),
          //     DateTime(2023, 01, 13),
          //     DateTime(2023, 01, 20),
          //     DateTime(2023, 01, 21),
          //     DateTime(2023, 01, 23),
          //     DateTime(2023, 01, 24),
          //     DateTime(2023, 01, 25),
          //   ],
          //   dateSelectionMode: DatePickerSelectionMode.disable,
          //   onCalendarViewDate: (DateTime calendarViewDate) {
          //     // print(calendarViewDate);
          //   },
          //   startWeekday: WeekDay.monday,
          //   weekdaysSymbol: const Weekdays(
          //     sunday: "s",
          //     monday: "m",
          //     tuesday: "t",
          //     wednesday: "w",
          //     thursday: "t",
          //     friday: "f",
          //     saturday: "s",
          //   ),
          //   monthsSymbol: const Months(
          //       january: "Jan",
          //       february: "Feb",
          //       march: "Mar",
          //       april: "Apr",
          //       may: "May",
          //       june: "Jun",
          //       july: "Jul",
          //       august: "Aug",
          //       september: "Sep",
          //       october: "Oct",
          //       november: "Nov",
          //       december: "Dec"),
          //   weekdaysProperties: WeekdaysProperties(
          //     generalWeekdaysDecoration:
          //         WeekdaysDecoration(weekdayTextColor: Colors.red),
          //     sundayDecoration: WeekdaysDecoration(
          //         weekdayTextColor: Colors.green,
          //         weekdayTextStyle:
          //             Theme.of(context).textTheme.headlineMedium),
          //     saturdayDecoration: WeekdaysDecoration(
          //         weekdayTextColor: Colors.green,
          //         weekdayTextStyle:
          //             Theme.of(context).textTheme.headlineMedium),
          //   ),
          // ),
          // ],
          // ),
          // ],
          // ),
        ),
      ),
    );
  }
}

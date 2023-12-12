List<Map<int, dynamic>> Date = [
{
1: 'January',
2: 'February',
3: 'March',
4: 'April',
5: 'May',
6: 'June',
7: 'July',
8: 'August',
9: 'September',
10: 'October',
11: 'November',
12: 'December',
},
  {
    1: 'Monday',
    2: 'Tuesday',
    3: 'Wednesday',
    4: 'Thursday',
    5: 'Friday',
    6: 'Saturday',
    7: 'Sunday',
  }
];
class Util{
  String formatTime(DateTime dateTime){
    return '${dateTime.day} ${Date[0][dateTime.month]} ${dateTime.year} - ${Date[0][dateTime.weekday]}';
  }
}

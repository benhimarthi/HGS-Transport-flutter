enum Filter { mounth, year }

class PricePoint {
  late Filter filter;
  late double y;
  late double x;
  PricePoint({required this.x, required this.y});

  static xDatas(filter) {
    return filter.index == Filter.mounth.index
        ? [
            "January",
            "February",
            "March",
            "April",
            "May",
            "June",
            "July",
            "August",
            "September",
            "October",
            "November",
            "December"
          ]
        : [" Mo", " tu ", " We ", " Th ", " Fr ", " Sa ", " Su "];
  }
}

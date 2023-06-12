class DriverCarInfos {
  String licensePlate;
  String carmodel;

  DriverCarInfos({required this.licensePlate, required this.carmodel});
  factory DriverCarInfos.fromJson(json) {
    return DriverCarInfos(
        licensePlate: json['licensePlate'], carmodel: json['carModel']);
  }
}

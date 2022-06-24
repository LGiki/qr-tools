class Wifi {
  String? authenticationType;
  String? ssid;
  String? password;
  bool? isHidden;

  Wifi.empty();
  Wifi(this.authenticationType, this.ssid, this.password, this.isHidden);
}

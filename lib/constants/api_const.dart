class ApiConst {
  static String weatherData(String name) {
    return 'https://api.openweathermap.org/data/2.5/weather?q=$name,&appid=41aa18abb8974c0ea27098038f6feb1b';
  }

  static String getIcon(String iconData, int iconSize) {
    return 'https://openweathermap.org/img/wn/$iconData@${iconSize}x.png';
    // 'https://openweathermap.org/img/wn/$iconData@${iconSize}x.png';
  }
}

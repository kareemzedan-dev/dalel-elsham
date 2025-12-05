int mapDurationToDays(String value) {
  switch (value) {
    case "أسبوع":
      return 7;
    case "أسبوعين":
      return 14;
    case "شهر":
      return 30;
    default:
      return 0;
  }
}

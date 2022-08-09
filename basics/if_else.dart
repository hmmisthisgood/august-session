main() {
  print("always runs");

  String day = "Tuesday"; // tuesday

  if (day.toUpperCase() == "tuesday") {
    print("small");
  }

  if (day == "monday") {
    print("Office restarts toady");
  } else {
    print("Not monday today");
  }

  if (day == "sunday" || day == "saturday") {
    print("today is holiday");

    if (day == "sunday") {
      print(" not everyone has holiday today");
    }

    if (day == "saturday") {
      print("everyone has holiday");
    }
  } else if (day == "friday") {
    print("there is half holiday");
  } else if (day == "wednesday") {
    print("progarm in office");
  } else {
    print("today you have to go office");
  }

  switch (day) {
    case "sunday":
      print("sun");
      break;

    case "monday":
      print("mon");
      break;
    case "tuesday":
      print("tue");
      break;
    default:
      print("others");
  }
}



/// if , else , else if , switch , case , default 
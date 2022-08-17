enum UserType {
  inviter,
  receptionist,
  goldOrDiamond
}

class User {
  static String getEnUserType(UserType userType) {
    switch(userType) {
      case UserType.inviter:
        return "Inviter";
      case UserType.receptionist:
        return "Receptionist";
      case UserType.goldOrDiamond:
        return "Gold / Diamond";
    }
  }
  static String getArUserType(UserType userType) {
    switch(userType) {
      case UserType.inviter:
        return "صاحب المناسبة";
      case UserType.receptionist:
        return "موظف";
      case UserType.goldOrDiamond:
        return "باقة ذهبية/ ماسية";
    }
  }
}
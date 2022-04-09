/// Account class which contains userid of users and login state
class Account{
  static int userid = 3;
  late bool login = false;

/// Constructs account class with appropriate log in state provided user logs in correctly
Account(int id, bool log){
userid = id;
bool login = log;

}

static int getUserID(){
  return userid;
}

void setUserID(int id){
  userid = id;
}


}
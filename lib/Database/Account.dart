
class Account{
  static int userid = 3;
  late bool login = false;


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



class UserBean{
  String userName;
  String realName;
  int age;
  int id;

  static UserBean fromJson(Map<String,dynamic> data){

    ///解析第二层
    UserBean userBean = new UserBean();
    userBean.id = data["id"];
    userBean.age = data["age"];
    userBean.userName= data["userName"];
    userBean.realName = data["realName"];
    return userBean;

  }
}
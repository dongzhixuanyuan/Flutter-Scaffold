

class Api {

  //IP地址
  static const String IP = "139.159.154.117";
  //服务器Tomcat地址
  static const String BaseTomcatUrl = "http://"+ IP +":8080/";
  //服务器接口地址
  static const String BaseUrl = "http://" + IP + ":8080/travel/";
  //用户头像图片地址
  static const String ImageUrl = BaseTomcatUrl + "images/people.jpg";
  //登录请求接口
  static const String SetLogin = BaseUrl + "login/json.action";
  //登录获取接口
  static const String GetLogin = BaseUrl + "login.json";
  //注册请求接口
  static const String SetRegister = BaseUrl + "register/json.action";
  //旅游攻略请求接口
  static const String SetStrategy = BaseUrl + "strategy/json.action";
  //旅游攻略获得接口
  static const String GetStrategy = BaseUrl + "strategy.json";
  //火车票请求接口
  static const String SetTrain = BaseUrl + "train/json.action";
  //火车票获得接口
  static const String GetTrain = BaseUrl + "train.json";
}
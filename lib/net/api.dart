class Api {
  //IP地址
  static const String IP = "139.159.154.117";
  //服务器Tomcat地址
  static const String BaseTomcatUrl = "http://"+ IP +":8080/travel/";
  //服务器接口地址
  static const String BaseUrl = "http://" + IP + ":8080/travelsys/";
  //用户头像图片地址
  static const String ImageUrl = BaseTomcatUrl + "people.jpg";
  //登录请求接口
  static const String SetLogin = BaseUrl + "login/json.action"; //ok
  //登录获取接口
  static const String GetLogin = BaseTomcatUrl + "login.json"; //ok
  //注册请求接口
  static const String SetRegister = BaseUrl + "register/json.action";
  //旅游攻略请求接口
  static const String SetStrategy = BaseUrl + "strategy/json.action";//ok
  //旅游攻略获得接口
  static const String GetStrategy = BaseTomcatUrl + "strategy.json";//ok
  //火车票请求接口
  static const String SetTrain = BaseUrl + "train/json.action";//ok
  //火车票获得接口
  static const String GetTrain = BaseTomcatUrl + "train.json"; //ok
  //机票请求接口
  static const String SetFlight = BaseUrl + "flight/json.action";//ok
  //机票获得接口
  static const String GetFlight = BaseTomcatUrl + "flight.json"; // ok
  //评价列表请求接口
  static const String SetEvaluate = BaseUrl + "evaluate/json.action";
  //评价列表获得接口
  static const String GetEvaluate = BaseTomcatUrl + "evaluate.json"; //ok
  //评价请求接口
  static const String SetInsertEvaluate = BaseUrl + "insertevaluate/json.action";
  //购票请求接口
  static const String SetInsertOrders = BaseUrl + "buytickets/json.action";
  //用户购票订单请求接口
  static const String SetOrders = BaseUrl + "orders/json.action";
  //用户购票订单获得接口
  static const String GetOrders = BaseTomcatUrl + "orders.json";
  //修改密码请求接口
  static const String UpdatePassword = BaseUrl + "modify/json.action";
}

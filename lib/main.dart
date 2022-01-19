import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fumeric数数器',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.pink,
      ).copyWith(
        secondary: Colors.pink,
      )),
      home: const Fumeric(),
    );
  }
}

class Fumeric extends StatefulWidget {
  const Fumeric({Key? key}) : super(key: key);

  @override
  _FumericState createState() => _FumericState();
}

class _FumericState extends State<Fumeric> {
  PageController controller = PageController();
  int currentIndex = 0;
  TextEditingController tc1 = TextEditingController(text: "4");
  TextEditingController tc2 = TextEditingController(text: "10001");
  String result = "错误";
  final EdgeInsets ei = const EdgeInsets.all(20);
  final TextStyle rs = const TextStyle(fontSize: 18);
  late TextStyle rn;
  String rc = "错误";
  String w1 = "错误";
  String n1 = "null";
  String n2 = "null";
  String on1 = "null";
  String on2 = "null";

  @override
  void initState() {
    onChange();
    super.initState();
  }

  void onChange() {
    var num1 = int.tryParse(tc1.text);
    var num2 = int.tryParse(tc2.text);
    if (num1 == null || num2 == null) {
      setState(() {
        on1 = num1.toString();
        on2 = num2.toString();
        n1 = num1.toString();
        n2 = num2.toString();
        result = "错误";
        rc = "错误";
        w1 = "错误";
      });
      return;
    }
    if (num2 < num1) {
      var tmp = num2;
      num2 = num1;
      num1 = tmp;
    }
    int r = 0;
    for (int i = num1; i <= num2; i++) {
      r += 1;
    }
    setState(() {
      on1 = num1.toString();
      on2 = num2.toString();
      n1 = num2.toString();
      n2 = num1.toString();
      result = r.toString();
      rc = (num2! - (num1! - 1)).toString();
      w1 = (num2 - num1).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    rn =
        TextStyle(fontSize: 32, color: Theme.of(context).colorScheme.secondary);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.calculate),
            Text(" - Fumeric数数器"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          controller.jumpToPage(index);
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "数数",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "设置"),
        ],
      ),
      body: PageView(
        controller: controller,
        children: [
          SingleChildScrollView(
              child: Column(
            children: [
              Container(
                padding: ei,
                child: Row(
                  children: [
                    const Text("第一个数："),
                    Expanded(
                      child: TextField(
                        controller: tc1,
                        onChanged: (value) => onChange(),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: ei,
                child: Row(
                  children: [
                    const Text("第二个数："),
                    Expanded(
                      child: TextField(
                        controller: tc2,
                        onChanged: (value) => onChange(),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "从 $on1 到 $on2 一共有 ",
                        style: rs,
                      ),
                      Text(
                        rc,
                        style: rn,
                      ),
                      Text(
                        " 个数",
                        style: rs,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "计算方法：",
                        style: rs,
                      ),
                      Text(
                        n1,
                        style: rn,
                      ),
                      Text(
                        " - ",
                        style: rs,
                      ),
                      Text(
                        "($n2 - 1)",
                        style: rn,
                      ),
                      Text(
                        " = ",
                        style: rs,
                      ),
                      Text(
                        rc,
                        style: rn,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "数出来的验算结果：",
                        style: rs,
                      ),
                      Text(
                        result,
                        style: rn,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "错误案例：$n1 - $n2 = $w1",
                      )
                    ],
                  ),
                  const Divider(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "学废了嘛？",
                        style: rn,
                      ),
                    ],
                  )
                ],
              ),
            ],
          )),
          SingleChildScrollView(
            child: Container(
              padding: ei,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("欢迎使用Fumeric - Flutter Numeric数数器！"),
                  Text("项目地址： https://github.com/3vau/fumeric"),
                  Text(
                      "本程序对数数的方法进行了互动性的讲解与示范，同时提供了常见的错误案例，确保每位同学在使用过后都能掌握数数的方法！"),
                  Text(
                      "同时本程序还使用了真正的数数算法对结果进行验算，确保最终结果真实可靠，让你的设备成为你最忠实强大的手指，每秒能掰数百万次！"),
                  Text(
                      "本程序使用Flutter开发，界面美观大气，平台兼容强大，代码简单干净，全部代码仅 270 行，绝不占用多余的资源，采用GPL v3发布，欢迎学习与交流！"),
                  Text("本程序前途无量！若反馈积极，夜间模式、国际化、主题颜色、四舍五入、取消验算等诸多功能还将相继推出！"),
                  Text("尽情享受数数带来的快乐吧！"),
                  Divider(height: 20),
                  Text("本程序背后的故事："),
                  Text("2022年1月19日晨，开发者在上网课时被数学老师点名回答问题。"),
                  Text("老师询问我：“8到13之间有多少个数呀？”"),
                  Text("看着老师慈祥的面容，我竟一时语塞。"),
                  Text("于是老师便循循善诱，用8到13、4到21、4到10001等多个例子引导我，终于教会了我了数数的方法。"),
                  Text("受到老师如此有教无类、因材施教之感召，我决定向老师学习，传播正能量，让天下无人不会数数！"),
                  Text("你面前的这个应用，就是我的答卷！希望它能带给你知识与欢乐！"),
                  Divider(height: 50),
                  Text("Fumeric数数器    v1.0.0"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

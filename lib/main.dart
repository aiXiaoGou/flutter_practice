import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // このウィジェットがアプリケーションのルートです。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // これがアプリケーションのテーマです。
        //
        // 試してみよう: 「flutter run」でアプリを実行すると、
        // アプリケーションのツールバーが紫色になります。アプリを閉じずに
        // 下記のcolorSchemeのseedColorをColors.greenなどに変更して、
        // 「ホットリロード」を試してみてください
        // (変更を保存するか、Flutter対応のIDEで「ホットリロード」ボタンを押すか、
        // コマンドラインで起動した場合は「r」を押してください)。
        //
        // カウンターがゼロにリセットされないことに注目してください。
        // ホットリロード中はアプリケーションの状態が保持されます。
        // 状態をリセットしたい場合は、代わりにホットリスタートを使用してください。
        //
        // これは値の変更だけでなくコードの変更にも有効です。
        // 多くのコード変更はホットリロードだけでテストできます。
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // このウィジェットがアプリケーションのホームページです。
  // ステートフルであるため、表示に影響するフィールドを含むStateオブジェクト
  // (下で定義)を持ちます。

  // このクラスはStateの設定を保持します。親(この場合はAppウィジェット)から提供された
  // 値(今回はタイトル)を保持し、Stateのbuildメソッドで使用されます。
  // ウィジェットサブクラスのフィールドは常に「final」としてマークします。

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // このsetStateの呼び出しはFlutterフレームワークにこのState内で変更があったことを伝えます。
      // それによって下のbuildメソッドが再実行され、表示が更新された値を反映します。
      // setStateを呼ばずに_counterを変更した場合、buildメソッドは再実行されず、
      // 何も起きていないように見えます。
      _counter++;
      // print("HelloWorld");
    });
  }

  @override
  Widget build(BuildContext context) {
    // このメソッドはsetStateが呼ばれるたびに再実行されます。
    // 例えば、上の_incrementCounterメソッドによって呼ばれます。
    //
    // Flutterフレームワークはbuildメソッドの再実行を高速化するように最適化されているため、
    // 個々のウィジェットインスタンスを変更する代わりに、必要な部分だけを再構築できます。
    return Scaffold(
      appBar: AppBar(
        // 試してみよう: ここで色を特定の色(例えばColors.amberなど)に変更して、
        // ホットリロードでAppBarの色が変更されるのを確認してください。
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // ここでApp.buildメソッドによって作成されたMyHomePageオブジェクトからの値を取得し、
        // AppBarのタイトルに設定しています。
        // title: Text(widget.title),
        title: Row(children: const [Icon(Icons.create), Text("初めてのタイトル")]),
      ),
      body: Column(
        children: [
          const Text("Hello World"),
          const Text("ハローワールド"),
          TextButton(
            onPressed: () => {print("ボタンが押されたよ")},
            child: const Text("テキストボタン"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.favorite, color: Colors.red, size: 24.0),
              Icon(Icons.audiotrack, color: Colors.green, size: 30.0),
              Icon(Icons.beach_access, color: Colors.blue, size: 36.0),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        // tooltip: 'Increment',
        // child: const Icon(Icons.add),
        onPressed: () => {print("押したね？")},
        child: const Icon(Icons.timer),
      ),
      drawer: const Drawer(child: Center(child: Text("Drawer"))),
      endDrawer: const Drawer(child: Center(child: Text("EndDrawer"))),
      // 末尾のカンマによりbuildメソッドでの自動整形が綺麗になります。
    );
  }
}

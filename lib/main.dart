import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // /24/ This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({super.key, required this.title});

  var weightController = TextEditingController();
  var feetController = TextEditingController();
  var inchController = TextEditingController();
  var result="" ;
  var bgColor=Colors.indigo.shade200;
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: widget.bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI Calculator',style:TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w600
                ),),

                SizedBox(height: 21,),

                TextField(controller: widget.weightController,decoration: InputDecoration(
                  label: Text('Enter weight in kgs'),prefixIcon: Icon(Icons.line_weight)),
                keyboardType: TextInputType.number,),

                SizedBox(height: 12,),

                TextField(controller: widget.feetController,decoration: InputDecoration(
                  label: Text("Enter height in feets"),
                prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 12,),

                TextField(controller: widget.inchController,decoration:InputDecoration(
                  label: Text("Enter height in inches"),prefixIcon: Icon(Icons.height)
                ),keyboardType: TextInputType.number,),

                SizedBox(height: 18,),

                ElevatedButton(onPressed: (){
                  var wt=widget.weightController.text.toString();
                  var ft=widget.feetController.text.toString();
                  var inch=widget.inchController.text.toString();

                  if(wt!="" && ft!="" && inch!="")
                    {
                        //BMI calculation
                      var intWeight = int.parse(wt);
                      var intFeet = int.parse(ft);
                      var intInch = int.parse(inch);

                      var totalInch = (intFeet*12)+intInch;
                      var totalCm = totalInch*2.54;
                      var totalM = totalCm/100;
                      var totalBMI = intWeight/(totalM*totalM);
                      var msg="";

                      if(totalBMI>25){
                        msg = "Overweight!!";
                        widget.bgColor=Colors.orange.shade200;
                      }else if(totalBMI<18){
                        msg = "Underweight!!";
                        widget.bgColor=Colors.red.shade200;
                      }else{
                        msg = "Healthy!!";
                        widget.bgColor=Colors.green.shade200;
                      }

                      setState(() {
                        widget.result="$msg \n Your BMI : ${totalBMI.toStringAsFixed(4)}";
                      });
                    }
                  else{
                    setState(() {
                      widget.result="Please fill all the required blanks!!!";
                    });
                  }

                }, child: Text('Calculate')),

                SizedBox(height: 18,),

                Text(widget.result,style: TextStyle(fontSize: 19),)

              ],
            ),
          ),
        ),
      )
    );
  }
}

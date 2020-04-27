import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizeapp/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizbrain = QuizBrain();

void main() => runApp(
    Quizer()
);

class Quizer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: Text('Hygiene questions',),
          centerTitle: true,
          titleSpacing: 1.5,
          
        ),
        body: SafeArea(
            child:Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizePage(),

            ),


        ),
      ),
    );
  }
}
class QuizePage extends StatefulWidget {
  @override
  _QuizePageState createState() => _QuizePageState();
}

class _QuizePageState extends State<QuizePage> {
  List<Icon>ScoreKeeper = [];

  void checkAnswer(bool userPickedAnswer)
  {
    bool correctAnswer = quizbrain.getCorrectAnswer();
    setState(() {
       if(quizbrain.isFinished()==true)
         {
           Alert(context: context, title: 'Finished!',
             desc: 'You\'have reached the end of the quiz',
           ).show();
           quizbrain.reset();
           ScoreKeeper =[];
         }
       else
         {
           if(userPickedAnswer==correctAnswer)
             {
               ScoreKeeper.add(Icon(
                 Icons.check,
                 color: Colors.green,
               ));

             }
           else
             {
               ScoreKeeper.add(Icon(
                 Icons.close,
                 color: Colors.red,
               ));
             }
           quizbrain.nextQuestion();
         }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        Expanded(
          flex: 5,
            child:Padding(
                padding:EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizbrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
        ),
        Expanded(
            child: Padding(
                padding: EdgeInsets.all(15.0),
              child:FlatButton(
                color: Colors.green.shade900,

                  child: Text(
                      'True',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                  ),
                onPressed:(){
                  checkAnswer(true);
                }
              ),
            ),

        ),

        Expanded(
            child:Padding(
                padding: EdgeInsets.all(15.0),
              child: FlatButton(
                color: Colors.red.shade900,
                  child: Text(
                    'False',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,

                    ),
                  ),

                  onPressed:(){
                  checkAnswer(false);
                  }),
            )
        ),
        Row(
          children: ScoreKeeper,
        ),
      ],
    );
  }
}

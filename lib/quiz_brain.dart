import 'question.dart';

class QuizBrain{

  int _questionNumber= 0;

  List<Question>_questionBank =[

    Question(' washing your hair too much can ruin your hair', true),
    Question('wearing flip flops in public showers prevents athlete\'s foot ', true),
    Question('scrubbing well doesn\'t remove any germs ', false),
    Question('using your own comb and not sharing it can prevent head lice ', true),
    Question('deodorant keeps you from sweating', false),
    Question('antiperspirant hides body odor',false ),
    Question('body odor is caused by bacteria interacting with sweat ',true ),
    Question('brushing your teeth at least twice a day wont remove plaque ',false ),
    Question('flossing everyday doesn\'t remove food particles ',false ),
    Question('Using a tangue brush can help remove bacteria that cause bad breath ',true ),
    Question('You can die from not washing your hands  ',true ),
    Question('The genital area needs a special cleaning routine ', true),
    Question('Hand sansitizer can replace hand wash  ', false),
    Question('Wearing of cloves can replace hand wash ',false ),
  ];

void nextQuestion(){
  if(_questionNumber<_questionBank.length-1)
    {
      _questionNumber++;
    }
}
String getQuestionText()
{
  return _questionBank[_questionNumber].questionText;
}

bool getCorrectAnswer()
{
  return _questionBank[_questionNumber].questionAnswer;
}

bool isFinished()
{
  if(_questionNumber>=_questionBank.length-1)
    {
      print("Now returning true");
      return true;
    }
  else{
    return false;

  }
}

void reset()
{
  _questionNumber = 0;
}
}
import 'package:redux/redux.dart';
import './ButtonListAction.dart';



final buttonListReducer = TypedReducer<List, ButtonListAction>(buttonListActionReducer);

List buttonListActionReducer(List state, ButtonListAction action){

  List newList=[];
  print("I am in reducer ar ahahahahhaahahahahahahahahaahahahahahahahahahahahahahahaahah");
  print(action.stopsFromApicall);

  for(var i in action.stopsFromApicall){
    if(action.stopsFromApicall.indexOf(i)==0){
      newList.add([action.stopsFromApicall.indexOf(i), true]);
    }
    else{
      newList.add([action.stopsFromApicall.indexOf(i), false]);
    }
  }

  return action.stopsFromApicall;
}
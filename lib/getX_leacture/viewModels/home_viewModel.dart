
import 'package:get/state_manager.dart';

class HomeVM extends GetxController{
  RxInt number = 0.obs;
  int num = 900;
  addNum(){
    number++;
    num++;
    // update();
  }
  minNum(){
    number--;
    num--;
    // update();
  }
}
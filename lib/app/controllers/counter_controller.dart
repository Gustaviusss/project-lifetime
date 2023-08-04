import 'dart:async';

import 'package:get/get.dart';

class CounterController extends GetxController {
//Outra forma de declarar, mas a própria documentação indica o uso do var
// final RxInt seconds = 0.obs;
  var seconds = 0.obs;
  var minutes = 0.obs;
  var hours = 0.obs;

  var digitSeconds = '00'.obs;
  var digitMinutes = '00'.obs;
  var digitHours = '00'.obs;

  var started = false.obs;

  var records = [].obs;
  Timer? timer;

//Para o contador
  void stop() {
    timer!.cancel();
    started.value = false;
  }

  void reset() {
    timer!.cancel();

    seconds.value = 0;
    minutes.value = 0;
    hours.value = 0;

    digitSeconds.value = '00';
    digitMinutes.value = '00';
    digitHours.value = '00';

    started.value = false;
  }

  void addProjectsDuration() {
    String recordItem =
        '${digitHours.value}:${digitMinutes.value}:${digitSeconds.value}';
    records.add(recordItem);
  }

  void start() {
    started.value = true;

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        int localSeconds = seconds.value + 1;
        int localMinutes = minutes.value;
        int localHours = hours.value;

        if (localSeconds > 59) {
          if (localMinutes > 59) {
            localHours++;

            localMinutes = 0;
          } else {
            localMinutes++;
            localSeconds = 0;
          }
        }
        seconds.value = localSeconds;
        minutes.value = localMinutes;
        hours.value = localHours;

        digitSeconds.value = (seconds.value > 9) ? "$seconds" : "0$seconds";
        digitMinutes.value = (minutes.value > 9) ? "$minutes" : "0$minutes";
        digitHours.value = (hours.value > 9) ? "$hours" : "0$hours";
      },
    );
  }
}

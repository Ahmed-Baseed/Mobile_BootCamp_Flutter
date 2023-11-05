import 'package:mobile_bootcamp_flutter/api_mokhtar_part2/core/repositories/data_repo.dart';

class DataBaseRepo extends DataRepo {
  @override
  Future<Map<String, dynamic>> getData(
      {required String source, List<String>? columns}) {
    // TODO: implement getData
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> postData(
      Map<String, dynamic> dataToSend, String source) {
    throw UnimplementedError();
  }
}

import 'package:blogresponsive/Api_get_services/Api_get_services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

import '../Api_res_model/newsGModel.dart';

class NewsController extends GetxController {
  RxBool isLoading = true.obs;
  // var newsdataList = <NewsGModel>[].obs;
  NewsGModel? productList;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchServices();
    super.onInit();
  }

  void fetchServices() async {
    isLoading(true);
    try {
      var Service = await ApiGetServices.newsdataservice();
      if (Service != null) {
        // newsdataList.value = Service;
        productList = Service;
      }
    } finally {
      isLoading(false);
    }
  }
}

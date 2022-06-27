import 'package:flutter/material.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';

import '../../controllers/job_controller.dart';

class JobView extends GetView<JobController> {
  const JobView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => JobController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nghề nghiệp', style: TextStyle(color: Colors.black)),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back,
              color: Dimensions.primaryColor
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Obx(() => Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(padding: const EdgeInsets.all(10), child: const Text('Chọn nghề nghiệp', style: TextStyle(fontSize: 16))),
                  for(var i = 0 ; i < controller.jobLists.length; i++)
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(controller.jobLists[i], style: const TextStyle(fontSize: 16)),
                            controller.checked[i] ? const Icon(Icons.done, color: Dimensions.primaryColor, size: 20) : Container()
                          ],
                        ),
                      ),
                      onTap: () {
                        controller.clickJob(i);
                      },
                    )
                ],
              ),
            ),
          ),
          controller.isDataProcessing.value
              ? const Center(child: CircularProgressIndicator(backgroundColor: Dimensions.primaryColor))
              : Container()
        ],
      )),
      bottomNavigationBar: Obx(() => Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: controller.isChosen.value ? () {
            controller.clickSave('job', controller.jobLists[controller.curIndex]);
          } : null,
          style: ButtonStyle(
            backgroundColor: controller.isChosen.value && !controller.isDataProcessing.value ? MaterialStateProperty.all<Color>(Dimensions.primaryColor) : MaterialStateProperty.all<Color>(const Color(0xFFe1e1e1)),
          ),
          child: const Text('Lưu', style: TextStyle(fontSize: 16),),

        ),
      ),
    ));
  }
}

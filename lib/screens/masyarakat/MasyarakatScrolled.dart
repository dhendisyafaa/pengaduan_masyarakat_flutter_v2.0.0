import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengaduan_masyarakat_flutter/controllers/masyarakatController.dart';
import 'package:pengaduan_masyarakat_flutter/models/masyarakatModel.dart';
import 'package:pengaduan_masyarakat_flutter/screens/masyarakat/EditMasyarakatPage.dart';

class MasyarakatScrolled extends StatelessWidget {
  final List<masyarakatModel> stories;
  final Function(masyarakatModel) onStoryClicked;

  MasyarakatScrolled({required this.stories, required this.onStoryClicked});
  final MasyarakatController controller = Get.put(MasyarakatController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (BuildContext context, int index) {
          final masyarakat = controller.listMasyarakat.value.elementAt(index);
          return GestureDetector(
            onTap: () {
              // if (masyarakat != null) {
              // }
              onStoryClicked(masyarakat);
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    child: Text("data"),
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // image: DecorationImage(
                      //   image: NetworkImage(masyarakat?.avatarUrl ?? ''),
                      //   fit: BoxFit.cover,
                      // ),
                      border: Border.all(
                        color: Colors.pink,
                        width: 2.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    masyarakat?.nama ?? '',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

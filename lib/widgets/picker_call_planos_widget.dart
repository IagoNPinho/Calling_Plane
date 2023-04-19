import 'package:plano_telefonico/model/call_plane_model.dart';
import 'package:flutter/material.dart';

class PickerCallPlaneWidget extends StatefulWidget {
  final String title;
  final Function({required String planes}) onPlaneSelected;

  const PickerCallPlaneWidget({
    Key? key,
    required this.title,
    required this.onPlaneSelected,
  }) : super(key: key);

  @override
  State<PickerCallPlaneWidget> createState() => _PickerCallPlaneWidgetState();
}

class _PickerCallPlaneWidgetState extends State<PickerCallPlaneWidget> {
  String? plane;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade700,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 120,
              width: 60,
              child: GridView(
                padding: const EdgeInsets.symmetric(vertical: 4),
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 8,
                  childAspectRatio: 2,
                ),
                children: CallPlaneModel()
                    .planes
                    .map(
                      (planes) => GestureDetector(
                        onTap: () {
                          setState(() {
                            plane = planes;
                          });
                          widget.onPlaneSelected(planes: plane!);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            border: Border.all(
                              color: planes == plane
                                  ? Colors.blue
                                  : Colors.grey,
                              width: 1.7,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(planes),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

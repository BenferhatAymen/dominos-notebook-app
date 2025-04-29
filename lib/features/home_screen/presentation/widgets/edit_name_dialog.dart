import 'package:flutter/material.dart';

class EditNameDialog extends StatelessWidget {
  EditNameDialog({
    super.key,
    this.onSave,
    this.title = "EDIT NAME",
    this.onChanged,
    required this.controller,
    required this.formKey,
  });
  VoidCallback? onSave;
  Function(String)? onChanged;
  String title;
  TextEditingController controller;
  GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 0, 8, 15),
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(12)),
              child: Container(
                padding: EdgeInsets.zero,
                width: media.width * 0.9,
                child: TextFormField(
                  validator: (text) {
                    if (text != null) {
                      if (text.isNotEmpty) {
                        if (text.length > 12) {
                          return "Name length is between 1 and 11";
                        }
                      } else {
                        return 'Please insert a valid name';
                      }
                    } else {
                      return 'Please insert a valid name';
                    }
                  },
                  controller: controller,
                  onChanged: onChanged,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  autofocus: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 12),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        onSave!();
                        Navigator.pop(context);
                        controller.clear();
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

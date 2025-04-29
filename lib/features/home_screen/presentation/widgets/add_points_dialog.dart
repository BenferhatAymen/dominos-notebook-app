import 'package:flutter/material.dart';

class AddPointsDialog extends StatelessWidget {
  AddPointsDialog({
    super.key,
    this.onSave,
    this.title = "ADD POINTS",
    this.onChanged,
    required this.controller,
    required this.formKey,
  });

  final VoidCallback? onSave;
  final Function(String)? onChanged;
  final String title;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 0, 8, 15),
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
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
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                padding: EdgeInsets.zero,
                width: media.width * 0.9,
                child: TextFormField(
                  controller: controller,
                  onChanged: onChanged,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please insert a number';
                    }
                    if (int.tryParse(text) == null) {
                      return 'Please insert a valid number';
                    }
                    if (int.parse(text) > 100) {
                      return 'Points can not be higher than 100';
                    }
                    return null;
                  },
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
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
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        onSave?.call();
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                        controller.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.w700,
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

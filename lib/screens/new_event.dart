import 'package:events_app/compoments/button.dart';
import 'package:events_app/compoments/input_field.dart';
import 'package:events_app/events/keyboard.dart';
import 'package:flutter/material.dart';

class NewEvent extends StatefulWidget {
  const NewEvent({super.key});

  @override
  State<NewEvent> createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> with WidgetsBindingObserver {
  bool isKeyboardVisible = false;
  late KeyboardVisibilityObserver _keyboardVisibilityObserver;

  @override
  void initState() {
    super.initState();
    _keyboardVisibilityObserver = KeyboardVisibilityObserver(
      onKeyboardShow: () {
        setState(() {
          isKeyboardVisible = true;
        });
      },
      onKeyboardHide: () {
        setState(() {
          isKeyboardVisible = false;
        });
      },
    );
    WidgetsBinding.instance.addObserver(_keyboardVisibilityObserver);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_keyboardVisibilityObserver);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
        title: const Text('New Event',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          height: isKeyboardVisible
              ? MediaQuery.of(context).size.height
              : MediaQuery.of(context).size.height - 100,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const InputField(hintText: 'Name'),
              const InputField(hintText: 'Time'),
              const InputField(hintText: 'Location'),
              const InputField(hintText: 'Price'),
              const InputField(hintText: 'Image'),
              SizedBox(height: isKeyboardVisible ? 20 : 220),
              ButtonCommon(
                textButton: 'Submit',
                onPress: () {},
                width: double.infinity,
                padding: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}

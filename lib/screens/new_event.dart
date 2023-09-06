import 'dart:math';

import 'package:events_app/compoments/button.dart';
import 'package:events_app/compoments/date_picker.dart';
import 'package:events_app/compoments/input_field.dart';
import 'package:events_app/constants.dart';
import 'package:events_app/cubit/events_cubit.dart';
import 'package:events_app/cubit/events_state.dart';
import 'package:events_app/events/keyboard.dart';
import 'package:events_app/models/event.dart';
import 'package:events_app/services/event_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewEvent extends StatefulWidget {
  const NewEvent({super.key});

  @override
  State<NewEvent> createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> with WidgetsBindingObserver {
  bool isKeyboardVisible = false;
  late KeyboardVisibilityObserver _keyboardVisibilityObserver;
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageController = TextEditingController();
  String dateTime = "";
  final apiService = ApiService();
  late FToast fToast;
  bool _isLoading = false;

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
    fToast = FToast();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    fToast.init(context);
  }

  Future _handleSubmit() async {
    EventModel event = EventModel.newEvent();
    event.id = '';
    event.name = _nameController.text;
    event.time = dateTime;
    event.location = _locationController.text;
    event.price = int.parse(_priceController.text);
    event.image = _imageController.text;
    setState(() {
      _isLoading = true;
    });
    // final response = await apiService.createEvent(event);
    await context.read<EventsCubit>().createEventCubit(event);
    setState(() {
      _isLoading = false;
    });
    fToast.showToast(
      child: ButtonCommon(
        textButton: 'Create Event Success!',
        onPress: () {},
        width: MediaQuery.of(context).size.width * 0.5,
      ),
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: 2),
    );
    clearTextInput();
  }

  clearTextInput() {
    _nameController.clear();
    _locationController.clear();
    _priceController.clear();
    _imageController.clear();
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
              InputField(hintText: 'Name', controller: _nameController),
              DatePicker(
                hintText: 'Time',
                onChanged: (date) {
                  dateTime = date.toString();
                },
              ),
              InputField(
                hintText: 'Location',
                controller: _locationController,
              ),
              InputField(
                hintText: 'Price',
                controller: _priceController,
              ),
              InputField(
                hintText: 'Image',
                controller: _imageController,
              ),
              SizedBox(height: isKeyboardVisible ? 20 : 220),
              ButtonCommon(
                textButton: 'Submit',
                onPress: _handleSubmit,
                width: double.infinity,
                padding: 16,
                isLoading: _isLoading,
              )
            ],
          ),
        ),
      ),
    );
  }
}

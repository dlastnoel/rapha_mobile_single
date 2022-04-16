import 'package:flutter/material.dart';
import 'package:painter/painter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../providers/theme_provider.dart';

import '../preferences/medical_preferences.dart';

import '../routes/routing_constants.dart';

import '../helpers/toasts.dart';

class PresentIllnessPainterScreen extends StatefulWidget {
  const PresentIllnessPainterScreen({Key? key}) : super(key: key);

  @override
  State<PresentIllnessPainterScreen> createState() =>
      _PresentIllnessPainterScreenState();
}

class _PresentIllnessPainterScreenState
    extends State<PresentIllnessPainterScreen> {
  bool _finished = false;
  PainterController _controller = _newController();
  final ScreenshotController _screenshotController = ScreenshotController();
  Image? image;

  @override
  void initState() {
    super.initState();
    Toasts.showPainterGuideToast();
  }

  static PainterController _newController() {
    final PainterController _controller = PainterController();
    _controller.thickness = 5.0;
    _controller.backgroundColor = const Color.fromRGBO(255, 255, 255, 0);
    return _controller;
  }

  @override
  Widget build(BuildContext context) {
    final _medicalPreferences = MedicalPreferences();

    List<Widget> actions;
    if (_finished) {
      actions = <Widget>[
        IconButton(
          icon: const Icon(Icons.content_copy),
          tooltip: 'New Painting',
          onPressed: () => setState(() {
            _finished = false;
            _controller = _newController();
          }),
        ),
      ];
    } else {
      actions = <Widget>[
        IconButton(
            icon: const Icon(
              Icons.undo,
            ),
            tooltip: 'Undo',
            onPressed: () {
              if (_controller.isEmpty) {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) =>
                        const Text('Nothing to undo'));
              } else {
                _controller.undo();
              }
            }),
        IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Clear',
            onPressed: _controller.clear),
        IconButton(
          icon: const Icon(Icons.check),
          onPressed: () async {
            // final image = await _screenshotController.capture();
            // if (image == null) return;
            // final response = await saveImage(context, _medicalPreferences);
            // if (response) {
            final image = await _screenshotController.capture();
            if (image != null) {
              _medicalPreferences.setPresentIllessImage(image);
            }
            // await Provider.of<MedicalProvider>(context, listen: false)
            //     .addPresentIllnessImage(id);
            Navigator.pushNamed(context, presentIllnessScreenRoute);
            // }
          },
        ),
      ];
    }
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Present Illness',
          ),
          actions: actions,
          bottom: PreferredSize(
            child: DrawBar(
              painterController: _controller,
            ),
            preferredSize: Size(MediaQuery.of(context).size.width, 30.0),
          )),
      body: Screenshot(
        controller: _screenshotController,
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Provider.of<ThemeProvider>(context).humanAnatomy,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: AspectRatio(
            aspectRatio: 1.0,
            child: Painter(
              _controller,
            ),
          ),
        ),
      ),
    );
  }
}

class DrawBar extends StatelessWidget {
  const DrawBar({Key? key, required this.painterController}) : super(key: key);

  final PainterController painterController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Slider(
                value: painterController.thickness,
                onChanged: (double value) => setState(() {
                  painterController.thickness = value;
                }),
                min: 1.0,
                max: 20.0,
                activeColor: Colors.white,
              );
            },
          ),
        ),
        StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return RotatedBox(
              quarterTurns: painterController.eraseMode ? 2 : 0,
              child: IconButton(
                icon: const Icon(Icons.create),
                tooltip: (painterController.eraseMode ? 'Disable' : 'Enable') +
                    ' eraser',
                onPressed: () {
                  setState(
                    () {
                      painterController.eraseMode =
                          !painterController.eraseMode;
                    },
                  );
                },
              ),
            );
          },
        ),
        ColorPickerButton(
            painterController: painterController, background: false),
        ColorPickerButton(
            painterController: painterController, background: true),
      ],
    );
  }
}

class ColorPickerButton extends StatefulWidget {
  const ColorPickerButton({
    Key? key,
    required this.painterController,
    required this.background,
  }) : super(key: key);

  final PainterController painterController;
  final bool background;

  @override
  _ColorPickerButtonState createState() => _ColorPickerButtonState();
}

class _ColorPickerButtonState extends State<ColorPickerButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(_iconData, color: _color),
        tooltip:
            widget.background ? 'Change background color' : 'Change draw color',
        onPressed: () {
          _pickColor(context);
        });
  }

  void _pickColor(context) {
    Color pickerColor = _color;
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Pick color'),
            ),
            body: Container(
              alignment: Alignment.center,
              child: ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: (Color c) => pickerColor = c,
              ),
            ),
          );
        },
      ),
    )
        .then((_) {
      setState(() {
        _color = pickerColor;
      });
    });
  }

  Color get _color => widget.background
      ? widget.painterController.backgroundColor
      : widget.painterController.drawColor;

  IconData get _iconData =>
      widget.background ? Icons.format_color_fill : Icons.brush;

  set _color(Color color) {
    if (widget.background) {
      widget.painterController.backgroundColor = color;
    } else {
      widget.painterController.drawColor = color;
    }
  }
}

// Future<bool> saveImage(context, MedicalPreferences medicalPreferences) async {
//   final String imageString = await medicalPreferences.getPresentIllnessImage();
//   final response = Provider.of<MedicalProvider>(context, listen: false)
//       .addPresentIllnessImage(imageString);
//   return response;
// }

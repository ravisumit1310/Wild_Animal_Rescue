import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class SendPage extends StatefulWidget {
  const SendPage({Key? key}) : super(key: key);

  @override
  _SendPageState createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  File? _image;
  Position? _location;
  String? _message;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    final geolocator = GeolocatorPlatform.instance;
    final position = await geolocator.getCurrentPosition();
    setState(() {
      _location = position;
    });
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Page'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _getImage,
            child: const Text('Take a Picture'),
          ),
          const SizedBox(height: 16),
          Text(_location != null
              ? 'Location: ${_location?.latitude}, ${_location?.longitude}'
              : 'Getting Location...'),
          const SizedBox(height: 16),
          TextField(
            onChanged: (value) {
              setState(() {
                _message = value;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Message',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Send photo, location, and message
              // TODO: Implement send functionality
              print('Sending Photo: $_image');
              print('Sending Location: $_location');
              print('Sending Message: $_message');
            },
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }
}

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serial Number Validator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SerialNumberScreen(),
    );
  }
}

class SerialNumberScreen extends StatefulWidget {
  const SerialNumberScreen({super.key});

  @override
  _SerialNumberScreenState createState() => _SerialNumberScreenState();
}

class _SerialNumberScreenState extends State<SerialNumberScreen> {
  final TextEditingController _serialController = TextEditingController();
  String _message = '';
  bool _isValid = false;

  // Daftar serial number yang valid (6 digit)
  final List<String> _validSerialNumbers = [
    'ABC123',
    'DEF456',
    'GHI789',
    'JKL012',
    'MNO345'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serial Number Validation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_isValid) ...[
              TextField(
                controller: _serialController,
                decoration: InputDecoration(
                  labelText: 'Masukkan Serial Number',
                  border: OutlineInputBorder(),
                ),
                maxLength: 6,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _validateSerialNumber,
                child: Text('Validasi'),
              ),
            ],
            SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(
                color: _isValid ? Colors.green : Colors.red,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            if (_isValid)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isValid = false;
                    _message = '';
                    _serialController.clear();
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: Text('Reset'),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _validateSerialNumber() async {
    final serialNumber = _serialController.text.trim().toUpperCase();

    // Validasi format
    if (serialNumber.length != 6) {
      setState(() {
        _message = 'Serial number harus 6 karakter';
      });
      return;
    }

    // Validasi apakah serial number ada di daftar
    if (!_validSerialNumbers.contains(serialNumber)) {
      setState(() {
        _message = 'Serial number tidak valid';
      });
      return;
    }

    // Dapatkan device ID
    final deviceInfo = DeviceInfoPlugin();
    String? deviceId;

    try {
      if (Theme.of(context).platform == TargetPlatform.android) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.id; // Android ID
      } else if (Theme.of(context).platform == TargetPlatform.iOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor; // IDFV untuk iOS
      } else {
        deviceId = 'unknown';
      }
    } catch (e) {
      deviceId = 'error';
    }

    if (deviceId == 'unknown' || deviceId == 'error') {
      setState(() {
        _message = 'Gagal mendapatkan informasi perangkat';
      });
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final key = 'serial_$serialNumber';
    final storedDeviceId = prefs.getString(key);

    if (storedDeviceId == null) {
      // Serial number belum pernah digunakan di perangkat manapun
      await prefs.setString(key, deviceId!);
      setState(() {
        _message = 'Serial number berhasil diaktivasi untuk perangkat ini';
        _isValid = true;
      });
    } else if (storedDeviceId == deviceId) {
      // Serial number sudah terdaftar untuk perangkat ini
      setState(() {
        _message = 'Serial number valid untuk perangkat ini';
        _isValid = true;
      });
    } else {
      // Serial number sudah digunakan di perangkat lain
      setState(() {
        _message = 'Serial number sudah digunakan di perangkat lain';
      });
    }
  }
}

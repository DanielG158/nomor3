import 'package:flutter/material.dart';

void main() => runApp(LoginApp());

class LoginApp extends StatefulWidget {
  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  String _username = '';
  String _password = '';
  String _status = '';

  final Map<String, String> _users = {
    'atom': 'neutron',
    'uncle': 'rich',
    'user': 'CE Lab',
    'anon': 'flakes',
  };

  void _login() {
    if (_users.containsKey(_username) && _users[_username] == _password) {
      setState(() {
        switch (_username) {
          case 'atom':
          case 'uncle':
            _status = 'Selamat datang, $_username! Anda login sebagai Admin';
            break;
          case 'user':
          case 'anon':
            _status = 'Selamat datang, $_username! Anda login sebagai User';
            break;
          default:
            _status = '';
        }
      });
    } else {
      setState(() {
        _status = 'Username atau Password anda salah.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Masukkan Username Anda',
              ),
            
              onChanged: (value) {
                setState(() {
                  _username = value.toLowerCase().trim();
                });
              },
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Masukkan Password Anda',
              ),
              onSubmitted: (_) => _login(),

              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('LOGIN'),
            ),
            SizedBox(height: 20),
            Text(
              _status,
              style: TextStyle(
                color: _status.startsWith('Selamat datang: ') ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

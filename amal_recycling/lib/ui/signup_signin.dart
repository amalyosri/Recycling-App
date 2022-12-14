import 'package:flutter/material.dart';




class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     theme: ThemeData(
        primarySwatch: Colors.green ,
        primaryColor: Colors.green
      ),
      home: Scaffold(
        body: MyHomePage1(),
      ),
    );
  }
}

class MyHomePage1 extends StatefulWidget {
  @override
  _MyHomePageState1 createState() => _MyHomePageState1();
}

enum AuthMode { SignUp, Login }

class _MyHomePageState1 extends State<MyHomePage1> with SingleTickerProviderStateMixin{


late AnimationController _controller1;
late Animation<double> _animation1;

@override
  void initState() {
    
    super.initState();

    _controller1=AnimationController(vsync: this,duration: Duration(milliseconds: 300));

    _animation1=Tween<double>(begin: 1.0,end: 0.0).animate(CurvedAnimation(
      parent: _controller1, curve: Curves.easeIn));
  }
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
  
    'email': '',
    'password': '',
  };
  Map<String, String> _authData1 = {
    'email': 'shaza@',
    'password': '123456',
  };
  final _passwordController = TextEditingController();
final nameController = TextEditingController();
  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SignUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Card(
          margin: EdgeInsets.all(20),
          elevation: 8,
          child: Container(
            height:   _authMode==AuthMode.SignUp? 350:300,
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller:  nameController,
                      decoration: InputDecoration(labelText: "E-Mail"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val!.isEmpty || !val.contains('@')) {
                          return "Invalid email!";
                        }
                        return null;
                      },
                      onSaved: (val) { _authData['email'] = val!;
                      _authData['email'] = nameController .text;
                        print(_authData['email']);
                       
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Password"),
                      controller: _passwordController,
                      obscureText: true,
                      validator: (val) {
                        if (val!.isEmpty || val.length <= 5) {
                          return "Password is too short!";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        _authData['password'] = val!;
                        _authData['password'] =_passwordController .text;
                        print(_authData['password']);
                      },
                    ),
                   
                      AnimatedContainer(
                        duration: Duration(milliseconds:300),
                        constraints: BoxConstraints(
                          maxHeight: _authMode==AuthMode.SignUp?90:0,
                        maxWidth: _authMode==AuthMode.SignUp?350:0,
                        ),
                        child: FadeTransition(
                          opacity: _animation1,
                          child: TextFormField(
                            enabled: _authMode == AuthMode.SignUp,
                            decoration:
                                InputDecoration(labelText: 'Confirm Password'),
                            obscureText: true,
                            validator: _authMode == AuthMode.SignUp
                                ? (value) {
                                    if (value != _passwordController.text) {
                                      return 'Passwords do not match!';
                                    }
                                    return null;
                                  }
                                : null,
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 20
                    ),
                    RaisedButton(
                      child:
                        Text(_authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP'),
                      onPressed: (){_submit;
                      if(_authData['email']==_authData1['email'] && _authData['password']==_authData1['password'] ){
                      //   Navigator.push(
                      //  context,
                      //    MaterialPageRoute(builder: (context) => taskScreen()),
                      // );
                      }
                      
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryTextTheme.button?.color,
                    ),
                    FlatButton(
                      child: Text(
                          '${_authMode == AuthMode.Login ? 'SIGN UP' : 'LOGIN'} INSTEAD'),
                      onPressed: _switchAuthMode,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    if (_authMode == AuthMode.Login) {
      // Log user in
    
    } else {
      // Sign user up
    }
  }
}
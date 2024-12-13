// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// SqfEntityFormGenerator
// **************************************************************************

part of 'model.dart';

class ConfigAdd extends StatefulWidget {
  ConfigAdd(this._config);
  final dynamic _config;
  @override
  State<StatefulWidget> createState() => ConfigAddState(_config as Config);
}

class ConfigAddState extends State {
  ConfigAddState(this.config);
  Config config;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController txtBaseUrl = TextEditingController();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtVersion = TextEditingController();

  List<DropdownMenuItem<int>> _dropdownMenuItemsForAppThemeId =
      <DropdownMenuItem<int>>[];
  int? _selectedAppThemeId;

  @override
  void initState() {
    txtBaseUrl.text = config.baseUrl == null ? '' : config.baseUrl.toString();
    txtName.text = config.name == null ? '' : config.name.toString();
    txtVersion.text = config.version == null ? '' : config.version.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void buildDropDownMenuForAppThemeId() async {
      final dropdownMenuItems =
          await AppTheme().select().toDropDownMenuInt('name');
      setState(() {
        _dropdownMenuItemsForAppThemeId = dropdownMenuItems;
        _selectedAppThemeId = config.appThemeId;
      });
    }

    if (_dropdownMenuItemsForAppThemeId.isEmpty) {
      buildDropDownMenuForAppThemeId();
    }
    void onChangeDropdownItemForAppThemeId(int? selectedAppThemeId) {
      setState(() {
        _selectedAppThemeId = selectedAppThemeId;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: (config.id == null)
            ? Text('Add a new config')
            : Text('Edit config'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    buildRowBaseUrl(),
                    buildRowName(),
                    buildRowVersion(),
                    buildRowIsDark(),
                    buildRowAppThemeId(onChangeDropdownItemForAppThemeId),
                    TextButton(
                      child: saveButton(),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a Snackbar.
                          save();
                          /* Scaffold.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text('Processing Data')));
                           */
                        }
                      },
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget buildRowBaseUrl() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter BaseUrl';
        }
        return null;
      },
      controller: txtBaseUrl,
      decoration: InputDecoration(labelText: 'BaseUrl'),
    );
  }

  Widget buildRowName() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Name';
        }
        return null;
      },
      controller: txtName,
      decoration: InputDecoration(labelText: 'Name'),
    );
  }

  Widget buildRowVersion() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Version';
        }
        return null;
      },
      controller: txtVersion,
      decoration: InputDecoration(labelText: 'Version'),
    );
  }

  Widget buildRowIsDark() {
    return Row(
      children: <Widget>[
        Text('IsDark?'),
        Checkbox(
          value: config.isDark ?? false,
          onChanged: (bool? value) {
            setState(() {
              config.isDark = value;
            });
          },
        ),
      ],
    );
  }

  Widget buildRowAppThemeId(
      void Function(int? selectedAppThemeId)
          onChangeDropdownItemForAppThemeId) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text('AppTheme'),
        ),
        Expanded(
            flex: 2,
            child: Container(
              child: DropdownButtonFormField(
                value: _selectedAppThemeId,
                items: _dropdownMenuItemsForAppThemeId,
                onChanged: onChangeDropdownItemForAppThemeId,
                validator: (value) {
                  if ((_selectedAppThemeId != null &&
                      _selectedAppThemeId.toString() != '0')) {
                    return null;
                  } else if (value == null || value == 0) {
                    return 'Please enter AppTheme';
                  }
                  return null;
                },
              ),
            )),
      ],
    );
  }

  Container saveButton() {
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(95, 66, 119, 1.0),
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        'Save',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  void save() async {
    config
      ..baseUrl = txtBaseUrl.text
      ..name = txtName.text
      ..version = txtVersion.text
      ..appThemeId = _selectedAppThemeId;
    await config.save();
    if (config.saveResult!.success) {
      Navigator.pop(context, true);
    } else {
      UITools(context).alertDialog(config.saveResult.toString(),
          title: 'save Config Failed!', callBack: () {});
    }
  }
}

class AppThemeAdd extends StatefulWidget {
  AppThemeAdd(this._apptheme);
  final dynamic _apptheme;
  @override
  State<StatefulWidget> createState() =>
      AppThemeAddState(_apptheme as AppTheme);
}

class AppThemeAddState extends State {
  AppThemeAddState(this.apptheme);
  AppTheme apptheme;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtThemeColor = TextEditingController();

  @override
  void initState() {
    txtName.text = apptheme.name == null ? '' : apptheme.name.toString();
    txtThemeColor.text =
        apptheme.themeColor == null ? '' : apptheme.themeColor.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (apptheme.id == null)
            ? Text('Add a new apptheme')
            : Text('Edit apptheme'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    buildRowName(),
                    buildRowThemeColor(),
                    TextButton(
                      child: saveButton(),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a Snackbar.
                          save();
                          /* Scaffold.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text('Processing Data')));
                           */
                        }
                      },
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget buildRowName() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Name';
        }
        return null;
      },
      controller: txtName,
      decoration: InputDecoration(labelText: 'Name'),
    );
  }

  Widget buildRowThemeColor() {
    return TextFormField(
      validator: (value) {
        if (int.tryParse(value!) == null) {
          return 'Please Enter valid number (required)';
        }

        return null;
      },
      controller: txtThemeColor,
      decoration: InputDecoration(labelText: 'ThemeColor'),
    );
  }

  Container saveButton() {
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(95, 66, 119, 1.0),
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        'Save',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  void save() async {
    apptheme
      ..name = txtName.text
      ..themeColor = int.tryParse(txtThemeColor.text);
    await apptheme.save();
    if (apptheme.saveResult!.success) {
      Navigator.pop(context, true);
    } else {
      UITools(context).alertDialog(apptheme.saveResult.toString(),
          title: 'save AppTheme Failed!', callBack: () {});
    }
  }
}

class TokenAdd extends StatefulWidget {
  TokenAdd(this._token);
  final dynamic _token;
  @override
  State<StatefulWidget> createState() => TokenAddState(_token as Token);
}

class TokenAddState extends State {
  TokenAddState(this.token);
  Token token;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController txtToken = TextEditingController();
  final TextEditingController txtRefreshToken = TextEditingController();

  @override
  void initState() {
    txtToken.text = token.token == null ? '' : token.token.toString();
    txtRefreshToken.text =
        token.refreshToken == null ? '' : token.refreshToken.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            (token.id == null) ? Text('Add a new token') : Text('Edit token'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    buildRowToken(),
                    buildRowRefreshToken(),
                    TextButton(
                      child: saveButton(),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a Snackbar.
                          save();
                          /* Scaffold.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text('Processing Data')));
                           */
                        }
                      },
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget buildRowToken() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Token';
        }
        return null;
      },
      controller: txtToken,
      decoration: InputDecoration(labelText: 'Token'),
    );
  }

  Widget buildRowRefreshToken() {
    return TextFormField(
      controller: txtRefreshToken,
      decoration: InputDecoration(labelText: 'RefreshToken'),
    );
  }

  Container saveButton() {
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(95, 66, 119, 1.0),
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        'Save',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  void save() async {
    token
      ..token = txtToken.text
      ..refreshToken = txtRefreshToken.text;
    await token._save();
    if (token.saveResult!.success) {
      Navigator.pop(context, true);
    } else {
      UITools(context).alertDialog(token.saveResult.toString(),
          title: 'save Token Failed!', callBack: () {});
    }
  }
}

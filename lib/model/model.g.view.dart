// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// SqfEntityFormGenerator
// **************************************************************************

part of 'model.dart';

class CommunityAdd extends StatefulWidget {
  CommunityAdd(this._community);
  final dynamic _community;
  @override
  State<StatefulWidget> createState() =>
      CommunityAddState(_community as Community);
}

class CommunityAddState extends State {
  CommunityAddState(this.community);
  Community community;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController txtBaseUrl = TextEditingController();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtVersion = TextEditingController();

  @override
  void initState() {
    txtBaseUrl.text =
        community.baseUrl == null ? '' : community.baseUrl.toString();
    txtName.text = community.name == null ? '' : community.name.toString();
    txtVersion.text =
        community.version == null ? '' : community.version.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (community.id == null)
            ? Text('Add a new community')
            : Text('Edit community'),
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
    community
      ..baseUrl = txtBaseUrl.text
      ..name = txtName.text
      ..version = txtVersion.text;
    await community.save();
    if (community.saveResult!.success) {
      Navigator.pop(context, true);
    } else {
      UITools(context).alertDialog(community.saveResult.toString(),
          title: 'save Community Failed!', callBack: () {});
    }
  }
}

class SettingAdd extends StatefulWidget {
  SettingAdd(this._settings);
  final dynamic _settings;
  @override
  State<StatefulWidget> createState() => SettingAddState(_settings as Setting);
}

class SettingAddState extends State {
  SettingAddState(this.settings);
  Setting settings;
  final _formKey = GlobalKey<FormState>();

  List<DropdownMenuItem<int>> _dropdownMenuItemsForThemeId =
      <DropdownMenuItem<int>>[];
  int? _selectedThemeId;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void buildDropDownMenuForThemeId() async {
      final dropdownMenuItems =
          await Theme().select().toDropDownMenuInt('name');
      setState(() {
        _dropdownMenuItemsForThemeId = dropdownMenuItems;
        _selectedThemeId = settings.themeId;
      });
    }

    if (_dropdownMenuItemsForThemeId.isEmpty) {
      buildDropDownMenuForThemeId();
    }
    void onChangeDropdownItemForThemeId(int? selectedThemeId) {
      setState(() {
        _selectedThemeId = selectedThemeId;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: (settings.id == null)
            ? Text('Add a new settings')
            : Text('Edit settings'),
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
                    buildRowIsDark(),
                    buildRowThemeId(onChangeDropdownItemForThemeId),
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

  Widget buildRowIsDark() {
    return Row(
      children: <Widget>[
        Text('IsDark?'),
        Checkbox(
          value: settings.isDark ?? false,
          onChanged: (bool? value) {
            setState(() {
              settings.isDark = value;
            });
          },
        ),
      ],
    );
  }

  Widget buildRowThemeId(
      void Function(int? selectedThemeId) onChangeDropdownItemForThemeId) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text('Theme'),
        ),
        Expanded(
            flex: 2,
            child: Container(
              child: DropdownButtonFormField(
                value: _selectedThemeId,
                items: _dropdownMenuItemsForThemeId,
                onChanged: onChangeDropdownItemForThemeId,
                validator: (value) {
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
    settings.themeId = _selectedThemeId;
    await settings._save();
    if (settings.saveResult!.success) {
      Navigator.pop(context, true);
    } else {
      UITools(context).alertDialog(settings.saveResult.toString(),
          title: 'save Setting Failed!', callBack: () {});
    }
  }
}

class ThemeAdd extends StatefulWidget {
  ThemeAdd(this._theme);
  final dynamic _theme;
  @override
  State<StatefulWidget> createState() => ThemeAddState(_theme as Theme);
}

class ThemeAddState extends State {
  ThemeAddState(this.theme);
  Theme theme;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtThemeColor = TextEditingController();

  @override
  void initState() {
    txtName.text = theme.name == null ? '' : theme.name.toString();
    txtThemeColor.text =
        theme.themeColor == null ? '' : theme.themeColor.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            (theme.id == null) ? Text('Add a new theme') : Text('Edit theme'),
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
        if (value == null || value.isEmpty) {
          return 'Please enter ThemeColor';
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
    theme
      ..name = txtName.text
      ..themeColor = txtThemeColor.text;
    await theme.save();
    if (theme.saveResult!.success) {
      Navigator.pop(context, true);
    } else {
      UITools(context).alertDialog(theme.saveResult.toString(),
          title: 'save Theme Failed!', callBack: () {});
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

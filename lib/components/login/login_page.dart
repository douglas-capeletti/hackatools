import 'package:flutter/material.dart';
import 'package:hackatools/components/app_base_page.dart';
import 'package:hackatools/components/login/login_bloc.dart';
import 'package:hackatools/components/team/team_body.dart';
import 'package:hackatools/models/dto/LoginDTO.dart';
import 'package:hackatools/utils/alerts.dart';
import 'package:hackatools/utils/nav.dart';
import 'package:hackatools/utils/validators.dart';
import 'package:hackatools/widgets/bg_login.dart';
import 'package:hackatools/widgets/button.dart';
import 'package:hackatools/widgets/link.dart';
import 'package:hackatools/widgets/textfield.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _input = LoginDTO();
  final _bloc = LoginBloc();

  final String exampleUser = "clarisse_horta@acad.pucrs.br";
  final String examplePass = "17809722";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          BgLogin(),
          _body(),
        ],
      ),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(32),
              child: Image.asset("assets/images/login_logo.png",
                  width: 220, height: 200),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: AppText(
                "Login",
                "Digite o seu login",
                validator: (text) {
                  return validateRequired(text, "Informe o login");
                },
                initialValue: exampleUser,
                onSaved: (value) => this._input.login = value,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: AppText(
                "Senha",
                "Digite a sua senha",
                password: true,
                validator: (text) {
                  return validateRequired(text, "Informe a senha");
                },
                onSaved: (value) => this._input.senha = value,
                initialValue: examplePass,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Checkbox(
                value: this._input.is_student,
                onChanged: (value) =>
                    setState(() => this._input.is_student = value),
              ),
            ),
            StreamBuilder<bool>(
              stream: _bloc.progress.stream,
              initialData: false,
              builder: (context, snapshot) {
                return Container(
                  margin: EdgeInsets.only(top: 16),
                  child: AppButton(
                    "Login",
                    _onClickLogin,
                    showProgress: snapshot.data,
                  ),
                );
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 0),
              child: AppLink(
                "Cadastre-se",
                _onClickCadastro,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onClickLogin() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    // Salva o form
    _formKey.currentState.save();

    print("Login: ${_input.login}, senha: ${_input.senha}");

    final response = await _bloc.login(_input);

    if (response.isOk()) {
      pushReplacement(context, AppBasePage(body: TimesBody()));
    } else {
      alert(context, "Hackatools", response.msg);
    }
  }

  void _onClickCadastro() {
    print("Cadastro");
    alert(context, "Ops!!", "Funcionalidade Indisponível");
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}

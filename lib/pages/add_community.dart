import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/intl_localizations.dart';
import 'package:vcare_flutter/component/text_field.dart';

final _formKey = GlobalKey<FormState>();

class AddCommunity extends StatelessWidget {
  const AddCommunity({super.key});

  @override
  Widget build(BuildContext context) {
    String communityUrl = "";

    Widget input = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Input(
          labelText: AppLocalizations.of(context)!.communityUrl,
          hintText: AppLocalizations.of(context)!.communityUrlPlaceholder,
          prefixIcon: Icon(
            Icons.message,
            color: Theme.of(context).colorScheme.primary,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.communityUrlPlaceholder;
            }
            return null;
          },
          onChanged: (value) {
            communityUrl = value!;
          },
        )
      ],
    );

    Widget button = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //提交按钮部分
        LayoutBuilder(builder: (context, constraint) {
          return ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: SizedBox(
              width: constraint.maxWidth * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: constraint.maxWidth * 0.5,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          print('继续走逻辑');
                        }
                      },
                      child: Text(AppLocalizations.of(context)!.joinCommunity),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );

    return Form(
      key: _formKey,
      child: Center(
        child: LayoutBuilder(builder: (context, constraint) {
          return ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: SizedBox(
                width: constraint.maxWidth * 0.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    input,
                    const SizedBox(
                      height: 20,
                    ),
                    button
                  ],
                ),
              ));
        }),
      ),
    );
  }
}

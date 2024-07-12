import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/bloc/language_cubit.dart';

class LanguageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, AppLanguage>(
      builder: (context, state) {
        return Center(
          child: DropdownButton<AppLanguage>(
            value: state,
            underline: SizedBox(),
            alignment: AlignmentDirectional.center,
            items: AppLanguage.supported.values.map((e) {
              return DropdownMenuItem(
                  value: e,
                  child: Text('${e.icon} ${e.name}')
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                BlocProvider.of<LanguageCubit>(context).setLanguage(value);
              }
            },
          ),
        );
      },
    );
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/components/cubit/hidden_passowrd_cubit.dart';

@immutable
class PasswordComponent extends StatelessWidget {
  const PasswordComponent(
      {Key? key,
      required this.hintText,
      this.onChanged,
      this.onSaved,
      this.controller,
      this.onSubmited,
      this.obscureText = true,
      this.initialValue,
      this.validator})
      : super(key: key);
  final String hintText;
  final void Function(String string)? onChanged;
  final void Function(String? string)? onSaved;
  final void Function(String)? onSubmited;
  final bool obscureText;
  final TextEditingController? controller;
  final String? initialValue;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 35, right: 35, top: 10),
        child: BlocBuilder<HiddenPassowrdCubit, HiddenPassowrdState>(
          builder: (context, state) {
            return TextFormField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: state.hidden
                      ? const Icon(Icons.key)
                      : const Icon(Icons.remove_red_eye_outlined),
                  onPressed: () => context.read<HiddenPassowrdCubit>().change(),
                ),
                border: const OutlineInputBorder(),
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 15,
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
              ),
              initialValue: initialValue ?? "",
              controller: controller,
              onChanged: onChanged,
              onSaved: onSaved,
              onFieldSubmitted: onSubmited,
              validator: validator,
              obscureText: state.hidden,
            );
          },
        ));
  }
}

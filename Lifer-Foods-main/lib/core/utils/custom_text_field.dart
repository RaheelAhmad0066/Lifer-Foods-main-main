import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lifer_food/core/utils/res.dart';

class CreateCustomField extends StatefulWidget {
  final Widget? icon;
  final String text;
  final TextEditingController controller;
  final bool isObscure, enabled;
  final String? Function(String?)? validator;
  final TextInputType keyBoardType;
  final TextInputAction inputAction;
  final String label;
  final int lines, minLines;
  final Color? borderColor;
  final Color? iconColor;
  final TextCapitalization textCapitalization;
  final Color? backgroundColor;

  const CreateCustomField({
    super.key,
    this.icon,
    required this.text,
    required this.controller,
    this.isObscure = false,
    this.validator,
    this.keyBoardType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.label = '',
    this.lines = 1,
    this.minLines = 1,
    this.borderColor,
    this.iconColor,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.none,
    this.backgroundColor,
  });

  @override
  State<CreateCustomField> createState() => _CreateCustomFieldState();
}

class _CreateCustomFieldState extends State<CreateCustomField> {
  @override
  void initState() {
    if (widget.label.isNotEmpty) {
      widget.controller.text = widget.label;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: widget.textCapitalization,
      readOnly: !widget.enabled,
      maxLines: widget.lines,
      minLines: widget.minLines,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: widget.keyBoardType,
      textInputAction: widget.inputAction,
      decoration: InputDecoration(
        fillColor: widget.backgroundColor ?? Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: widget.borderColor != null
              ? BorderSide(color: widget.borderColor!)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(18.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: widget.borderColor != null
              ? BorderSide(color: widget.borderColor!)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(18.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: widget.borderColor != null
              ? BorderSide(color: widget.borderColor!)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(18.0),
        ),
        // contentPadding: widget.icon == null
        //     ? widget.minLines != 1
        //         ? const EdgeInsets.only(left: 10, top: 15)
        //         : const EdgeInsets.only(left: 10)
        //     : const EdgeInsets.only(top: 15, bottom: 15),
        suffixIcon: widget.icon,
        prefixIconConstraints: const BoxConstraints(maxHeight: 25),
        hintText: widget.text,
        alignLabelWithHint: true,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
      ),
      obscureText: widget.isObscure,
      validator: widget.validator,
    );
  }
}

class CreateSearchField extends StatefulWidget {
  final TextEditingController controller;
  final Color? borderColor;
  final Widget? icon;
  final void Function(String?)? onSearched;
  final void Function(String?)? onChanged;
  final GestureTapCallback? onTap;
  final bool autoFocus;
  final Color? backgroundColor;
  final String hint;

  const CreateSearchField({
    super.key,
    required this.controller,
    this.borderColor,
    this.icon,
    this.onSearched,
    this.onTap,
    this.onChanged,
    this.autoFocus = true,
    this.backgroundColor,
    this.hint = 'Search By Category',
  });

  @override
  _CreateSearchFieldState createState() => _CreateSearchFieldState();
}

class _CreateSearchFieldState extends State<CreateSearchField> {
  final _searchKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _searchKey,
      child: TextFormField(
        maxLines: 1,
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.disabled,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        autofocus: widget.autoFocus,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
            filled: true,
            fillColor: widget.backgroundColor ?? Colors.white,
            prefixIcon: widget.icon,
            border: OutlineInputBorder(
              borderSide: widget.borderColor == null
                  ? BorderSide.none
                  : BorderSide(color: widget.borderColor!),
              borderRadius: BorderRadius.circular(14),
            ),
            contentPadding: const EdgeInsets.only(top: 5, left: 10),
            // constraints:
            //     BoxConstraints.tight(MediaQuery.of(context).size * .05),
            hintText: widget.hint,
            suffixIcon: widget.controller.text.isNotEmpty
                ? IconButton(
                    onPressed: widget.onTap,
                    icon: const Icon(Icons.clear, color: Colors.red))
                : null),
        onFieldSubmitted: widget.onSearched,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter something to search';
          }
          return null;
        },
      ),
    );
  }
}

class CreatePasswordField extends StatefulWidget {
  final Widget? icon;
  final String text;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;

  const CreatePasswordField(
      {super.key,
      this.icon,
      required this.text,
      required this.controller,
      this.validator,
      this.textInputAction = TextInputAction.done});

  @override
  _CreatePasswordFieldState createState() => _CreatePasswordFieldState();
}

class _CreatePasswordFieldState extends State<CreatePasswordField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      child: TextFormField(
        maxLines: 1,
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,
        textInputAction: widget.textInputAction,
        decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: () => setState(() {
              isHidden = !isHidden;
            }),
            child: Icon(
              isHidden ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey.shade300,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(7.0),
          ),
          contentPadding: widget.icon == null
              ? const EdgeInsets.only(left: 10)
              : const EdgeInsets.only(top: 15, bottom: 15),
          prefixIcon: widget.icon == null
              ? null
              : Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: getWidth(context) * .05),
                  child: widget.icon,
                ),
          prefixIconConstraints: const BoxConstraints(maxHeight: 25),
          hintText: widget.text,
          alignLabelWithHint: true,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),
        obscureText: isHidden,
        validator: widget.validator,
      ),
    );
  }
}

class CustomPhoneField extends StatefulWidget {
  final TextEditingController phoneController;
  final PhoneNumber phoneNumber;

  const CustomPhoneField({
    Key? key,
    required this.phoneController,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  late PhoneNumber _phoneNumber;

  @override
  void initState() {
    super.initState();
    _phoneNumber = widget.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide.none,
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: InternationalPhoneNumberInput(
          initialValue: widget.phoneNumber,
          textFieldController: widget.phoneController,
          spaceBetweenSelectorAndTextField: 0,
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.DIALOG,
            showFlags: true,
            leadingPadding: 5.0,
          ),
          onInputChanged: (PhoneNumber value) {
            setState(() => _phoneNumber = value);
          },
          onSubmit: () {
            print(_phoneNumber.isoCode);
            print(_phoneNumber.dialCode);
            print(_phoneNumber.phoneNumber);
            print(_phoneNumber.parseNumber());
            FocusManager.instance.primaryFocus?.unfocus();
          },
          cursorColor: Colors.black,
          inputDecoration: const InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 15, left: 0),
            border: InputBorder.none,
            hintText: 'Phone Number',
          ),
        ),
      ),
    );
  }
}

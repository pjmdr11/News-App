import 'package:flutter/material.dart';

class CustomTextInputView extends StatefulWidget {
  TextEditingController? controller;
  String? hint;
  String? textlabel;
  bool? row;
  bool? obscure;
  int? maxlines;
  int? minlines;
  int? maxLength;
  Function(String value)? validator;
  bool? enabled;
  TextInputType? inputType;
  String? widgetId;
  Map? errorMap;
  bool? required;
  Widget? primaryIcon;
  FocusNode? focusNode;
  TextInputAction actionType;
  bool? isDense;
  AutovalidateMode autoValidateMode;
  bool? autoFocus;
  var inputFormatters;
  var contentPadding;
  var key;
  String? initialValue;
  bool? readOnly = false;
  String? validationMsg = "";

  Function(String id, String value)? textChangedCallback;
  Widget? trailingIcon;

  TextStyle? errorTextStyle, textStyle, hintStyle, labelStyle; //styles

  var labelBorder, errorBorder, disabledBorder, focusedBorder;

  CustomTextInputView(
      {this.controller,
      this.hint,
      this.required = false,
      this.textlabel,
      this.errorTextStyle,
      this.row = false,
      this.actionType = TextInputAction.next,
      this.obscure = false,
      this.primaryIcon,
      this.trailingIcon,
      this.labelStyle,
      this.readOnly = false,
      this.maxlines = 1,
      this.minlines = 1,
      this.validator,
      this.maxLength,
      this.validationMsg,
      this.textChangedCallback,
      this.enabled = true,
      this.autoValidateMode = AutovalidateMode.disabled,
      this.disabledBorder,
      this.inputFormatters,
      this.inputType,
      this.errorMap,
      this.hintStyle,
      this.autoFocus = false,
      this.textStyle,
      this.isDense = true,
      this.contentPadding,
      this.focusedBorder,
      this.focusNode,
      this.errorBorder,
      this.labelBorder,
      this.key,
      this.initialValue,
      this.widgetId})
      : super(key: key);

  @override
  CustomTextInputViewState createState() => CustomTextInputViewState();
}

class CustomTextInputViewState extends State<CustomTextInputView> {
  TextEditingController? _controller;
  String? _hint;
  String? _textlabel;
  bool? _row;
  bool? _obscure;
  int? _maxlines;
  int? _minlines;
  int? _maxLength;
  Function(String v)? _validator;
  bool? _enabled;
  TextInputType? _inputType;
  String? _widgetId;
  Map? _errorMap;
  bool? _required;
  Widget? _primaryIcon;
  FocusNode? _focusNode;
  bool? _isDense;
  String? _validationMsg;
  bool? _autoFocus;
  bool _obscureValue = true;
  late AutovalidateMode _autoValidateMode;
  String? _initialValue;
  var _inputFormatters;
  var _contentPadding;
  late bool _readOnly;
  late TextInputAction _actionType;

  Function(String id, String value)? _textChangedCallback;
  Widget? _trailingIcon;

  TextStyle? _errorTextStyle, _textStyle, _hintStyle, _labelStyle; //styles

  InputBorder? _labelBorder, _errorBorder, _disabledBorder, _focusedBorder;

  @override
  void initState() {
    super.initState();
    _widgetId = widget.widgetId;
    _textStyle = widget.textStyle;
    _required = widget.required;
    _hint = widget.hint;
    _textlabel = widget.textlabel;
    _row = widget.row;
    _isDense = widget.isDense;
    _obscure = widget.obscure;
    _readOnly = widget.readOnly ?? false;
    _primaryIcon = widget.primaryIcon;
    _maxlines = widget.maxlines;
    _maxLength = widget.maxLength;
    _minlines = widget.minlines;
    _validator = widget.validator;
    _validationMsg = widget.validationMsg;
    _autoValidateMode = widget.autoValidateMode;
    _textChangedCallback = widget.textChangedCallback;
    _inputFormatters = widget.inputFormatters;
    _inputType = widget.inputType;
    _hintStyle = widget.hintStyle;
    _errorTextStyle = widget.errorTextStyle;
    _labelStyle = widget.labelStyle;
    _labelBorder = widget.labelBorder;
    _focusedBorder = widget.focusedBorder;
    _errorBorder = widget.errorBorder;
    _contentPadding = widget.contentPadding;
    _disabledBorder = widget.disabledBorder;
    _autoFocus = widget.autoFocus;
    _focusNode = widget.focusNode;
    _disabledBorder ??= _labelBorder;
    _initialValue = widget.initialValue;
    _actionType = widget.actionType;
  }

  @override
  Widget build(BuildContext context) {
    _controller = widget.controller;
    _enabled = widget.enabled;
    _trailingIcon = widget.trailingIcon;
    _errorMap = widget.errorMap;
    _contentPadding ??=
        const EdgeInsets.only(left: 14, bottom: 4, top: 4, right: 15);
    _textStyle ??= Theme.of(context).textTheme.bodyMedium;
    _hintStyle ??= _textStyle?.copyWith(color: Colors.grey[400]);
    _labelStyle ??= Theme.of(context).textTheme.bodyMedium;
    _errorTextStyle ??= _textStyle?.copyWith(color: Colors.red, fontSize: 10);
    _labelBorder ??= UnderlineInputBorder(
        borderSide: BorderSide(color: (Colors.grey[200])!));
    _focusedBorder ??= _labelBorder?.copyWith(
        borderSide: BorderSide(color: Theme.of(context).primaryColor));
    _disabledBorder ??= _labelBorder;
    _errorBorder ??= _labelBorder?.copyWith(
        borderSide: const BorderSide(
      color: Colors.red,
    ));

    try {
      if (_row ?? false) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            labelWidget(_textlabel),
            _textlabel.toString().isEmpty
                ? Container()
                : const SizedBox(
                    width: 8.0,
                  ),
            textFormWidget()
          ],
        );
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            labelWidget(_textlabel),
            _textlabel == null
                ? Container()
                : const SizedBox(
                    height: 8.0,
                  ),
            _textlabel.toString().isEmpty
                ? Container()
                : const SizedBox(
                    height: 0.0,
                  ),
            textFormWidget()
          ],
        );
      }
    } catch (e) {
      return Container();
    }
  }

  labelWidget(title) {
    if (title == null) {
      return Container();
    }
    return Text(title, style: _labelStyle);
  }

  textFormWidget() {
    return TextFormField(
      inputFormatters: _inputFormatters != null
          ? (_inputFormatters is List)
              ? [..._inputFormatters]
              : [_inputFormatters]
          : [],
      controller: _controller,
      maxLines: _maxlines,
      minLines: _minlines,
      autofocus: _autoFocus ?? false,
      focusNode: _focusNode,
      autovalidateMode: _autoValidateMode,
      readOnly: _readOnly,
      onChanged: (v) {
        if (_textChangedCallback != null) {
          _textChangedCallback!(_widgetId ?? "", v);
        }
      },
      onFieldSubmitted: (value) {
        if (_textChangedCallback != null) {
          _textChangedCallback!(_widgetId ?? "", value);
        }
      },
      // obscureText: obscureText ? _obscureValue : false,
      textInputAction: _actionType,
      keyboardType: _inputType,

      style: _textStyle,
      maxLength: _maxLength,
      obscureText: (_obscure ?? false) ? _obscureValue : false,
      validator: (v) {
        if (_validator != null) {
          return _validator!(v!);
        }
        if (_required ?? false) {
          if (v?.isEmpty ?? true) {
            return _validationMsg ?? "This field is required.";
          }
        }
        if (_errorMap != null) {
          if ((_errorMap as Map).containsKey(_widgetId)) {
            return _errorMap![_widgetId];
          }
        }
        return null;
      },
      textAlignVertical: TextAlignVertical.center,
      initialValue: _initialValue,
      decoration: InputDecoration(
        prefixIcon: _primaryIcon,
        suffixIcon: _getSuffixIcon(),
        hintText: _hint,
        hintStyle: _hintStyle,
        isDense: _isDense,
        enabled: _enabled ?? false,
        border: InputBorder.none,
        errorStyle: _errorTextStyle,
        focusedBorder: _focusedBorder,
        enabledBorder: _labelBorder,
        errorBorder: _errorBorder,
        focusedErrorBorder: _errorBorder,
        disabledBorder: _disabledBorder,
        contentPadding: _contentPadding,
      ),
    );
  }

  _getSuffixIcon() {
    if (_obscure ?? false) {
      var icon = Icons.visibility_off;
      if (!_obscureValue) {
        icon = Icons.visibility;
      }
      return IconButton(
        icon: Icon(
          icon,
          size: 20.toDouble(),
          color: Theme.of(context).iconTheme.color,
        ),
        onPressed: () {
          setState(() {
            _obscureValue = !_obscureValue;
          });
        },
      );
    } else {
      if (_trailingIcon != null) {
        return _trailingIcon;
      }
      return null;
    }
  }
}

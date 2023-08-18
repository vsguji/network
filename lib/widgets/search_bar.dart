import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/app_colors.dart';

///圆角搜索框
class SearchTextFieldBar extends StatefulWidget {
  ///搜索框上显示的文案
  final String hint;

  ///搜索框是否仅用来跳转
  final bool jump;

  ///hero过渡动画的tag
  final String? heroTag;

  ///搜索框的圆角
  final double? borderRadius;

  // final EdgeInsets margin;
  final EdgeInsets? margin;

  // final EdgeInsets padding;
  final EdgeInsets? padding;

  ///如果考虑不需要水波纹效果那么就可以设置颜色为透明色
  final Color splashColor;

  ///文本输入框焦点控制
  final FocusNode? focusNode;

  ///文本输入框控制器
  final TextEditingController? controller;

  ///点击键盘上的回车键的回调
  final Function(String text)? onSubmitted;

  ///输入改变回掉
  final Function(String text)? onChanged;

  ///清除搜索回调
  final Function? clearCallback;

  ///返回键的回调
  final Function()? onBackCallback;

  ///输入文本的长度限制
  final int inputKeyWordsLength;

  ///搜索图标大小
  final double? iconSize;

  ///输入框文字大小
  final double? fontSize;

  ///是否显示左侧的返回键
  final bool isShowBackButton;

  /// 搜索框底色
  final Color? color;

  ///搜索框的长度
  final double width;

  ///搜索框的高度
  final double height;

  final bool? autofocus;

  ///键盘样式
  final TextInputType? keyboardType;

  const SearchTextFieldBar({
    Key? key,
    this.jump = false,
    this.hint = "搜索",
    required this.width,
    required this.height,
    this.borderRadius,
    this.margin,
    this.padding,
    this.autofocus,
    this.heroTag,
    this.focusNode,
    this.splashColor = const Color(0xFFD6D6D6),
    this.controller,
    this.onSubmitted,
    this.onChanged,
    this.onBackCallback,
    this.clearCallback,
    this.inputKeyWordsLength = 20,
    this.iconSize,
    this.fontSize,
    this.isShowBackButton = false,
    this.color,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchTextFieldBarState();
}

class _SearchTextFieldBarState extends State<SearchTextFieldBar> {
  ///为true 时显示清除选项
  bool showClear = false;

  late FocusNode _focusNode;

  ///文本输入框的默认使用控制器
  TextEditingController defaultTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

    ///创建默认的焦点控制
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,

      ///搜索框内容区域
      child: buildContentContainer(),
    );
  }

  ///构建搜索框的显示区域[Container]
  Container buildContentContainer() {
    return Container(
      height: widget.height,

      ///获取当前StatelessWidget的宽度
      width: widget.width,

      ///对齐方式
      alignment: Alignment.centerLeft,

      ///内边距
      padding: widget.padding ?? EdgeInsets.only(left: 9.w),

      /// 边框抗锯齿
      clipBehavior: Clip.antiAlias,

      ///圆角边框
      decoration: BoxDecoration(
        color: widget.color ?? AppColor.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 30.w),
      ),
      child: buildRow(),
    );
  }

  ///构建搜索图标与显示文本
  Row buildRow() {
    return Row(
      ///左对齐
      mainAxisAlignment: MainAxisAlignment.start,

      crossAxisAlignment: CrossAxisAlignment.center,

      children: <Widget>[
        ///左侧的搜索图标
        Container(
            margin: EdgeInsets.only(right: 7.w),
            width: 12.w,
            height: 12.w,
            child: SvgPicture.asset(
              'assets/images/search.svg',
              color: AppColor.greyText,
              width: 12.w,
              height: 12.w,
              fit: BoxFit.contain,
            )),

        ///中间的输入框
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.centerLeft,
            child: buildTextField(),
          ),
        ),

        ///右侧的清除小按钮
        buildClearButton(),
      ],
    );
  }

  ///构建搜索输入TextField
  TextField buildTextField() {
    return TextField(
      ///设置键盘的类型
      keyboardType: widget.keyboardType??TextInputType.text,

      ///键盘回车键的样式为搜索
      textInputAction: TextInputAction.search,

      ///只有苹果手机上有效果
      keyboardAppearance: Brightness.dark,

      ///控制器配置
      controller: widget.controller ?? defaultTextController,

      ///最大行数
      maxLines: 1,

      ///输入文本格式过滤
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        ///输入的内容长度限制
        LengthLimitingTextInputFormatter(widget.inputKeyWordsLength),
      ],

      ///当输入文本时实时回调
      onChanged: (text) {
        if (widget.onChanged != null) {
          widget.onChanged!(text);
        }
        ///多层判断 优化刷新
        ///只有当有改变时再刷新
        if (text.isNotEmpty) {
          if (!showClear) {
            setState(() {
              showClear = true;
            });
          }
        } else {
          if (showClear) {
            setState(() {
              showClear = false;
            });
          }
        }
      },

      ///点击键盘上的回车键
      ///或者是搜索按钮的回调
      onSubmitted: (text) {
        if (widget.onSubmitted != null) {
          widget.onSubmitted!(text);
        }
      },

      ///输入框不自动获取焦点
      autofocus: widget.autofocus ?? true,
      focusNode: _focusNode,

      style: TextStyle(
        fontSize: widget.fontSize ?? 12.sp,
        color: widget.color ?? AppColor.mainText,
        fontWeight: FontWeight.w400,
      ),

      ///输入框的边框装饰
      decoration: InputDecoration(
        //重要 用于编辑框对齐
        isDense: true,

        ///清除文本内边框
        contentPadding: EdgeInsets.zero,

        ///不设置边框
        border: InputBorder.none,

        ///设置提示文本
        hintText: widget.hint,

        ///设置提示文本的样式
        hintStyle: TextStyle(
          fontSize: widget.fontSize ?? 12.sp,
          color: AppColor.greyText,
        ),
      ),
    );
  }

  ///清除按键
  ///当文本框有内容输入时显示清除按钮
  buildClearButton() {
    ///当文本输入框中有内容时才显示清除按钮
    if (showClear) {
      return IconButton(
        icon: Icon(
          Icons.cancel_sharp,
          size: widget.iconSize ?? 16.w,
          color: const Color.fromRGBO(196, 196, 196, 1),
        ),
        onPressed: () {
          if (widget.controller == null) {
            defaultTextController.clear();
          } else {
            widget.controller!.clear();
          }
          setState(() {
            showClear = false;
          });
          if (widget.clearCallback != null) {
            widget.clearCallback!();
          }
        },
      );
    } else {
      return Container();
    }
  }
}

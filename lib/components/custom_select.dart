// ignore_for_file: file_names

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class MyComboBoxFilterV3 extends StatefulWidget {
  ///
  final dynamic listOptions;
  final dynamic selectedItem;
  final String labelText;
  final bool enable;
  final String? Function(dynamic textValue) validator;
  final void Function(dynamic itemSelected) onChanged;
  final void Function()? onSelectNull;
  final double height;
  final Color labelColor;
  final Color? backColor;
  final Color? backColorSelect;
  final Color? backColorTextTop;
  final Color textSelectedColor;
  final Color dropDownColor;
  final double fontSize;
  final double fontSizeLabel;
  final double heightItem;
  final int maxLine;
  final bool isReadOnly;
  final bool errorValidator;
  final FocusNode? focusNode;
  final Key? keySelect;

  ///
  const MyComboBoxFilterV3({
    super.key,
    required this.listOptions,
    required this.selectedItem,
    this.labelText = '',
    this.enable = true,
    required this.validator,
    required this.onChanged,
    this.onSelectNull,
    this.backColorSelect = Colors.white,
    this.height = 73,
    this.labelColor = Colors.grey,
    this.backColor = Colors.white,
    this.backColorTextTop = Colors.white,
    this.textSelectedColor = Colors.black,
    this.dropDownColor = Colors.white,
    this.fontSize = 13,
    this.fontSizeLabel = 13,
    this.heightItem = 30,
    this.maxLine = 1,
    this.isReadOnly = false,
    this.errorValidator = false,
    this.focusNode,
    this.keySelect,
  });

  @override
  State<MyComboBoxFilterV3> createState() => _MyComboBoxFilterV3State();
}

class _MyComboBoxFilterV3State extends State<MyComboBoxFilterV3> {
  ///
  ///!  Aplica cuando se ha activado la validacion:
  ///!  Hace que desaparezca la Validacion una vez seleccionado un item
  ///!  De lo contrario se amonta el item selecionado y su validacion
  AutovalidateMode myAutovalidateMode = AutovalidateMode.disabled;
  double dropButtonTop = 0;

  /// dynamic myListOptionsReal = [];

  ///!  *******************************************************
  ///!  INIT STATE
  ///!  *******************************************************
  @override
  void initState() {
    super.initState();
    initDataLoad();
  }

  void initDataLoad() async {}

  ///!  DISPOSE
  @override
  void dispose() {
    super.dispose();
  }

  ///
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      height: widget.height,
      padding: const EdgeInsets.fromLTRB(0, 9, 0, 9),
      color: widget.backColor,
      child: Card(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
                width: 1,
                color:
                    widget.errorValidator ? Colors.red[300] as Color : Colors.grey[500] as Color),
          ),
          // height: 20,
          child: Container(
            color: widget.backColorSelect,
            child: DropdownSearch<dynamic>(
              key: widget.keySelect,
              asyncItems: (filter) => getData(filter),
              selectedItem: widget.selectedItem,
              itemAsString: (dynamic u) => u.name!,
              compareFn: (i, s) => i.isEqual(s),
              enabled: widget.enable,

              ///!  Dropdown Builder
              dropdownBuilder: widget.selectedItem == null ? null : myDropDownBuilder,

              ///!  Expand Icon
              dropdownButtonProps: DropdownButtonProps(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                    top: widget.selectedItem != null ? 0 : dropButtonTop, right: 10),
                focusNode: widget.focusNode,
                autofocus: true,
                icon: Stack(
                  children: [
                    Icon(
                      Icons.expand_more,
                      size: 25,
                      color: widget.enable ? Colors.teal[800] : Colors.grey[300],
                    ),
                  ],
                ),
                constraints: const BoxConstraints(maxWidth: 35, maxHeight: 24),
                iconSize: 25,
              ),

              ///!  Popup
              popupProps:

                  /// PopupProps.menu(
                  ///   showSelectedItems: true,
                  ///   itemBuilder: _customPopupItemBuilderExample2,
                  ///   showSearchBox: true,
                  /// ),

                  PopupProps.menu(
                searchDelay: const Duration(milliseconds: 300),
                showSearchBox: true,
                listViewProps: const ListViewProps(),
                favoriteItemProps:
                    FavoriteItemProps(favoriteItemBuilder: (ctx, popupWidget, stateMenu) {
                  return Container(height: 10, width: 10, color: Colors.red);
                }),
                menuProps: const MenuProps(),
                constraints: const BoxConstraints.tightFor(
                  height: 250,
                ),
                itemBuilder: _customPopupItemBuilderExample2,

                /// containerBuilder: (ctx, popupWidget) {
                ///   return Column(
                ///     mainAxisSize: MainAxisSize.min,
                ///     crossAxisAlignment: CrossAxisAlignment.end,
                ///     children: [
                ///       Container(),
                ///       Flexible(
                ///         fit: FlexFit.loose,
                ///         child: Container(
                ///           color: Colors.white,
                ///           child: popupWidget,
                ///         ),
                ///       ),
                ///     ],
                ///   );
                /// },
              ),

              ///!  Label Text
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide: BorderSide(
                      color: Colors.grey[400] as Color,
                      width: 0,
                    ),
                  ),
                  border: InputBorder.none,
                  hintText: '',
                  isCollapsed: false,
                  contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  labelText: ' ${widget.labelText} ',
                  labelStyle: TextStyle(
                    fontSize: widget.fontSize,
                  ),
                  hintStyle: TextStyle(
                    fontSize: widget.fontSize,
                    backgroundColor: Colors.white,
                  ),
                  floatingLabelStyle: TextStyle(
                    fontSize: widget.fontSize,
                    backgroundColor: widget.backColorTextTop,
                  ),
                ),
              ),

              ///!  Activa onChange, Validator
              autoValidateMode: myAutovalidateMode,

              clearButtonProps: widget.onSelectNull != null && widget.selectedItem != null
                  ? ClearButtonProps(
                      isVisible: true,
                      onPressed: () {
                        if (widget.onSelectNull != null) {
                          widget.onSelectNull!();
                        }

                        return null;
                      },
                    )
                  : const ClearButtonProps(isVisible: false),

              validator: (value) {
                return widget.validator(value);
              },
              onChanged: (value) {
                setState(() {
                  widget.onChanged(value);
                  //myAutovalidateMode = AutovalidateMode.onUserInteraction;
                  dropButtonTop = 0;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _customPopupItemBuilderExample2(BuildContext context, dynamic item, bool isSelected) {
    return Container(
      height: widget.heightItem,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: Text(
        item.name,
        softWrap: true,
        maxLines: widget.maxLine,
      ),
    );
  }

  Widget myDropDownBuilder(
    BuildContext context,
    dynamic selectedItem,
  ) {
    ///
    if (selectedItem == null) {
      return Container();
    } else {
      return Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: Text(
          selectedItem.name,
          style: TextStyle(
            fontSize: widget.fontSizeLabel,
            color: widget.enable ? Colors.black : Colors.grey,
          ),
          textAlign: TextAlign.start,
        ),
      );
    }
  }

  Future<List<dynamic>> getData(filter) async {
    ///
    String valueStr = filter.toString().toUpperCase().trim();
    List<dynamic> listAux = [];
    for (dynamic iEmp in widget.listOptions) {
      if (iEmp.name!.toUpperCase().contains(valueStr) && iEmp.b_activo) {
        listAux.add(iEmp);
      }
    }
    return listAux;
  }
}

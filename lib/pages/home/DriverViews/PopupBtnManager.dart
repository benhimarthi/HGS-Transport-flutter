import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../model/popup.btn.item.dart';

class PopUpBtnManager extends StatefulWidget {
  List<PopupBtnItem> popupitems;
  PopUpBtnManager({super.key, required this.popupitems});

  @override
  State<PopUpBtnManager> createState() => _PopUpBtnManagerState(popupitems);
}

class _PopUpBtnManagerState extends State<PopUpBtnManager> {
  List<PopupBtnItem> popupitems;
  _PopUpBtnManagerState(this.popupitems);
  late String _currentLabel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentLabel = popupitems[0].label;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      itemBuilder: (BuildContext context) {
        /*PopupMenuItem(
            child: Text('Option 1'),
            value: 1,
          ),*/
        return List.generate(popupitems.length, (index) {
          return PopupMenuItem(
            value: popupitems[index].value,
            child: Text(
              popupitems[index].label,
            ),
          );
        });
      },
      onSelected: (value) {
        // Exécutez l'action associée à la valeur sélectionnée.
        /*switch (value) {
          case 1:
            // Code pour l'option 1
            break;
          case 2:
            // Code pour l'option 2
            break;
        }*/
        for (var element in popupitems) {
          if (element.value == value) {
            setState(() {
              element.action;
              _currentLabel = element.label;
            });
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Row(
          children: [
            Text(_currentLabel,
                style:
                    const TextStyle(color: Color.fromARGB(255, 53, 181, 222))),
            const Icon(
              Icons.arrow_drop_down_sharp,
              color: Color.fromARGB(255, 53, 181, 222),
            )
          ],
        ),
      ),
    );
  }
}

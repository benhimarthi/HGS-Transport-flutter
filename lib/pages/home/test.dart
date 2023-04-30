import 'package:flutter/material.dart';

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: Text('Appuyez ici pour afficher le menu contextuel'),
        ),
      ),
      // Utilisez un PopupMenuButton pour afficher un menu contextuel
      // lorsque l'utilisateur appuie sur le bouton dans l'AppBar.
      // Le PopupMenuButton prend une liste d'éléments de menu comme argument.
      // Chaque élément est un PopupMenuItem, qui a un titre et une action à exécuter.
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            position: PopupMenuPosition.under,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Option 1'),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text('Option 2'),
                  value: 2,
                ),
                PopupMenuItem(
                  child: Text('Option 3'),
                  value: 3,
                ),
              ];
            },
            onSelected: (value) {
              // Exécutez l'action associée à la valeur sélectionnée.
              switch (value) {
                case 1:
                  // Code pour l'option 1
                  break;
                case 2:
                  // Code pour l'option 2
                  break;
                case 3:
                  // Code pour l'option 3
                  break;
              }
            },
          ),
        ],
      ),
    );
  }
}

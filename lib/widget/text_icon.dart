import 'package:flutter/material.dart';
import 'package:flutter_music_player/utils/colors.dart';

class TextIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;
  final Function onPressed;
  const TextIcon({Key key, this.icon, this.title, this.selected: false, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = selected ? AppColors.mainColor : Colors.black.withAlpha(160);
    return InkWell(
      onTap: this.onPressed,
      child:Container(
        //color: Colors.blue,
        padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, color: color),
            Text(
              title,
              style: TextStyle(height: 1.4, color: color),
            )
          ],
        )));
  }
}

import 'package:flutter/material.dart';
import 'package:siku/blocs/attends_block.dart';
import 'package:siku/modules/laravel_echo.dart';
import 'package:siku/modules/localstorage.dart';
import 'package:siku/serializable/attends.dart' as a;
import 'package:siku/utils/constants.dart';
import 'package:provider/provider.dart';

class SheetGuestsList extends StatefulWidget {
  const SheetGuestsList({Key key}) : super(key: key);

  @override
  _SheetGuestsListState createState() => _SheetGuestsListState();
}

class _SheetGuestsListState extends State<SheetGuestsList> {
  bool appended = false;

  void _fromSocket() {
    onValidatedGuest(EventStorage.event.id, (data) {
      final attend = a.Attend.fromJson(data);
      context.read<Attends>().preprendAttends(attend);
    });
  }

  @override
  void initState() {
    _fromSocket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final attends = context.watch<Attends>().attends;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: attends.length,
          itemExtent: 90,
          itemBuilder: (context, index) {
            final item = attends[index];
            return ItemList(
              title: item.guest.name,
              subtitle: item.createdAt,
              trailing: item.guest.autorized.toString(),
            );
          },
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailing;
  final Icon icon = const Icon(Icons.label);

  const ItemList({
    Key key,
    this.subtitle = '',
    this.title = '',
    this.trailing = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white24),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            color: kTextMutedColor,
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: kTextMutedColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Text(
          trailing,
          style: const TextStyle(
            color: kTextMutedColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  String get brTitle => title
      .toUpperCase()
      .split(' ')
      .where((e) => e.isNotEmpty)
      .map((e) => e[0])
      .take(2)
      .join('');
}

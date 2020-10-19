import 'package:flutter/cupertino.dart';
import 'package:siku/blocs/loader_bloc.dart';
import 'package:provider/provider.dart';
import 'package:siku/modules/modules.dart';
import 'package:siku/network/http.dart';

void validation(BuildContext context, String _code, Function complected) {
  final loader = context.read<Loader>();
  loader.setLoader();
  validateGuest(EventStorage.event.hash, _code).then((value) {
    final guest = value.data.guest;
    final content = value.message + '\n' + 'Authorized: ${guest.autorized}';
    if (value.status == 200) {
      FlushbarApp.secondary(context, guest.name, content);
      MVibration.vibrateLong();
    } else {
      FlushbarApp.success(context, guest.name, content);
      MVibration.vibrate();
    }
  }).catchError((err) {
    FlushbarApp.danger(context, err.toString(), ' ');
    MVibration.customVibrations();
  }).whenComplete(() {
    loader.unsetLoader();
    complected();
  });
}

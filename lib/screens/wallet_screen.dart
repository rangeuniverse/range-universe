import 'package:flutter/material.dart';
import 'package:flutter_google_wallet/flutter_google_wallet_pigeon.dart';
import 'package:flutter_google_wallet/flutter_google_wallet_platform_interface.dart';
import 'package:flutter_google_wallet/flutter_google_wallet_plugin.dart';
import 'package:flutter_google_wallet/generated/intl/messages_all.dart';
import 'package:flutter_google_wallet/generated/intl/messages_de.dart';
import 'package:flutter_google_wallet/generated/intl/messages_en.dart';
import 'package:flutter_google_wallet/generated/intl/messages_es.dart';
import 'package:flutter_google_wallet/generated/intl/messages_fr.dart';
import 'package:flutter_google_wallet/generated/intl/messages_it.dart';
import 'package:flutter_google_wallet/generated/intl/messages_nl.dart';
import 'package:flutter_google_wallet/generated/l10n.dart';
import 'package:flutter_google_wallet/messages.dart';
import 'package:flutter_google_wallet/utils/locale_utils.dart';
import 'package:flutter_google_wallet/widget/add_to_google_wallet_button.dart';

class WalletScreen extends StatelessWidget {
  final flutterGoogleWalletPlugin = FlutterGoogleWalletPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: const Color(0xFFFFFFFF),
      body: FutureBuilder<bool>(
        future: flutterGoogleWalletPlugin.getWalletApiAvailabilityStatus(),
        builder: (BuildContext context, AsyncSnapshot<bool> available) {
          if (available.data ?? false) {
            return Center(
              child: AddToGoogleWalletButton(
                locale: const Locale('en', 'US'),
                onPress: () {
                  flutterGoogleWalletPlugin.savePasses(
                    jsonPass: '',
                    addToGoogleWalletRequestCode: 2,
                  );
                },
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

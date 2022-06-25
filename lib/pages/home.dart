import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_tools/types/generate_qr_args.dart';
import 'package:qr_tools/utils/ui_data.dart';
import 'package:qr_tools/widgets/action_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light),
        title: const Text('QR Tools'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            sliver: SliverGrid.count(
              childAspectRatio: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 1,
              children: <Widget>[
                ActionCard(
                  cardColor: const Color(0xFF8BCBFC),
                  title: 'Scan QR Code',
                  onTap: () => Navigator.pushNamed(context, "/scan"),
                  padding: const EdgeInsets.all(14.0),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  backgroundImage: Image.asset(
                    UIData.scanQrImage,
                    alignment: AlignmentDirectional.bottomEnd,
                    scale: 12,
                  ),
                ),
                ActionCard(
                  cardColor: const Color(0xFF84DCCF),
                  title: 'Generate QR Code',
                  onTap: () => Navigator.pushNamed(context, "/generate", arguments: GenerateQrArgs(const Color(0xFF84DCCF), false)),
                  padding: const EdgeInsets.all(14.0),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  backgroundImage: Image.asset(
                    UIData.qrcodeImage,
                    alignment: AlignmentDirectional.bottomEnd,
                    scale: 10,
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding:
                const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
            sliver: SliverGrid.count(
              childAspectRatio: 1,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 2,
              children: <Widget>[
                ActionCard(
                  cardColor: const Color(0xFFE6D0A9),
                  title: 'Generate from clipboard',
                  onTap: () => Navigator.pushNamed(context, "/generate", arguments: GenerateQrArgs(const Color(0xFFE6D0A9), true)),
                  padding: const EdgeInsets.all(14.0),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  backgroundImage: Image.asset(
                    UIData.generateFromClipboardImage,
                    alignment: AlignmentDirectional.bottomEnd,
                    scale: 18,
                  ),
                ),
                ActionCard(
                  cardColor: const Color(0xFFA6C8DB),
                  title: 'About',
                  onTap: () => Navigator.pushNamed(context, "/about", arguments: const Color(0xFFA6C8DB)),
                  padding: const EdgeInsets.all(14.0),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  backgroundImage: Image.asset(
                    UIData.aboutImage,
                    alignment: AlignmentDirectional.bottomEnd,
                    scale: 10,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

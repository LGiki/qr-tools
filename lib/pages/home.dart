import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_tools/utils/ui_data.dart';
import 'package:qr_tools/widgets/action_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                  cardColor: Colors.green[400],
                  title: 'Scan QR Code',
                  onTap: () => Navigator.pushNamed(context, "/scan"),
                  padding: const EdgeInsets.all(14.0),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  backgroundImage: Image.asset(
                    UIData.qrcodeImage,
                    alignment: AlignmentDirectional.bottomEnd,
                    scale: 9,
                  ),
                ),
                ActionCard(
                  cardColor: Colors.orange[400],
                  title: 'Generate QR Code',
                  onTap: () => Navigator.pushNamed(context, "/generate"),
                  padding: const EdgeInsets.all(14.0),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  backgroundImage: Image.asset(
                    UIData.qrcodeImage,
                    alignment: AlignmentDirectional.bottomEnd,
                    scale: 9,
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
                  cardColor: Colors.blue[400],
                  title: 'Settings',
                  onTap: () => Navigator.pushNamed(context, "/settings"),
                  padding: const EdgeInsets.all(14.0),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  backgroundImage: Image.asset(
                    UIData.qrcodeImage,
                    alignment: AlignmentDirectional.bottomEnd,
                    scale: 10,
                  ),
                ),
                ActionCard(
                  cardColor: Colors.teal[400],
                  title: 'About',
                  onTap: () => Navigator.pushNamed(context, "/about"),
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
          )
        ],
      ),
    );
  }
}

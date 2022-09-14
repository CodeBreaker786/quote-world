import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_share/social_share.dart';

class SocialShareRow extends StatefulWidget {
  final String? content;
  final bool showbacground;
  final String? type;
  bool showSaveButton;
  Function? ontap;
  SocialShareRow(
      {Key? key,
      @required this.content,
      @required this.type,
      @required this.ontap,
      this.showSaveButton = true,
      this.showbacground = true})
      : super(key: key);

  @override
  _SocialShareRowState createState() => _SocialShareRowState();
}

class _SocialShareRowState extends State<SocialShareRow> {
  FlutterTts flutterTts = FlutterTts();
  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          widget.showSaveButton
              ? _buildShareTileIconCard(
                  icon: const Icon(
                    FontAwesomeIcons.solidHeart,
                    color: Colors.red,
                  ),
                  callback: () => widget.ontap!(),
                )
              : const SizedBox(),
          _buildShareTileIconCard(
              icon: const Icon(
                FontAwesomeIcons.volumeLow,
                color: Colors.green,
              ),
              callback: () async {
                await flutterTts.speak(widget.content!);
              }),
          _buildShareTileIconCard(
            icon: const Icon(
              FontAwesomeIcons.copy,
              color: Colors.teal,
            ),
            callback: () async {
              await SocialShare.copyToClipboard(widget.content).then((data) {});
            },
          ),
          _buildShareTileIconCard(
            callback: () async {
              await SocialShare.shareSms(widget.content!,
                      trailingText: '', url: '')
                  .then((data) {});
            },
            icon: const Icon(
              FontAwesomeIcons.message,
              color: Colors.blueAccent,
            ),
          ),
          _buildShareTileIconCard(
            callback: () async {
              await SocialShare.shareTwitter(widget.content!,
                      trailingText: '', url: '')
                  .then((data) {});
            },
            icon: const Icon(
              FontAwesomeIcons.twitter,
              color: Colors.blue,
            ),
          ),
          _buildShareTileIconCard(
            callback: () async {
              await SocialShare.shareWhatsapp(widget.content!).then((data) {});
            },
            icon: const Icon(
              FontAwesomeIcons.whatsapp,
              color: Colors.green,
            ),
          ),
          _buildShareTileIconCard(
            callback: () async {
              await SocialShare.shareOptions(widget.content!).then((data) {});
            },
            icon: const Icon(
              FontAwesomeIcons.shareNodes,
              color: Colors.brown,
            ),
          ),
        ],
      ),
    );
  }

  _buildShareTileIconCard({Icon? icon, VoidCallback? callback}) {
    return InkWell(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.3),
              blurRadius: 4.0,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: icon,
        ),
      ),
    );
  }
}

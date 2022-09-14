import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
<<<<<<< HEAD
import 'package:quoteworld/utils/snak_bar.dart';
import 'package:quoteworld/widgets/linear_gragient.dart';
import 'package:social_share/social_share.dart';

class SocialShareRow extends StatefulWidget {
  final String content;
  final bool showbacground;
  final String type;
  bool showSaveButton;
  Function ontap;
  SocialShareRow(
      {Key key,
=======
import 'package:social_share/social_share.dart';

class SocialShareRow extends StatefulWidget {
  final String? content;
  final bool showbacground;
  final String? type;
  bool showSaveButton;
  Function? ontap;
  SocialShareRow(
      {Key? key,
>>>>>>> 51fe6d4 (first commit)
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
<<<<<<< HEAD
    return Container(
      decoration:
          BoxDecoration(gradient: widget.showbacground ? myGradient() : null),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: [
            widget.showSaveButton
                ? InkWell(
                    onTap: () async {
                      widget.ontap();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        Icons.system_update,
                        color: Colors.green,
                      ),
                    ))
                : SizedBox(),
            InkWell(
                onTap: () async {
                  await flutterTts.speak(widget.content);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.volume_up_outlined,
                    color: Colors.greenAccent,
                  ),
                )),
            InkWell(
                onTap: () async {
                  SocialShare.copyToClipboard(widget.content).then((data) {
                    print(data);
                  });
                  showSnackBar(
                    context: context,
                    value: '${widget.type} is copied in your clipboard',
                    icon: Icon(
                      FontAwesomeIcons.copy,
                      color: Colors.white,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    FontAwesomeIcons.copy,
                    color: Colors.white,
                  ),
                )),
            InkWell(
                onTap: () async {
                  SocialShare.shareSms(widget.content,
                          trailingText: '', url: '')
                      .then((data) {
                    print(data);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.message,
                    color: Colors.blueAccent,
                  ),
                )),
            InkWell(
                onTap: () async {
                  SocialShare.shareTwitter(widget.content,
                          trailingText: '', url: '')
                      .then((data) {
                    print(data);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    FontAwesomeIcons.twitter,
                    color: Colors.blue,
                  ),
                )),
            InkWell(
                onTap: () async {
                  SocialShare.shareWhatsapp(widget.content).then((data) {
                    print(data);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.greenAccent,
                  ),
                )),
            InkWell(
                onTap: () async {
                  SocialShare.shareOptions(widget.content).then((data) {
                    print(data);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                )),
          ],
=======
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
>>>>>>> 51fe6d4 (first commit)
        ),
      ),
    );
  }
}

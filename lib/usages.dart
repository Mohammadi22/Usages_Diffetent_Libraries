import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:video_player/video_player.dart';
import 'package:intl/intl.dart';
import 'dart:io';

//از این کتابخانه میتوانیم از یک مجموعه بزرگ لغات که شامل شکل های مختلف میشود استفاده کرد
class English_Word extends StatelessWidget {
  const English_Word({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 199, 121, 212),
        title: const Center(
            child: Text(
          "English Words Librart",
          style: TextStyle(color: Color.fromARGB(255, 12, 10, 12)),
        )),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(nouns.first,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                )),
            Text(
              WordPair.random().asCamelCase,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//در این کتابخانه میاموزیم که چگونه میتوانیم برای رفتن به گوگل یا سرچ مستقیم در گوگل استفاده کنیم

void searchInGoogle(String query) async {
  final Uri googleSearchUrl =
      Uri.parse('https://www.google.com/search?q=$query');
  if (await canLaunchUrl(googleSearchUrl)) {
    await launchUrl(googleSearchUrl, mode: LaunchMode.externalApplication);
  } else {
    print('Could not launch the URL');
  }
}

class Url extends StatefulWidget {
  @override
  State<Url> createState() => _UrlState();
}

class _UrlState extends State<Url> {
  final String nameToSearch = "Elon Mask";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 199, 121, 212),
        title: const Center(
            child: Text(
          "Stright search in Google",
          style: TextStyle(color: Color.fromARGB(255, 12, 10, 12)),
        )),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("""
ایلان ماسک یکی از سرمایه دار ترین افراد جهان به شمار میرود.
که صاحب شرکت های بزرگی مانند تسلا,کمپنی تویتر و غیره میباشد .
برای معلومات بیشتر روی لینک زیر کلیک کنید.
"""),
            GestureDetector(
                onTap: () {
                  searchInGoogle(nameToSearch);
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'search "$nameToSearch"',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

//در این کتابخانه می آموزیم که چگونه آهنگ مورد دالخواه خود را پلی کنیم

class Audio_player extends StatefulWidget {
  const Audio_player({super.key});

  @override
  State<Audio_player> createState() => _Audio_playerState();
}

class _Audio_playerState extends State<Audio_player> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  void _playAudio() {
    _audioPlayer.play(AssetSource('Asr.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 199, 121, 212),
        title: const Center(
            child: Text(
          "English Words Librart",
          style: TextStyle(color: Color.fromARGB(255, 12, 10, 12)),
        )),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IconButton(
              style: TextButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () {
                _playAudio();
              },
              icon: const Text("click to play"),
            ),
          ],
        ),
      ),
    );
  }
}

//در این بخش قرار هست که آ|پ خود را در فرشگاه قرار دهیم

class Play_Store extends StatefulWidget {
  const Play_Store({super.key});

  @override
  State<Play_Store> createState() => _Play_StoreState();
}

class _Play_StoreState extends State<Play_Store> {
  final String appName = "Top_Ten_rich_people"; // نام اپلیکیشن شما برای جستجو

  void _searchInPlayStore() async {
    final String playStoreUrl =
        "https://play.google.com/store/search?q=$appName&c=apps";

    if (await canLaunchUrl(Uri.parse(playStoreUrl))) {
      await launchUrl(Uri.parse(playStoreUrl),
          mode: LaunchMode.externalApplication);
    } else {
      throw "Cannot open Play Store";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 199, 121, 212),
        title: const Center(
            child: Text(
          "Play Store Library",
          style: TextStyle(color: Color.fromARGB(255, 12, 10, 12)),
        )),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IconButton(
              style: TextButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () {
                _searchInPlayStore();
              },
              icon: const Text("Download your app here"),
            ),
          ],
        ),
      ),
    );
  }
}

// جگونگی اجرا کردن ویدیئو در آپ خود

class Video extends StatefulWidget {
  const Video({super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // بارگذاری ویدیو از assets
    _controller = VideoPlayerController.asset('assets/worrieng.mp4')
      ..initialize().then((_) {
        setState(() {}); // بازسازی ویجت پس از آماده شدن ویدیو
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // آزاد کردن منابع
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 199, 121, 212),
        title: const Center(
            child: Text(
          "Video player Library",
          style: TextStyle(color: Color.fromARGB(255, 12, 10, 12)),
        )),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IconButton(
              style: TextButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              icon: const Text("play your video here"),
            ),
          ],
        ),
      ),
    );
  }
}

// این کتابخانه این مکان را میدهد که از چندین فرمت استفاده کنید و متون خود را به چند زبان استفاده کنیم

class Intl extends StatefulWidget {
  const Intl({super.key});

  @override
  State<Intl> createState() => _IntlState();
}

class _IntlState extends State<Intl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 199, 121, 212),
        title: const Center(
            child: Text(
          "Time and date Library",
          style: TextStyle(color: Color.fromARGB(255, 12, 10, 12)),
        )),
      ),
      body: Center(
          child: Container(
        child: Text(
          'تاریخ امروز : ${DateFormat.yMMMM().format(DateTime.now())}',
          style: TextStyle(fontSize: 30),
        ),
      )),
    );
  }
}

//  در این کتابخانه چگونگی آپلود عکس از گالری یا عکس گرفتن با دوربین

class Image_picker extends StatefulWidget {
  const Image_picker({super.key});

  @override
  State<Image_picker> createState() => _Image_pickerState();
}

class _Image_pickerState extends State<Image_picker> {
  File? _image; // برای ذخیره تصویر انتخاب‌شده

  // تابع انتخاب تصویر از گالری
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 199, 121, 212),
        title: const Center(
            child: Text(
          "use from your gollery here",
          style: TextStyle(color: Color.fromARGB(255, 12, 10, 12)),
        )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // نمایش تصویر یا پیام
            _image == null
                ? Text('عکسی انتخاب نشده است.')
                : Image.file(_image!, width: 150, height: 150),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage, // انتخاب عکس
              child: Text('انتخاب از گالری'),
            ),
          ],
        ),
      ),
    );
  }
}

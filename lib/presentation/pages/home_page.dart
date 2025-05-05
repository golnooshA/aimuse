import 'package:aimuse/core/config/design_config.dart';
import 'package:flutter/material.dart';
import '../../data/models/events.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/event_card.dart';
import '../widgets/slideshow.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentSlide = 0;
  int selectedIndex = 0;

  final List<String> slideImages = [
    'https://eforms.leedsth.nhs.uk/webteam/gallery/img_mountains.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSt0ostTE3DPrB4g5JqZzHAWyaQcsfwE0mdSQ&s',
    'https://thumbs.dreamstime.com/b/rugged-mountains-reflecting-calm-river-17706542.jpg',
  ];

  final List<Event> events = [
    Event(
      category: 'Culture',
      title:
      'Torna FloraCult, manifestazione di piante, fiori e vita green',
      location: 'Via Giacomo Andreassi, 30, RM',
      imageUrl:
      'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg',
    ),
    Event(
      category: 'Theaters',
      title:
      'Luca Argentero in "E questa la vita che sognavo da bambino" al Brancaccio',
      location: 'Via Merulana, 244, RM',
      imageUrl:
      'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg',
    ),
    Event(
      category: 'Cinema',
      title:
      'Fr*cinema, 7 serate a cura di Pietro Turano e Arcigay al Cinema Troisi',
      location: 'Via Girolamo Induno, 1, RM',
      imageUrl:
      'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg',
    ),
    Event(
      category: 'Exhibition',
      title:
      'Ukiyoe. The floating world, exhibition dedicated to Japan',
      location: 'Museo Nazionale, RM',
      imageUrl:
      'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DesignConfig.appBarBackgroundColor,
        centerTitle: true,
        // title: Text(
        //   'AiMuse',
        //   style: TextStyle(
        //     color: DesignConfig.appBarTitleColor,
        //     fontSize: DesignConfig.appBarTitleFontSize,
        //   ),
        // ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, size: 36, color: Colors.black),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(Icons.search, size: 36, color: Colors.black),
            onPressed: () {
            },
          ),

          SizedBox(width: 8),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: 1 + events.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            // slideshow at top
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SlideshowWidget(
                images: slideImages,
                currentIndex: currentSlide,
                slideTitle:
                '"Antonio Donghi. La magia del silenzio", la mostra a Palazzo Merulana',
                onPageChanged: (i) => setState(() => currentSlide = i),
              ),
            );
          }
          // event cards
          final event = events[index - 1];
          return EventCard(event: event);
        },
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onTap: (i) => setState(() => selectedIndex = i),
      ),
    );
  }
}

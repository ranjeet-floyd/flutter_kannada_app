import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';


class FlashCardApp extends StatefulWidget {
  const FlashCardApp({super.key});

  @override
  State<FlashCardApp> createState() => _FlashCardAppState();
}

class _FlashCardAppState extends State<FlashCardApp> with SingleTickerProviderStateMixin {
  final List<Map<String, String>> flashcards = 
   [  
  {'front': 'Hello, how are you?', 'back': 'Namaskāra, hēgiddīri?', 'explanation': 'Namaskāra = Hello, hēgiddīri = how are you (formal)'},  
  {'front': 'What is your name?', 'back': 'Nimma hesarēnu?', 'explanation': 'Nimma = your, hesarēnu = name + what (hesaru = name, ēnu = what)'},  
  {'front': 'I am from Bangalore.', 'back': 'Nānu Bengalūrinda bandiddēne.', 'explanation': 'Nānu = I, Bengalūrinda = from Bangalore, bandiddēne = have come'},  
  {'front': 'Where is the hospital?', 'back': 'Aspatre ellide?', 'explanation': 'Aspatre = hospital, ellide = where is'},  
  {'front': 'How much is this?', 'back': 'Idu estu?', 'explanation': 'Idu = this, estu = how much'},  
  {'front': 'I want water.', 'back': 'Nanage nīru bēku.', 'explanation': 'Nanage = to me, nīru = water, bēku = want'},  
  {'front': 'Please help me.', 'back': 'Daya māḍi nanage sahāya māḍi.', 'explanation': 'Daya māḍi = please, nanage = to me, sahāya = help, māḍi = do'},  
  {'front': 'I don’t know.', 'back': 'Nanage gottilla.', 'explanation': 'Nanage = to me, gottilla = don’t know'},  
  {'front': 'What time is it?', 'back': 'Time estu?', 'explanation': 'Time = time (loanword), estu = how much'},  
  {'front': 'Let’s go to the park.', 'back': 'Park-ge hōgōna.', 'explanation': 'Park-ge = to park, hōgōna = let’s go'},  
  {'front': 'This is delicious!', 'back': 'Idu khushiyāgide!', 'explanation': 'Idu = this, khushiyāgide = has become happy (delicious)'},  
  {'front': 'Where are you going?', 'back': 'Nīvu ellige hōgtiddīri?', 'explanation': 'Nīvu = you, ellige = where, hōgtiddīri = are going'},  
  {'front': 'I am tired.', 'back': 'Nanage sustu āgide.', 'explanation': 'Nanage = to me, sustu = tiredness, āgide = has become'},  
  {'front': 'Call me later.', 'back': 'Nannannu tāvū kare māḍi.', 'explanation': 'Nannannu = me, tāvū = later, kare = call, māḍi = do'},  
  {'front': 'Where is the restroom?', 'back': 'Toilet ellide?', 'explanation': 'Toilet = restroom (loanword), ellide = where is'},  
  {'front': 'I love Karnataka.', 'back': 'Nānu Karnāṭakannu prītisutēne.', 'explanation': 'Nānu = I, Karnāṭakannu = Karnataka, prītisutēne = love'},  
  {'front': 'Turn left.', 'back': 'Edakke thaggoli.', 'explanation': 'Edakke = left, thaggoli = turn'},  
  {'front': 'How old are you?', 'back': 'Nimma vayassu estu?', 'explanation': 'Nimma = your, vayassu = age, estu = how much'},  
  {'front': 'Wait a moment.', 'back': 'Ondu nimisha nillisi.', 'explanation': 'Ondu = one, nimisha = moment, nillisi = wait'},  
  {'front': 'I need money.', 'back': 'Nanage duḍu bēku.', 'explanation': 'Nanage = to me, duḍu = money, bēku = need'},  
  {'front': 'Today is hot.', 'back': 'Ivattu bisi āgide.', 'explanation': 'Ivattu = today, bisi = hot, āgide = has become'},  
  {'front': 'Where is the market?', 'back': 'Market ellide?', 'explanation': 'Market = loanword, ellide = where is'},  
  {'front': 'What are you doing?', 'back': 'Nīvu ēnu māḍtiddīri?', 'explanation': 'Nīvu = you, ēnu = what, māḍtiddīri = are doing'},  
  {'front': 'I am learning Kannada.', 'back': 'Nānu Kannada kalitiddēne.', 'explanation': 'Nānu = I, Kannada = language, kalitiddēne = am learning'},  
  {'front': 'Happy Birthday!', 'back': 'Huttida habbada shubhāshayagaḷu!', 'explanation': 'Huttida habbada = birthday, shubhāshayagaḷu = wishes'}  

  ];

   // A list of booleans to track the state (front/back) of each card
  List<bool> showBackList = [] ; //= List.generate(10, (index) => false);
  bool showExplanation = true;

  @override
  void initState() {
    super.initState();
    showBackList = List.generate(flashcards.length, (index) => false);
    _loadPreferences();
  }

  void _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      showExplanation = prefs.getBool('showExplanation') ?? true;
    });
  }



  void _showRandomCard() {
    setState(() {
      // Show a random card and reset to the front
      int randomIndex = Random().nextInt(flashcards.length);
      showBackList[randomIndex] = false;  // Always reset to front
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Learn Kannada', 
          style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.deepPurple,
          actions: [
            IconButton(
              icon: Icon(Icons.shuffle,),
              color: Colors.white, 
              onPressed: _showRandomCard,
            ),
            IconButton(
              icon: Icon(Icons.restart_alt),
              color: Colors.white,  // Make the icon color white
              onPressed: () {
                setState(() {
                  // Reset the list to the first flashcard
                  showBackList = List.generate(flashcards.length, (index) => false);
                });
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: flashcards.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  // Toggle the selected card's front/back state
                  showBackList[index] = !showBackList[index];
                });
              },
              child: Card(
                elevation: 8.0,
                margin: EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  padding: EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple, Colors.blueAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        showBackList[index]
                            ? flashcards[index]['back']!
                            : flashcards[index]['front']!,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (showBackList[index] && showExplanation)
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            flashcards[index]['explanation']!,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Card ${showBackList.indexWhere((showBack) => showBack) + 1} of ${flashcards.length}',
                style: TextStyle(fontSize: 16.0, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
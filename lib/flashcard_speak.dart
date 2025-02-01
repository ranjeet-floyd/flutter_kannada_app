import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlashCardApp extends StatefulWidget {
  @override
  _FlashCardAppState createState() => _FlashCardAppState();
}

class _FlashCardAppState extends State<FlashCardApp> {
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

  int currentIndex = 0;
  bool showBack = false;
  bool showExplanation = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  void _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currentIndex = prefs.getInt('currentIndex') ?? 0;
      showExplanation = prefs.getBool('showExplanation') ?? true;
    });
  }

  void _savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('currentIndex', currentIndex);
    prefs.setBool('showExplanation', showExplanation);
  }

  void _showNextCard() {
    setState(() {
      currentIndex = (currentIndex + 1) % flashcards.length;
      showBack = false;
    });
    _savePreferences();
  }

  void _showPreviousCard() {
    setState(() {
      currentIndex = (currentIndex - 1 + flashcards.length) % flashcards.length;
      showBack = false;
    });
    _savePreferences();
  }

  void _resetCards() {
    setState(() {
      currentIndex = 0;
      showBack = false;
    });
    _savePreferences();
  }

  void _toggleExplanation(bool value) {
    setState(() {
      showExplanation = value;
    });
    _savePreferences();
  }

  void _showRandomCard() {
    setState(() {
      currentIndex = (currentIndex + DateTime.now().millisecondsSinceEpoch) % flashcards.length;
      showBack = false;
    });
    _savePreferences();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flashcards'),
          backgroundColor: Colors.deepPurple,
          actions: [
            IconButton(
              icon: Icon(Icons.shuffle),
              onPressed: _showRandomCard,
            ),
            IconButton(
              icon: Icon(Icons.restart_alt),
              onPressed: _resetCards,
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    showBack = !showBack;
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
                          showBack
                              ? flashcards[currentIndex]['back']!
                              : flashcards[currentIndex]['front']!,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        if (showBack && showExplanation)
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Text(
                              flashcards[currentIndex]['explanation']!,
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: _showPreviousCard,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    label: Text(
                      'Previous',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _showNextCard,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    icon: Icon(Icons.arrow_forward, color: Colors.white),
                    label: Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Show Explanation',
                      style: TextStyle(fontSize: 16.0, color: Colors.black87),
                    ),
                    Switch(
                      value: showExplanation,
                      onChanged: _toggleExplanation,
                      activeColor: Colors.deepPurple,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

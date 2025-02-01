// import 'package:flutter/material.dart';

// class FlashCardApp extends StatefulWidget {
//   @override
//   _FlashCardAppState createState() => _FlashCardAppState();
// }

// class _FlashCardAppState extends State<FlashCardApp> {
//   final List<Map<String, String>> flashcards = [
//   {'front': 'Hello', 'back': 'Namaskara'},
//   {'front': 'How are you?', 'back': 'Hegideera?'},
//   {'front': 'What is your name?', 'back': 'Nimma hesaru yenu?'},
//   {'front': 'My name is...', 'back': 'Nanna hesaru...'},
//   {'front': 'Thank you', 'back': 'Dhanyavaadagalu'},
//   {'front': 'Sorry', 'back': 'Kshamisi'},
//   {'front': 'Yes', 'back': 'Haudu'},
//   {'front': 'No', 'back': 'Illa'},
//   {'front': 'Please', 'back': 'Dayavittu'},
//   {'front': 'Good morning', 'back': 'Shubhodaya'},
//   {'front': 'Good night', 'back': 'Shubharatri'},
//   {'front': 'I don\'t understand', 'back': 'Nanage artha aaguvudilla'},
//   {'front': 'Where is the restroom?', 'back': 'Shouchalaya ellide?'},
//   {'front': 'How much does this cost?', 'back': 'Idara bele eshtu?'},
//   {'front': 'Can you help me?', 'back': 'Nanna sahaya maadtheera?'},
//   {'front': 'I am hungry', 'back': 'Nanage hasivu ide'},
//   {'front': 'I am thirsty', 'back': 'Nanage baayaarike ide'},
//   {'front': 'I am fine', 'back': 'Naanu channagideeni'},
//   {'front': 'I am lost', 'back': 'Naanu kale hoythu'},
//   {'front': 'Call the police', 'back': 'Policera kare madi'},
//   {'front': 'I need a doctor', 'back': 'Nanage vaidyana beku'},
//   {'front': 'What time is it?', 'back': 'Samaya eshtu?'},
//   {'front': 'I am learning Kannada', 'back': 'Naanu Kannada kalithu kolluttidini'},
//   {'front': 'Can you speak slowly?', 'back': 'Neve swalpa nidhana vagi mathanadi?'},
//   {'front': 'Where is this place?', 'back': 'I jagaa ellide?'},
//   {'front': 'Do you speak English?', 'back': 'Neve English mathanadutheera?'},
//   {'front': 'I like this', 'back': 'Nanage idu ishta'},
//   {'front': 'I am coming', 'back': 'Naanu baruttidini'},
//   {'front': 'I am going', 'back': 'Naanu hoguttidini'},
//   {'front': 'What happened?', 'back': 'Enaythu?'},
//   {'front': 'See you later', 'back': 'Matte sigona'},
//   {'front': 'Where are you?', 'back': 'Neve ellideera?'},
//   {'front': 'Don\'t worry', 'back': 'Chinte madi beda'},
//   {'front': 'Let\'s go', 'back': 'Naavu hogona'},
//   {'front': 'Come here', 'back': 'Illi banni'},
//   {'front': 'Stop', 'back': 'Nillisiri'},
//   {'front': 'Wait', 'back': 'Kshamisi'},
//   {'front': 'Be careful', 'back': 'Jagrathe iriri'},
//   {'front': 'What do you want?', 'back': 'Nimage enu beku?'},
//   {'front': 'I want water', 'back': 'Nanage neeru beku'},
//   {'front': 'Let\'s eat', 'back': 'Naavu oota maadona'},
//   {'front': 'Where do you live?', 'back': 'Neve elli vasisutthira?'},
//   {'front': 'I live in...', 'back': 'Naanu ... alli vasisuttene'},
//   {'front': 'Can I help you?', 'back': 'Naanu nimage sahaya maadabahuda?'},
//   {'front': 'This is good', 'back': 'Idu channagide'},
//   {'front': 'This is bad', 'back': 'Idu keTTaddu'},
//   {'front': 'Excuse me', 'back': 'Kshamisi'},
//   {'front': 'Where are you from?', 'back': 'Neve ellinda bandideera?'},
//   {'front': 'I am from...', 'back': 'Naanu ... inda bandiddini'},
//   {'front': 'What is this?', 'back': 'Idu yenu?'},
//   {'front': 'Let\'s start', 'back': 'Naavu shuru maadona'},
//   {'front': 'I need help', 'back': 'Nanage sahaya beku'},
//   {'front': 'What are you doing?', 'back': 'Neve enu maaduttidira?'},
//   {'front': 'How was your day?', 'back': 'Nimma dina hegidittu?'},
//   {'front': 'I am tired', 'back': 'Naanu sustha idini'},
//   {'front': 'Let\'s take a break', 'back': 'Naavu break thagoli'},
//   {'front': 'Do you understand?', 'back': 'Nimage artha aayita?'},
//   {'front': 'That\'s interesting', 'back': 'Adu ashtu ashcharya'},
//   {'front': 'I agree', 'back': 'Naanu opikolluttini'},
//   {'front': 'I disagree', 'back': 'Naanu opikolluvailla'},
//   {'front': 'That\'s a good idea', 'back': 'Adu oLLeya aalochane'},
//   {'front': 'What\'s the problem?', 'back': 'Samasya yenu?'},
//   {'front': 'Where is the market?', 'back': 'Angadi ellide?'},
//   {'front': 'Can you repeat?', 'back': 'Dayavittu mathe helthira?'},
//   {'front': 'What is the weather?', 'back': 'Havaamaana hegiruvudu?'},
//   {'front': 'I am feeling cold', 'back': 'Nanage tanna ide'},
//   {'front': 'I am feeling hot', 'back': 'Nanage bisilu ide'},
//   {'front': 'Let\'s plan', 'back': 'Naavu yojane maadona'},
//   {'front': 'What\'s your opinion?', 'back': 'Nimma abhipraya yenu?'},
//   {'front': 'Can we meet?', 'back': 'Naavu sigabahuda?'},
//   {'front': 'It\'s urgent', 'back': 'Idu atyavashyaka'},
//   {'front': 'Where can I find it?', 'back': 'Adu elli sigutthe?'},
//   {'front': 'I will call you', 'back': 'Naanu nimage call maaduttini'},
//   {'front': 'I like Kannada', 'back': 'Nanage Kannada ishta'},
//   {'front': 'How is this?', 'back': 'Idu hegide?'},
//   {'front': 'I need to leave', 'back': 'Naanu horaDuttini'},
//   {'front': 'Can I join?', 'back': 'Naanu seerabahuda?'},
//   {'front': 'What did you say?', 'back': 'Neve enu helidiri?'},
//   {'front': 'Where is your home?', 'back': 'Nimma mane ellide?'},
//   {'front': 'Let\'s watch a movie', 'back': 'Naavu cinema nodona'},
//   {'front': 'I am excited', 'back': 'Naanu uttejana paduvudini'},
//   {'front': 'It\'s difficult', 'back': 'Idu kashta'},
//   {'front': 'Where is the park?', 'back': 'Park ellide?'},
//   {'front': 'Let\'s do this', 'back': 'Naavu idu maadona'},
//   {'front': 'Be on time', 'back': 'Samayakke banni'},
//   {'front': 'I am practicing', 'back': 'Naanu abhyaasa maaduttidini'},
//   {'front': 'Can we start now?', 'back': 'Eega shuru maadabahuda?'},
//   {'front': 'I love this place', 'back': 'Nanage i jagaa ishta'},
//   {'front': 'That\'s funny', 'back': 'Adu vinoda'},
//   {'front': 'What are you looking for?', 'back': 'Neve yenu hudukuttidira?'},
//   {'front': 'I will return soon', 'back': 'Naanu baiga baruttini'},
//   {'front': 'Where is the bus stop?', 'back': 'Bus stop ellide?'},
//   {'front': 'It\'s late', 'back': 'Tadayitu'},
//   {'front': 'Be positive', 'back': 'Ollaya bhaavana iru'},
//   {'front': 'Do you need anything?', 'back': 'Nimage enadharu beka?'},
//   {'front': 'Let\'s celebrate', 'back': 'Naavu habba maadona'},
//   {'front': 'I am happy', 'back': 'Naanu khushi idini'},
//   {'front': 'Why are you sad?', 'back': 'Neve dukkhavagiddira yeke?'},
//   {'front': 'I am coming to your home', 'back': 'Naanu nimma manege baruttidini'},
//   {'front': 'Can you explain?', 'back': 'Neve vivarisi helabahuda?'},
//   {'front': 'Let\'s prepare food', 'back': 'Naavu oota tayarisi maadona'},
//   {'front': 'Where is the doctor?', 'back': 'Doctor ellide?'},
//   {'front': 'Can you write?', 'back': 'Neve baredu torsabahuda?'},
//   {'front': 'Where is the hospital?', 'back': 'Hospital ellide?'},
//   {'front': 'Where is the school?', 'back': 'Shaale ellide?'},
//   {'front': 'Let\'s study', 'back': 'Naavu odidona'},
//   {'front': 'Where is the restaurant?', 'back': 'Restaurant ellide?'},
//   {'front': 'I am feeling sleepy', 'back': 'Nanage nidre baruttide'},
//   {'front': 'Let\'s relax', 'back': 'Naavu rest thagolana'},
//   {'front': 'What\'s the matter?', 'back': 'Vishaya yenu?'},
//   {'front': 'Where is the train station?', 'back': 'Train ellide?'}
// ];

//   bool showBack = false;
//   int currentCardIndex = 0;

//   void nextCard() {
//     setState(() {
//       showBack = false;
//       currentCardIndex = (currentCardIndex + 1) % flashcards.length;
//     });
//   }

//   void prevCard() {
//     setState(() {
//       showBack = false;
//       currentCardIndex =
//           currentCardIndex == 0 ? flashcards.length - 1 : currentCardIndex - 1;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Daily Kanada App'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Expanded(
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       showBack = !showBack;
//                     });
//                   },
//                   child: Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16.0),
//                     ),
//                     elevation: 4.0,
//                     child: Center(
//                       child: Text(
//                         showBack
//                             ? flashcards[currentCardIndex]['back']!
//                             : flashcards[currentCardIndex]['front']!,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 24.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: prevCard,
//                     child: Text('◀ Previous'),
//                   ),
//                   ElevatedButton(
//                     onPressed: nextCard,
//                     child: Text('Next ▶'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/db.dart';
import 'package:quiz_app/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  QuestionStorage questionStorage = QuestionStorage();
  List<Question> loadedQuestions = await questionStorage.loadQuestions(1);

  // Sample questions
  List<Question> hardQuestions = [
    Question(
      question: 'What is the primary purpose of an academic text?',
      choices: [
        'To entertain readers',
        'To argue, inform, or persuade using evidence',
        'To use personal experiences as the main source of information',
        'To provide fictional narratives'
      ],
      correctAnswer: 'To argue, inform, or persuade using evidence',
    ),
    Question(
      question:
          'Which of the following is NOT a characteristic of an academic text?',
      choices: [
        'Uses formal language',
        'Written by professionals or experts',
        'Based on personal opinions and emotions',
        'Objective and supported by credible sources'
      ],
      correctAnswer: 'Based on personal opinions and emotions',
    ),
    Question(
      question:
          'Which type of academic text is written to present the writer’s stand on a specific issue?',
      choices: ['Review', 'Concept Paper', 'Position Paper', 'Thesis'],
      correctAnswer: 'Position Paper',
    ),
    Question(
      question: 'What is the purpose of a concept paper?',
      choices: [
        'To analyze and evaluate published research',
        'To present a proposed project overview for potential approval',
        'To summarize a book or article',
        'To publish findings in a scholarly journal'
      ],
      correctAnswer:
          'To present a proposed project overview for potential approval',
    ),
    Question(
      question: 'What is the correct definition of summarizing?',
      choices: [
        'Expanding on the details of a text',
        'Expressing the most important ideas briefly and accurately',
        'Copying exact sentences from the original text',
        'Giving personal opinions about the text'
      ],
      correctAnswer:
          'Expressing the most important ideas briefly and accurately',
    ),
    Question(
      question: 'According to Diane Hacker, what makes a good summary?',
      choices: [
        'It should be longer than the original text',
        'It should state the work’s thesis and main ideas briefly and accurately',
        'It should contain detailed examples and explanations',
        'It should be written in the same words as the original text'
      ],
      correctAnswer:
          'It should state the work’s thesis and main ideas briefly and accurately',
    ),
    Question(
      question: 'What is the role of a thesis statement in an academic text?',
      choices: [
        'To summarize the references used in the paper',
        'To introduce a broad topic without a specific focus',
        'To provide a central idea that guides and unifies the text',
        'To list supporting arguments without stating a clear position'
      ],
      correctAnswer:
          'To provide a central idea that guides and unifies the text',
    ),
    Question(
      question:
          'Which of the following is NOT a key element of a strong thesis statement?',
      choices: [
        'It is arguable',
        'It is a complete sentence',
        'It is a fact',
        'It requires support'
      ],
      correctAnswer: 'It is a fact',
    ),
    Question(
      question:
          'What is the main difference between academic and non-academic texts?',
      choices: [
        'Academic texts use informal language, while non-academic texts use formal language',
        'Academic texts include references and expert authors, while non-academic texts do not',
        'Non-academic texts take longer to publish than academic texts',
        'Non-academic texts always contain research-based information'
      ],
      correctAnswer:
          'Academic texts include references and expert authors, while non-academic texts do not',
    ),
    Question(
      question:
          'Which of the following is an important step when creating a reading outline?',
      choices: [
        'Writing down all details from the text',
        'Skimming the text before reading thoroughly',
        'Ignoring the topic sentences',
        'Avoiding organization of ideas'
      ],
      correctAnswer: 'Skimming the text before reading thoroughly',
    ),
    Question(
      question: 'What type of language is used in academic texts?',
      choices: [
        'Informal and casual',
        'Formal and objective',
        'Slang and conversational',
        'Humorous and personal'
      ],
      correctAnswer: 'Formal and objective',
    ),
    Question(
      question: 'Which of the following is an example of an academic text?',
      choices: [
        'A Facebook post',
        'A scholarly journal article',
        'A personal diary entry',
        'A comic book'
      ],
      correctAnswer: 'A scholarly journal article',
    ),
    Question(
      question: 'What is the main purpose of summarizing?',
      choices: [
        'To copy the original text word for word',
        'To make the text longer',
        'To express the main ideas in a shorter form',
        'To change the meaning of the original text'
      ],
      correctAnswer: 'To express the main ideas in a shorter form',
    ),
    Question(
      question: 'What should a strong thesis statement do?',
      choices: [
        'Take a stand and be arguable',
        'Be a simple fact',
        'Be written as a question',
        'List random ideas'
      ],
      correctAnswer: 'Take a stand and be arguable',
    ),
    Question(
      question:
          'What is the difference between academic and non-academic texts?',
      choices: [
        'Academic texts use informal language, while non-academic texts use formal language',
        'Academic texts do not require references, while non-academic texts always have references',
        'Academic texts are written by experts, while non-academic texts can be written by anyone',
        'Academic texts are mostly fictional, while non-academic texts are based on facts'
      ],
      correctAnswer:
          'Academic texts are written by experts, while non-academic texts can be written by anyone',
    ),
  ];
  List<Question> easyQuestions = [
    Question(
      question: 'What is the purpose of an academic text?',
      choices: [
        'To entertain',
        'To inform, argue, or persuade',
        'To express opinions',
        'To tell stories'
      ],
      correctAnswer: 'To inform, argue, or persuade',
    ),
    Question(
      question: 'Which is an example of an academic text?',
      choices: ['Novel', 'Blog post', 'Position paper', 'Magazine article'],
      correctAnswer: 'Position paper',
    ),
    Question(
      question: 'What does a thesis statement do?',
      choices: [
        'Asks a question',
        'States a fact',
        'Guides and unifies ideas',
        'Lists references'
      ],
      correctAnswer: 'Guides and unifies ideas',
    ),
    Question(
      question: 'What should a summary include?',
      choices: [
        'Every detail',
        'Only opinions',
        'Main points in your own words',
        'Unrelated information'
      ],
      correctAnswer: 'Main points in your own words',
    ),
    Question(
      question: 'What is a key feature of academic texts?',
      choices: [
        'Informal language',
        'No references',
        'Written by experts',
        'No factual basis'
      ],
      correctAnswer: 'Written by experts',
    ),
  ];
  List<Question> mediumQuestions = [
    Question(
      question: 'What is the primary purpose of an academic text?',
      choices: [
        'To entertain the audience',
        'To provide information, argue a point, or persuade readers',
        'To share personal opinions',
        'To use informal language'
      ],
      correctAnswer:
          'To provide information, argue a point, or persuade readers',
    ),
    Question(
      question: 'Which of the following is an example of an academic text?',
      choices: [
        'Blog post',
        'Social media post',
        'Thesis/Dissertation',
        'Magazine article'
      ],
      correctAnswer: 'Thesis/Dissertation',
    ),
    Question(
      question: 'What is the key characteristic of academic writing?',
      choices: [
        'Subjective and opinionated',
        'Based on facts and evidence',
        'Uses casual and informal language',
        'Does not require citations'
      ],
      correctAnswer: 'Based on facts and evidence',
    ),
    Question(
      question:
          'What type of academic text presents the writer’s stand on an issue?',
      choices: [
        'Concept paper',
        'Review',
        'Position paper',
        'Conference paper'
      ],
      correctAnswer: 'Position paper',
    ),
    Question(
      question: 'According to Diane Hacker, summarizing involves:',
      choices: [
        'Stating a work’s thesis and main ideas simply, briefly, and accurately',
        'Providing a detailed analysis of a text',
        'Copying the entire text word for word',
        'Giving a personal opinion on a text'
      ],
      correctAnswer:
          'Stating a work’s thesis and main ideas simply, briefly, and accurately',
    ),
    Question(
      question:
          'What is the ideal length of a summary compared to the original text?',
      choices: [
        'One-fifth of the original',
        'One-third of the original',
        'Half of the original',
        'Equal to the original'
      ],
      correctAnswer: 'One-third of the original',
    ),
    Question(
      question:
          'Where is the thesis statement typically found in an academic text?',
      choices: [
        'In the conclusion only',
        'Randomly throughout the paper',
        'In the abstract or at the end of the introduction',
        'In the bibliography'
      ],
      correctAnswer: 'In the abstract or at the end of the introduction',
    ),
    Question(
      question:
          'Which of the following is NOT a characteristic of a strong thesis statement?',
      choices: [
        'It is arguable',
        'It is a question',
        'It takes a stand',
        'It requires support'
      ],
      correctAnswer: 'It is a question',
    ),
    Question(
      question:
          'What is a key difference between academic and non-academic texts?',
      choices: [
        'Academic texts use informal language',
        'Non-academic texts require extensive citations',
        'Academic texts are written by professionals and require references',
        'Non-academic texts take years to publish'
      ],
      correctAnswer:
          'Academic texts are written by professionals and require references',
    ),
    Question(
      question:
          'Which type of outline is used to get the main ideas from an already written text?',
      choices: [
        'Writing outline',
        'Reading outline',
        'Research outline',
        'Summary outline'
      ],
      correctAnswer: 'Reading outline',
    ),
  ];

  // Store questions
  if (loadedQuestions.isEmpty) {
    await questionStorage.storeQuestions(easyQuestions, 1);
    await questionStorage.storeQuestions(mediumQuestions, 2);
    await questionStorage.storeQuestions(hardQuestions, 3);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.lilitaOne().fontFamily,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      // home: const QuizPage(),
    );
  }
}

import 'package:flutter/material.dart';

bool isTapped = false,
    isTapped1 = false,
    isTapped2 = false,
    isTapped3 = false,
    isTapped4 = false,
    isTappedMCQ = false,
    isTappedMCQ1 = false,
    isTappedMCQ2 = false,
    isTappedMCQ3 = false,
    isTappedMCQ4 = false,
    isTappedYesNoFlash = false,
    isTappedMCQFlash = false;
int saroviOffline;
int questionNumber;
int counterSurvey = 0;
int anonym;
bool isSummary = false;
bool isOnSummary = false;
String btnText = '';
String surveyGroupName = '', currentUsername = '';
bool isFutureDone = false;
String answersFromSummary;
int userLevelForList;
String usernameGlobal, passGlobal, emailGlobal, phoneGlobal;
GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
String languageOfApp;

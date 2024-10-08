// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Good morninig`
  String get goodMorning {
    return Intl.message(
      'Good morninig',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Wrong`
  String get wrong {
    return Intl.message(
      'Wrong',
      name: 'wrong',
      desc: '',
      args: [],
    );
  }

  /// `No Page Found`
  String get noRoute {
    return Intl.message(
      'No Page Found',
      name: 'noRoute',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get logIn {
    return Intl.message(
      'Log In',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forgotPassword {
    return Intl.message(
      'Forget Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Or login with`
  String get loginWithSocialMedia {
    return Intl.message(
      'Or login with',
      name: 'loginWithSocialMedia',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signup {
    return Intl.message(
      'Sign up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Required Field`
  String get requiredField {
    return Intl.message(
      'Required Field',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Not Valid Name`
  String get notValidName {
    return Intl.message(
      'Not Valid Name',
      name: 'notValidName',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Already have an accoount`
  String get haveAccoount {
    return Intl.message(
      'Already have an accoount',
      name: 'haveAccoount',
      desc: '',
      args: [],
    );
  }

  /// `Signup  with social media`
  String get signUpWithSc {
    return Intl.message(
      'Signup  with social media',
      name: 'signUpWithSc',
      desc: '',
      args: [],
    );
  }

  /// `it mus'nt contain any number [0-9]`
  String get notValidEmail {
    return Intl.message(
      'it mus\'nt contain any number [0-9]',
      name: 'notValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Use 8 characters or more for your password`
  String get passErrorSignUp {
    return Intl.message(
      'Use 8 characters or more for your password',
      name: 'passErrorSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to the News App`
  String get onboarding1Title {
    return Intl.message(
      'Welcome to the News App',
      name: 'onboarding1Title',
      desc: '',
      args: [],
    );
  }

  /// `Stay ahead of the curve with News! Personalize your news feed, receive breaking news alerts, and explore a world of information at your fingertips`
  String get onboarding1Body {
    return Intl.message(
      'Stay ahead of the curve with News! Personalize your news feed, receive breaking news alerts, and explore a world of information at your fingertips',
      name: 'onboarding1Body',
      desc: '',
      args: [],
    );
  }

  /// `Explore the World of News`
  String get onboarding2Title {
    return Intl.message(
      'Explore the World of News',
      name: 'onboarding2Title',
      desc: '',
      args: [],
    );
  }

  /// `Customize your news experience by choosing your favorite topics. From global events to niche interests, our app covers it all.`
  String get onboarding2Body {
    return Intl.message(
      'Customize your news experience by choosing your favorite topics. From global events to niche interests, our app covers it all.',
      name: 'onboarding2Body',
      desc: '',
      args: [],
    );
  }

  /// `Stay Informed, Anywhere`
  String get onboarding3Title {
    return Intl.message(
      'Stay Informed, Anywhere',
      name: 'onboarding3Title',
      desc: '',
      args: [],
    );
  }

  /// `Access breaking news and save articles. Share and discuss with your community, and dive into a world of knowledge on the go.`
  String get onboarding3Body {
    return Intl.message(
      'Access breaking news and save articles. Share and discuss with your community, and dive into a world of knowledge on the go.',
      name: 'onboarding3Body',
      desc: '',
      args: [],
    );
  }

  /// `Discover Hotest\nNews`
  String get discover {
    return Intl.message(
      'Discover Hotest\nNews',
      name: 'discover',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Delete`
  String get confirmDelete {
    return Intl.message(
      'Confirm Delete',
      name: 'confirmDelete',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete this item ?`
  String get deleteContent {
    return Intl.message(
      'Do you want to delete this item ?',
      name: 'deleteContent',
      desc: '',
      args: [],
    );
  }

  /// `No History`
  String get noHistory {
    return Intl.message(
      'No History',
      name: 'noHistory',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `You don't have a favorite yet!`
  String get noFavorite {
    return Intl.message(
      'You don\'t have a favorite yet!',
      name: 'noFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Search article, topic, writer`
  String get searchHint {
    return Intl.message(
      'Search article, topic, writer',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `Trending topic today`
  String get trend {
    return Intl.message(
      'Trending topic today',
      name: 'trend',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Go To Link`
  String get goToLink {
    return Intl.message(
      'Go To Link',
      name: 'goToLink',
      desc: '',
      args: [],
    );
  }

  /// `By`
  String get by {
    return Intl.message(
      'By',
      name: 'by',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get enLang {
    return Intl.message(
      'English',
      name: 'enLang',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arLang {
    return Intl.message(
      'Arabic',
      name: 'arLang',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Search Result`
  String get searchResult {
    return Intl.message(
      'Search Result',
      name: 'searchResult',
      desc: '',
      args: [],
    );
  }

  /// `Guest`
  String get guest {
    return Intl.message(
      'Guest',
      name: 'guest',
      desc: '',
      args: [],
    );
  }

  /// `Email already exist try sign up with another email.`
  String get emailErrorSignUp {
    return Intl.message(
      'Email already exist try sign up with another email.',
      name: 'emailErrorSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `User name not found!`
  String get userError {
    return Intl.message(
      'User name not found!',
      name: 'userError',
      desc: '',
      args: [],
    );
  }

  /// `Email not found`
  String get emailNotFound {
    return Intl.message(
      'Email not found',
      name: 'emailNotFound',
      desc: '',
      args: [],
    );
  }

  /// `The email or password is not correct`
  String get loginError {
    return Intl.message(
      'The email or password is not correct',
      name: 'loginError',
      desc: '',
      args: [],
    );
  }

  /// `The email or password is not correct`
  String get noUser {
    return Intl.message(
      'The email or password is not correct',
      name: 'noUser',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided for that user.`
  String get wrongPass {
    return Intl.message(
      'Wrong password provided for that user.',
      name: 'wrongPass',
      desc: '',
      args: [],
    );
  }

  /// `You are logout`
  String get loginAlertTitle {
    return Intl.message(
      'You are logout',
      name: 'loginAlertTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please login to add this item to favorite.`
  String get loginAlertText {
    return Intl.message(
      'Please login to add this item to favorite.',
      name: 'loginAlertText',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `OR continue as a`
  String get continueAsGuest {
    return Intl.message(
      'OR continue as a',
      name: 'continueAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `Don't have account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Press back again to exit`
  String get exit {
    return Intl.message(
      'Press back again to exit',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Delete all items`
  String get clear {
    return Intl.message(
      'Delete all items',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `No back history found`
  String get noBack {
    return Intl.message(
      'No back history found',
      name: 'noBack',
      desc: '',
      args: [],
    );
  }

  /// `No forward history found`
  String get noForward {
    return Intl.message(
      'No forward history found',
      name: 'noForward',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get connectionError {
    return Intl.message(
      'Please check your internet connection',
      name: 'connectionError',
      desc: '',
      args: [],
    );
  }

  /// `Confim`
  String get confirm {
    return Intl.message(
      'Confim',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPasssword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPasssword',
      desc: '',
      args: [],
    );
  }

  /// `Password reset link sent to your email!`
  String get passwordReset {
    return Intl.message(
      'Password reset link sent to your email!',
      name: 'passwordReset',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email !`
  String get emailRequired {
    return Intl.message(
      'Please enter a valid email !',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry sometimes people can forget too, enter your email and we will send you a password reset link.`
  String get forgotPasswordDetails {
    return Intl.message(
      'Don\'t worry sometimes people can forget too, enter your email and we will send you a password reset link.',
      name: 'forgotPasswordDetails',
      desc: '',
      args: [],
    );
  }

  /// `Your accoount security is our priority ! we've sent you a secure link to safely change your password and keep your account protected.`
  String get passwordResestDetails {
    return Intl.message(
      'Your accoount security is our priority ! we\'ve sent you a secure link to safely change your password and keep your account protected.',
      name: 'passwordResestDetails',
      desc: '',
      args: [],
    );
  }

  /// `Resend email`
  String get resendEmail {
    return Intl.message(
      'Resend email',
      name: 'resendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password reset email sent check your account.`
  String get checkYourEmail {
    return Intl.message(
      'Password reset email sent check your account.',
      name: 'checkYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Sent`
  String get sent {
    return Intl.message(
      'Sent',
      name: 'sent',
      desc: '',
      args: [],
    );
  }

  /// `Good afternoon`
  String get goodAfternoon {
    return Intl.message(
      'Good afternoon',
      name: 'goodAfternoon',
      desc: '',
      args: [],
    );
  }

  /// `Good evining`
  String get goodEvening {
    return Intl.message(
      'Good evining',
      name: 'goodEvening',
      desc: '',
      args: [],
    );
  }

  /// ` Confirm logout`
  String get confirmLogout {
    return Intl.message(
      ' Confirm logout',
      name: 'confirmLogout',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to logout ?`
  String get logoutDescription {
    return Intl.message(
      'Do you want to logout ?',
      name: 'logoutDescription',
      desc: '',
      args: [],
    );
  }

  /// `Email verfication sent.`
  String get emailVerficationSent {
    return Intl.message(
      'Email verfication sent.',
      name: 'emailVerficationSent',
      desc: '',
      args: [],
    );
  }

  /// `Email verfication sent check your email and click on the link then press done to login.\nif the email not sent to you please press on Resend email.`
  String get emailVerficationDescription {
    return Intl.message(
      'Email verfication sent check your email and click on the link then press done to login.\nif the email not sent to you please press on Resend email.',
      name: 'emailVerficationDescription',
      desc: '',
      args: [],
    );
  }

  /// `You made too many requests within a window of time and have been rate limited. Back off for a while`
  String get errorToManyRequests {
    return Intl.message(
      'You made too many requests within a window of time and have been rate limited. Back off for a while',
      name: 'errorToManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong on our side.`
  String get serverError {
    return Intl.message(
      'Something went wrong on our side.',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Articles 100+`
  String get articleCount {
    return Intl.message(
      'Articles 100+',
      name: 'articleCount',
      desc: '',
      args: [],
    );
  }

  /// `No internet conncetion`
  String get noConnection {
    return Intl.message(
      'No internet conncetion',
      name: 'noConnection',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get userNotFound {
    return Intl.message(
      'User not found',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `The internet conncetion is not stable !`
  String get internetNotStable {
    return Intl.message(
      'The internet conncetion is not stable !',
      name: 'internetNotStable',
      desc: '',
      args: [],
    );
  }

  /// `An Error has occurred, please try again later !`
  String get unKnownError {
    return Intl.message(
      'An Error has occurred, please try again later !',
      name: 'unKnownError',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Create accoount`
  String get createAccount {
    return Intl.message(
      'Create accoount',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Add Product`
  String get addProduct {
    return Intl.message(
      'Add Product',
      name: 'addProduct',
      desc: '',
      args: [],
    );
  }

  /// `Upload Images`
  String get uploadImages {
    return Intl.message(
      'Upload Images',
      name: 'uploadImages',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get productDetails {
    return Intl.message(
      'Product Details',
      name: 'productDetails',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Brand`
  String get brand {
    return Intl.message(
      'Brand',
      name: 'brand',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Sale precentage`
  String get salePrecentage {
    return Intl.message(
      'Sale precentage',
      name: 'salePrecentage',
      desc: '',
      args: [],
    );
  }

  /// `must be less than 100`
  String get salePrecentageError {
    return Intl.message(
      'must be less than 100',
      name: 'salePrecentageError',
      desc: '',
      args: [],
    );
  }

  /// `Price information`
  String get PriceInfo {
    return Intl.message(
      'Price information',
      name: 'PriceInfo',
      desc: '',
      args: [],
    );
  }

  /// `Colors information`
  String get colorsInformation {
    return Intl.message(
      'Colors information',
      name: 'colorsInformation',
      desc: '',
      args: [],
    );
  }

  /// `Add new color`
  String get addNewColor {
    return Intl.message(
      'Add new color',
      name: 'addNewColor',
      desc: '',
      args: [],
    );
  }

  /// `Delete this color`
  String get deleteThisColor {
    return Intl.message(
      'Delete this color',
      name: 'deleteThisColor',
      desc: '',
      args: [],
    );
  }

  /// `Color code`
  String get colorCode {
    return Intl.message(
      'Color code',
      name: 'colorCode',
      desc: '',
      args: [],
    );
  }

  /// `Color name`
  String get colorName {
    return Intl.message(
      'Color name',
      name: 'colorName',
      desc: '',
      args: [],
    );
  }

  /// `Size Informations`
  String get sizeInformations {
    return Intl.message(
      'Size Informations',
      name: 'sizeInformations',
      desc: '',
      args: [],
    );
  }

  /// `Delete This Size`
  String get deleteThisSize {
    return Intl.message(
      'Delete This Size',
      name: 'deleteThisSize',
      desc: '',
      args: [],
    );
  }

  /// `Add New Size`
  String get addNewSize {
    return Intl.message(
      'Add New Size',
      name: 'addNewSize',
      desc: '',
      args: [],
    );
  }

  /// `Uplaod Main Image`
  String get uploadMainImage {
    return Intl.message(
      'Uplaod Main Image',
      name: 'uploadMainImage',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Size Description`
  String get sizeDescription {
    return Intl.message(
      'Size Description',
      name: 'sizeDescription',
      desc: '',
      args: [],
    );
  }

  /// `New Size`
  String get newSize {
    return Intl.message(
      'New Size',
      name: 'newSize',
      desc: '',
      args: [],
    );
  }

  /// `Material Informations`
  String get materialInformations {
    return Intl.message(
      'Material Informations',
      name: 'materialInformations',
      desc: '',
      args: [],
    );
  }

  /// `New Material`
  String get newMaterial {
    return Intl.message(
      'New Material',
      name: 'newMaterial',
      desc: '',
      args: [],
    );
  }

  /// `Add New Material`
  String get addNewMaterial {
    return Intl.message(
      'Add New Material',
      name: 'addNewMaterial',
      desc: '',
      args: [],
    );
  }

  /// `Wash care Instructions`
  String get washCare {
    return Intl.message(
      'Wash care Instructions',
      name: 'washCare',
      desc: '',
      args: [],
    );
  }

  /// `Section`
  String get section {
    return Intl.message(
      'Section',
      name: 'section',
      desc: '',
      args: [],
    );
  }

  /// `Category Informations`
  String get categoryInformations {
    return Intl.message(
      'Category Informations',
      name: 'categoryInformations',
      desc: '',
      args: [],
    );
  }

  /// `Select a section`
  String get selectASection {
    return Intl.message(
      'Select a section',
      name: 'selectASection',
      desc: '',
      args: [],
    );
  }

  /// `T-shirts`
  String get tShirts {
    return Intl.message(
      'T-shirts',
      name: 'tShirts',
      desc: '',
      args: [],
    );
  }

  /// `Oversized t-shirts`
  String get oversizedTshirts {
    return Intl.message(
      'Oversized t-shirts',
      name: 'oversizedTshirts',
      desc: '',
      args: [],
    );
  }

  /// `Long sleeve t-shirts`
  String get longSleeveTshirts {
    return Intl.message(
      'Long sleeve t-shirts',
      name: 'longSleeveTshirts',
      desc: '',
      args: [],
    );
  }

  /// `Hoodies`
  String get hoodies {
    return Intl.message(
      'Hoodies',
      name: 'hoodies',
      desc: '',
      args: [],
    );
  }

  /// `Sweatshirts`
  String get sweatshirts {
    return Intl.message(
      'Sweatshirts',
      name: 'sweatshirts',
      desc: '',
      args: [],
    );
  }

  /// `Oversized hoodies`
  String get oversizedHoodies {
    return Intl.message(
      'Oversized hoodies',
      name: 'oversizedHoodies',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Select a gender`
  String get selectAGender {
    return Intl.message(
      'Select a gender',
      name: 'selectAGender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Unisex`
  String get uniSex {
    return Intl.message(
      'Unisex',
      name: 'uniSex',
      desc: '',
      args: [],
    );
  }

  /// `Add new section`
  String get addNewSection {
    return Intl.message(
      'Add new section',
      name: 'addNewSection',
      desc: '',
      args: [],
    );
  }

  /// `New section`
  String get newSection {
    return Intl.message(
      'New section',
      name: 'newSection',
      desc: '',
      args: [],
    );
  }

  /// `Upload size image`
  String get uploadSizeImage {
    return Intl.message(
      'Upload size image',
      name: 'uploadSizeImage',
      desc: '',
      args: [],
    );
  }

  /// `Pick images`
  String get pickImages {
    return Intl.message(
      'Pick images',
      name: 'pickImages',
      desc: '',
      args: [],
    );
  }

  /// `In stock informations`
  String get inStock {
    return Intl.message(
      'In stock informations',
      name: 'inStock',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Product added successfully`
  String get productAddedSuccessfully {
    return Intl.message(
      'Product added successfully',
      name: 'productAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Stock`
  String get stock {
    return Intl.message(
      'Stock',
      name: 'stock',
      desc: '',
      args: [],
    );
  }

  /// `No brands found`
  String get noBrandsFound {
    return Intl.message(
      'No brands found',
      name: 'noBrandsFound',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get sNew {
    return Intl.message(
      'New',
      name: 'sNew',
      desc: '',
      args: [],
    );
  }

  /// `Sold out`
  String get soldOut {
    return Intl.message(
      'Sold out',
      name: 'soldOut',
      desc: '',
      args: [],
    );
  }

  /// `Material`
  String get material {
    return Intl.message(
      'Material',
      name: 'material',
      desc: '',
      args: [],
    );
  }

  /// `Suitable for`
  String get suitableFor {
    return Intl.message(
      'Suitable for',
      name: 'suitableFor',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `No products found`
  String get noProductsFound {
    return Intl.message(
      'No products found',
      name: 'noProductsFound',
      desc: '',
      args: [],
    );
  }

  /// `Search on products`
  String get searchOnProducts {
    return Intl.message(
      'Search on products',
      name: 'searchOnProducts',
      desc: '',
      args: [],
    );
  }

  /// `Edit product`
  String get editProduct {
    return Intl.message(
      'Edit product',
      name: 'editProduct',
      desc: '',
      args: [],
    );
  }

  /// `The main color`
  String get mainColor {
    return Intl.message(
      'The main color',
      name: 'mainColor',
      desc: '',
      args: [],
    );
  }

  /// `Save product`
  String get saveProduct {
    return Intl.message(
      'Save product',
      name: 'saveProduct',
      desc: '',
      args: [],
    );
  }

  /// `Saved successfully`
  String get savedSuccessfully {
    return Intl.message(
      'Saved successfully',
      name: 'savedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete this product`
  String get deleteProduct {
    return Intl.message(
      'Are you sure to delete this product',
      name: 'deleteProduct',
      desc: '',
      args: [],
    );
  }

  /// `Delete Brand`
  String get deleteBrand {
    return Intl.message(
      'Delete Brand',
      name: 'deleteBrand',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete`
  String get deleteBrandConfirmation {
    return Intl.message(
      'Are you sure to delete',
      name: 'deleteBrandConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Coupons`
  String get coupons {
    return Intl.message(
      'Coupons',
      name: 'coupons',
      desc: '',
      args: [],
    );
  }

  /// `Published date`
  String get publishedDate {
    return Intl.message(
      'Published date',
      name: 'publishedDate',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message(
      'Duration',
      name: 'duration',
      desc: '',
      args: [],
    );
  }

  /// `Remaining time`
  String get remainingTime {
    return Intl.message(
      'Remaining time',
      name: 'remainingTime',
      desc: '',
      args: [],
    );
  }

  /// `Start date`
  String get startAt {
    return Intl.message(
      'Start date',
      name: 'startAt',
      desc: '',
      args: [],
    );
  }

  /// `Expired date`
  String get expiredAt {
    return Intl.message(
      'Expired date',
      name: 'expiredAt',
      desc: '',
      args: [],
    );
  }

  /// `Add new coupon`
  String get addNewCoupon {
    return Intl.message(
      'Add new coupon',
      name: 'addNewCoupon',
      desc: '',
      args: [],
    );
  }

  /// `Coupon code`
  String get couponCode {
    return Intl.message(
      'Coupon code',
      name: 'couponCode',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get describtion {
    return Intl.message(
      'Description',
      name: 'describtion',
      desc: '',
      args: [],
    );
  }

  /// `No coupons found`
  String get no_coupons_found {
    return Intl.message(
      'No coupons found',
      name: 'no_coupons_found',
      desc: '',
      args: [],
    );
  }

  /// `Off`
  String get off {
    return Intl.message(
      'Off',
      name: 'off',
      desc: '',
      args: [],
    );
  }

  /// `Comming soon`
  String get futureCoupon {
    return Intl.message(
      'Comming soon',
      name: 'futureCoupon',
      desc: '',
      args: [],
    );
  }

  /// `Finished`
  String get finished {
    return Intl.message(
      'Finished',
      name: 'finished',
      desc: '',
      args: [],
    );
  }

  /// `Sart time`
  String get startTime {
    return Intl.message(
      'Sart time',
      name: 'startTime',
      desc: '',
      args: [],
    );
  }

  /// `Expired time`
  String get expiredTime {
    return Intl.message(
      'Expired time',
      name: 'expiredTime',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get size {
    return Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get color {
    return Intl.message(
      'Color',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Customer name`
  String get customer {
    return Intl.message(
      'Customer name',
      name: 'customer',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Total items`
  String get totalItems {
    return Intl.message(
      'Total items',
      name: 'totalItems',
      desc: '',
      args: [],
    );
  }

  /// `Total amount`
  String get totalAmount {
    return Intl.message(
      'Total amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `View details`
  String get viewDetails {
    return Intl.message(
      'View details',
      name: 'viewDetails',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get currency {
    return Intl.message(
      'EGP',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get orderDetails {
    return Intl.message(
      'Order Details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Tracking number`
  String get trackingNumber {
    return Intl.message(
      'Tracking number',
      name: 'trackingNumber',
      desc: '',
      args: [],
    );
  }

  /// `Order informations`
  String get orderInformations {
    return Intl.message(
      'Order informations',
      name: 'orderInformations',
      desc: '',
      args: [],
    );
  }

  /// `Shipping address`
  String get shippingAddress {
    return Intl.message(
      'Shipping address',
      name: 'shippingAddress',
      desc: '',
      args: [],
    );
  }

  /// `Payment method`
  String get paymentMethod {
    return Intl.message(
      'Payment method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Delivery method`
  String get deliveryMethod {
    return Intl.message(
      'Delivery method',
      name: 'deliveryMethod',
      desc: '',
      args: [],
    );
  }

  /// `Disount`
  String get disount {
    return Intl.message(
      'Disount',
      name: 'disount',
      desc: '',
      args: [],
    );
  }

  /// `User informations`
  String get userInformations {
    return Intl.message(
      'User informations',
      name: 'userInformations',
      desc: '',
      args: [],
    );
  }

  /// `Items`
  String get items {
    return Intl.message(
      'Items',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Processing`
  String get processing {
    return Intl.message(
      'Processing',
      name: 'processing',
      desc: '',
      args: [],
    );
  }

  /// `Shipped`
  String get shipped {
    return Intl.message(
      'Shipped',
      name: 'shipped',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get delivered {
    return Intl.message(
      'Delivered',
      name: 'delivered',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `No orders found`
  String get noOrdersFound {
    return Intl.message(
      'No orders found',
      name: 'noOrdersFound',
      desc: '',
      args: [],
    );
  }

  /// `Returned`
  String get returned {
    return Intl.message(
      'Returned',
      name: 'returned',
      desc: '',
      args: [],
    );
  }

  /// `Delivery amount`
  String get deliveryAmount {
    return Intl.message(
      'Delivery amount',
      name: 'deliveryAmount',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Recommended\nfor you`
  String get recommendedForYou {
    return Intl.message(
      'Recommended\nfor you',
      name: 'recommendedForYou',
      desc: '',
      args: [],
    );
  }

  /// `Uplaod category image`
  String get uplaodCategoryImage {
    return Intl.message(
      'Uplaod category image',
      name: 'uplaodCategoryImage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

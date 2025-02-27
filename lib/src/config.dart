import 'dart:math';

import 'package:emoji_picker_flutter/src/category_icons.dart';
import 'package:emoji_picker_flutter/src/emoji_picker.dart';
import 'package:flutter/material.dart';

/// Config for customizations
class Config {
  /// Constructor
  const Config(
      {this.columns = 7,
      this.emojiSizeMax = 32.0,
      this.verticalSpacing = 0,
      this.horizontalSpacing = 0,
      this.initCategory = Category.RECENT,
      this.bgColor = const Color(0xFFEBEFF2),
      this.indicatorColor = Colors.blue,
      this.iconColor = Colors.grey,
      this.iconColorSelected = Colors.blue,
      this.progressIndicatorColor = Colors.blue,
      this.backspaceColor = Colors.blue,
      this.showRecentsTab = true,
      this.recentsLimit = 28,
      this.noRecentsText = 'No Recents',
      this.noRecentsStyle =
          const TextStyle(fontSize: 20, color: Colors.black26),
      this.categoryIcons = const CategoryIcons(),
      this.buttonMode = ButtonMode.MATERIAL});

  /// Number of emojis per row
  final int columns;

  /// Width and height the emoji will be maximal displayed
  /// Can be smaller due to screen size and amount of columns
  final double emojiSizeMax;

  /// Vertical spacing between emojis
  final double verticalSpacing;

  /// Horizontal spacing between emojis
  final double horizontalSpacing;

  /// The initial [Category] that will be selected
  /// This [Category] will have its button in the bottombar darkened
  final Category initCategory;

  /// The background color of the Widget
  final Color bgColor;

  /// The color of the category indicator
  final Color indicatorColor;

  /// The color of the category icons
  final Color iconColor;

  /// The color of the category icon when selected
  final Color iconColorSelected;

  /// The color of the loading indicator during initalization
  final Color progressIndicatorColor;

  /// The color of the backspace icon button
  final Color backspaceColor;

  /// Show extra tab with recently used emoji
  final bool showRecentsTab;

  /// Limit of recently used emoji that will be saved
  final int recentsLimit;

  /// The text to be displayed if no recent emojis to display
  final String noRecentsText;

  /// The text style for [noRecentsText]
  final TextStyle noRecentsStyle;

  /// Determines the icon to display for each [Category]
  final CategoryIcons categoryIcons;

  /// Change between Material and Cupertino button style
  final ButtonMode buttonMode;

  /// Get Emoji size based on properties and screen width
  double getEmojiSize(double width) {
    final maxSize = width / columns;
    return min(maxSize, emojiSizeMax);
  }

  /// Returns the icon for the category
  IconData getIconForCategory(Category category) {
    switch (category) {
      case Category.RECENT:
        return categoryIcons.recentIcon;
      case Category.SMILEYS:
        return categoryIcons.smileyIcon;
      case Category.ANIMALS:
        return categoryIcons.animalIcon;
      case Category.FOODS:
        return categoryIcons.foodIcon;
      case Category.TRAVEL:
        return categoryIcons.travelIcon;
      case Category.ACTIVITIES:
        return categoryIcons.activityIcon;
      case Category.OBJECTS:
        return categoryIcons.objectIcon;
      case Category.SYMBOLS:
        return categoryIcons.symbolIcon;
      case Category.FLAGS:
        return categoryIcons.flagIcon;
      default:
        throw Exception('Unsupported Category');
    }
  }
}

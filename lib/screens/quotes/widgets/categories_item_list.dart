import 'package:flutter/material.dart';

class CategoryItem {
  final String? category_Name;
  final String? img_link;
  final String? screen_link;

    CategoryItem({this.category_Name, this.img_link, this.screen_link});
}

List<Color> colors = [
  Colors.amber,
  Colors.green,
  Colors.pink,
  Colors.cyan,
  Colors.deepOrange,
  Colors.purple,
  Colors.teal,
  Colors.lightBlue,
  Colors.deepOrange,
  Colors.teal,
];
List<CategoryItem> categoryList = [
  CategoryItem(
    category_Name: 'Love',
    screen_link: 'https://www.goodreads.com/quotes/tag/love?page=',
    img_link: 'love.png',
  ),
  CategoryItem(
      category_Name: 'Life',
      screen_link: 'https://www.goodreads.com/quotes/tag/life?page=',
      img_link: 'life.png'),
  CategoryItem(
      category_Name: 'Inspirational',
      screen_link: 'https://www.goodreads.com/quotes/tag/inspirational?page=',
      img_link: 'Inspirational.png'),
  CategoryItem(
      category_Name: 'Humor',
      screen_link: 'https://www.goodreads.com/quotes/tag/humor?page=',
      img_link: 'Humor.png'),
  CategoryItem(
      category_Name: 'Philosophy',
      screen_link: 'https://www.goodreads.com/quotes/tag/philosophy?page=',
      img_link: 'Philosophy.png'),
  CategoryItem(
      category_Name: 'God',
      screen_link: 'https://www.goodreads.com/quotes/tag/god?page=',
      img_link: 'God.png'),
  CategoryItem(
      category_Name: 'Truth',
      screen_link: 'https://www.goodreads.com/quotes/tag/truth?page=',
      img_link: 'Truth.png'),
  CategoryItem(
      category_Name: 'Wisdom',
      screen_link: 'https://www.goodreads.com/quotes/tag/wisdom?page=',
      img_link: 'wisdom.png'),
  CategoryItem(
      category_Name: 'Romance',
      screen_link: 'https://www.goodreads.com/quotes/tag/romance?page=',
      img_link: 'Romance.png'),
  CategoryItem(
      category_Name: 'Poetry',
      screen_link: 'https://www.goodreads.com/quotes/tag/poetry?page=',
      img_link: 'Poetry.png'),
  CategoryItem(
      category_Name: 'Death',
      screen_link: 'https://www.goodreads.com/quotes/tag/death?page=',
      img_link: 'Death.png'),
  CategoryItem(
      category_Name: 'Happiness',
      screen_link: 'https://www.goodreads.com/quotes/tag/happiness?page=',
      img_link: 'Happiness.png'),
  CategoryItem(
      category_Name: 'Hope',
      screen_link: 'https://www.goodreads.com/quotes/tag/hope?page=',
      img_link: 'Hope.png'),
  CategoryItem(
      category_Name: 'Faith',
      screen_link: 'https://www.goodreads.com/quotes/tag/faith?page=',
      img_link: 'Faith.png'),
  CategoryItem(
      category_Name: 'Inspiration',
      screen_link: 'https://www.goodreads.com/quotes/tag/inspiration?page=',
      img_link: 'Inspiration.png'),
  CategoryItem(
      category_Name: 'Writing',
      screen_link: 'https://www.goodreads.com/quotes/tag/writing?page=',
      img_link: 'Writing.png'),
  CategoryItem(
      category_Name: 'Quotes',
      screen_link: 'https://www.goodreads.com/quotes/tag/quotes?page=',
      img_link: 'Quotes.png'),
  CategoryItem(
      category_Name: 'Religion',
      screen_link: 'https://www.goodreads.com/quotes/tag/religion?page=',
      img_link: 'Religion.png'),
  CategoryItem(
      category_Name: 'Life Lessons',
      screen_link: 'https://www.goodreads.com/quotes/tag/life-lessons?page=',
      img_link: 'Life Lessons.png'),
  CategoryItem(
      category_Name: 'Success',
      screen_link: 'https://www.goodreads.com/quotes/tag/success?page=',
      img_link: 'Success.png'),
  CategoryItem(
      category_Name: 'Motivational',
      screen_link: 'https://www.goodreads.com/quotes/tag/motivational?page=',
      img_link: 'Motivational.png'),
  CategoryItem(
      category_Name: 'Relationships',
      screen_link: 'https://www.goodreads.com/quotes/tag/relationships?page=',
      img_link: 'Relationships.png'),
  CategoryItem(
      category_Name: 'Time',
      screen_link: 'https://www.goodreads.com/quotes/tag/time?page=',
      img_link: 'Time.png'),
  CategoryItem(
      category_Name: 'Knowledge',
      screen_link: 'https://www.goodreads.com/quotes/tag/knowledge?page=',
      img_link: 'Knowledge.png'),
  CategoryItem(
      category_Name: 'Love Quotes',
      screen_link: 'https://www.goodreads.com/quotes/tag/love-quotes?page=',
      img_link: 'Love Quotes.png'),
  CategoryItem(
      category_Name: 'Spirituality',
      screen_link: 'https://www.goodreads.com/quotes/tag/spirituality?page=',
      img_link: 'Spirituality.png'),
  CategoryItem(
      category_Name: 'Science',
      screen_link: 'https://www.goodreads.com/quotes/tag/science?page=',
      img_link: 'Science.png'),
  CategoryItem(
      category_Name: 'Life Quotes',
      screen_link: 'https://www.goodreads.com/quotes/tag/life-quotes?page=',
      img_link: 'Life Quotes.png'),
  CategoryItem(
      category_Name: 'Books',
      screen_link: 'https://www.goodreads.com/quotes/tag/books?page=',
      img_link: 'Books.png'),
];

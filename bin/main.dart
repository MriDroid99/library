import 'book.dart';
import 'dart:io';

void main(List<String> arguments) {
  var book = Books();
  loop:
  while (true) {
    print('************************');
    print('1. Add Book');
    print('2. Remove Book');
    print('3. Find Books With Category');
    print('4. Last Books Added');
    print('5. Exit');
    print('************************');
    var op = inputUser();

    switch (op) {
      case '1':
        print('Enter Book Data as: id, name, category, author, publish date');
        print(
            'Hint1: Category one of (1. Scientific, 2. Tragedy, 3. Literary, 4. Drama, 5. ScienceFiction)');
        print('Hint2: Date Format as: 2020-02-27');
        var bookData = inputUser().split(', ');
        var cat = getCategory(bookData[2]);
        book.addBook(
          id: bookData[0],
          name: bookData[1],
          category: cat,
          author: bookData[3],
          publishDate: DateTime.parse(
            bookData[4],
          ),
        );
        break;
      case '2':
        print('Enter Book ID');
        var id = inputUser();
        book.removeBook(id);
        break;
      case '3':
        print('Enter Category');
        print(
            'Hint1: Category one of (1. Scientific, 2. Tragedy, 3. Literary, 4. Drama, 5. ScienceFiction)');
        var cat = inputUser();
        var books = book.findCategory(getCategory(cat));
        books.forEach((book) => print(book.name));
        break;
      case '4':
        print('Enter Date as: 2020-02-27');
        var date = inputUser();
        var books = book.newBooks(date);
        books.forEach((book) => print(book.name));
        break;
      case '5':
        break loop;
      default:
        print('Enter Valid Operation');
    }
  }
}

String inputUser() => stdin.readLineSync()!;

Category getCategory(String category) {
  switch (category) {
    case '1':
      return Category.Scientific;
    case '2':
      return Category.Tragedy;
    case '3':
      return Category.Literary;
    case '4':
      return Category.Drama;
    case '5':
      return Category.ScienceFiction;
    default:
      return Category.NON;
  }
}

enum Category { Scientific, Tragedy, Literary, Drama, ScienceFiction, NON }

class Book {
  String id, name, author;
  Category category;
  DateTime publishDate;

  Book({
    required this.id,
    required this.name,
    required this.category,
    required this.author,
    required this.publishDate,
  });

  void bookData() {
    print(
        'Book Name is: $name, its Category is: $category, Written By: $author, Published in: $publishDate');
  }
}

class Books {
  // Private Attribute
  final List<Book> _books = [];

  void addBook(
          {required String id,
          required String name,
          required Category category,
          required String author,
          required DateTime publishDate}) =>
      _books.add(
        Book(
          id: id,
          name: name,
          category: category,
          author: author,
          publishDate: publishDate,
        ),
      );

  void removeBook(String id) => _books.removeWhere((book) => book.id == id);

  List<Book> findCategory(Category category) => _books
      .where((bookParameter) => bookParameter.category == category)
      .toList();

  List<Book> newBooks(String date) => _books
      .where((bookParameter) =>
          bookParameter.publishDate.isAfter(DateTime.parse(date)))
      .toList();

  void bookData(String id) =>
      _books.firstWhere((book) => book.id == id).bookData();
}
// [1, 2, 3];  => List<int>
// Book => id, name, category, author, publishDate 

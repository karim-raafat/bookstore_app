class Book {
  int bookID;
  String title;
  String author;
  String imageURl;
  String description;
  double price;
  double discount;
  Genre genre;
  bool wishList = false;

  Book(
      {
        required this.bookID,
        required this.title,
      required this.author,
      required this.imageURl,
      required this.description,
      required this.price,
      required this.discount,
      required this.genre});
}

enum Genre {
  horror,
  adventure,
  drama,
  romance,
  sciFi,
  science,
}

String toString(Genre genre){
  switch (genre){
    case Genre.horror : return 'Horror';
    case Genre.adventure : return 'Adventure';
    case Genre.drama : return 'Drama';
    case Genre.romance : return 'Romance';
    case Genre.sciFi : return 'Sci-Fi';
    default : return 'Science';
  }
}
Genre toGenre (String genre){
  switch (genre){
    case 'Horror' : return Genre.horror;
    case 'Adventure' : return Genre.adventure;
    case 'Drama' : return Genre.drama;
    case 'Romance' : return Genre.romance;
    case 'Sci-Fi' : return Genre.sciFi;
    default : return Genre.science;
  }
}
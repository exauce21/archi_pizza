class Recette{
  String id;
  String title;
  String user;
  String imageUrl;
  String description;
  bool  isFavorite;
  int favoriteCount;
  double prix;

  Recette(
      this.id,
      this.title,
      this.user,
      this.imageUrl,
      this.description,
      this.isFavorite,
      this.favoriteCount,
      this.prix,
      );
}
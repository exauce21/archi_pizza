class Recette{
  String id;
  String title;
  String user;
  String imageUrl;
  String description;
  bool  isFavorite;
  int favoriteCount;
  double prix;
  List<String> images;
  String duree;
  double note;
  int? reduction; // en %, null si pas de promo
  String categorie;

  Recette(
      this.id,
      this.title,
      this.user,
      this.imageUrl,
      this.description,
      this.isFavorite,
      this.favoriteCount,
      this.prix,
      this.images,
      this.duree,
      this.note,
      this.reduction,
      this.categorie,
      );
}
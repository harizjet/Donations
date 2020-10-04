
class Promo{
  Promo ({
    this.bannerUrl,
    this.posterUrl,
    this.title,
   // this.rating,
   // this.starRating,
    this.categories,
    this.promodetails,
    this.photoUrls,
    //this.actors,
  });

  final String bannerUrl;
  final String posterUrl;
  final String title;
  //final double rating;
  //final int starRating;
  final List<String> categories;
  final String promodetails;
  final List<String> photoUrls;
  //final List<Actor> actors;
}
//Class

// class Actor {
//   Actor({
//     this.name,
//     this.avatarUrl,
//   });

//   final String name;
//   final String avatarUrl;
// }
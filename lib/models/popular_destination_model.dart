class PopularDestinationModel {
  String nama;
  String daerah;
  String image;

  PopularDestinationModel(this.nama, this.daerah, this.image);
}

List<PopularDestinationModel> populars = popularsData
    .map((item) => PopularDestinationModel(item['nama'] as String,
        item['daerah'] as String, item['image'] as String))
    .toList();

var popularsData = [
  {
    "nama": "Pantai Tanjung Bira",
    "daerah": "Bira",
    "image": "assets/images/Tjbira.jpg"
  },
  {
    "nama": "Taman Nasional Bantimurung",
    "daerah": "Gunung Bulusaraung",
    "image": "assets/images/Bantimurang.jpg"
  },
  {
    "nama": "Gunung latimojong",
    "daerah": "Kabupaten Enrekang",
    "image": "assets/images/latimojong.jpg"
  },
];

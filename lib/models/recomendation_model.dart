class RecommendedModel {
  String id;
  String name;
  String image;

  RecommendedModel(this.id, this.name, this.image);
}

List<RecommendedModel> recommendations = recommendationsData
    .map((item) => RecommendedModel(item['id'].toString(),
        item['name'].toString(), item['image'].toString()))
    .toList();

var recommendationsData = [
  {
    "id": "1",
    "name": "Makassar",
    "image":
        "https://images.unsplash.com/photo-1563244495-1de93ffe7c23?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bWFrYXNzYXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"
  },
  {
    "id": "2",
    "name": "Tana Toraja",
    "image":
        "https://images.unsplash.com/photo-1582426007790-f5a2e2392dd3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"
  },
  {
    "id": "3",
    "name": "Bulukumba",
    "image":
        "https://www.celebes.co/wp-content/uploads/2020/12/Daya-Tarik-Pantai-Panrang-Luhu-.jpg"
  },
  {
    "id": "4",
    "name": "Parepare",
    "image":
        "https://www.celebes.co/wp-content/uploads/2020/05/Pantai-Paputo-Parepare.jpg"
  },
  {
    "id": "5",
    "name": "Kab Maros",
    "image":
        "https://www.celebes.co/wp-content/uploads/2020/10/Air-Terjun-Pung-Bunga-Bontosomba.jpg"
  },
  {
    "id": "6",
    "name": "Jeneponto",
    "image":
        "https://www.celebes.co/wp-content/uploads/2020/10/Batu-Karst-Pundo-Siping.jpg"
  },
  {
    "id": "7",
    "name": "Pangkajene",
    "image":
        "https://www.celebes.co/wp-content/uploads/2021/09/Pulau-Cangke-Pangkep.jpg"
  },
  {
    "id": "8",
    "name": "Kab Bone",
    "image":
        "https://www.celebes.co/wp-content/uploads/2021/04/Pantai-Olele-Bone-Bolango.jpg"
  },
];

import 'package:flutter_icons/flutter_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<List<Map<String, dynamic>>> fetchTilesData(String category) async {
  List<Map<String, dynamic>> tilesData = [];

  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('Titles').get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
        querySnapshot.docs;

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in documents) {
      String title = doc.data()['title'];
      List<String> categories = List<String>.from(doc.data()['categories']);

      // Check if the document belongs to the specified category
      if (categories.contains(category)) {
        // Fetch image from Firebase Storage
        String imagePath = 'images/$title';
        Reference imageRef;
        String imageUrl;

        // Specify the image format based on allowed formats (jpeg, png, webp)
        try {
          imageRef = FirebaseStorage.instance.ref('$imagePath.jpeg');
          imageUrl = await imageRef.getDownloadURL();
        } catch (e) {
          try {
            imageRef = FirebaseStorage.instance.ref('$imagePath.png');
            imageUrl = await imageRef.getDownloadURL();
          } catch (e) {
            try {
              imageRef = FirebaseStorage.instance.ref('$imagePath.webp');
              imageUrl = await imageRef.getDownloadURL();
            } catch (e) {
              print('Error fetching image: $e');
              imageUrl = '';
            }
          }
        }

        Map<String, dynamic> tileData = {
          'title': title,
          'imageUrl': imageUrl,
        };
        tilesData.add(tileData);
      }
    }

    return tilesData;
  } catch (e) {
    print('Error fetching tiles data: $e');
    return [];
  }
}

List<Map<String, dynamic>> myListData = [];
List<Map<String, dynamic>> animeData = [];
List<Map<String, dynamic>> popularListData = [];
List<Map<String, dynamic>> trendingListData = [];
List<Map<String, dynamic>> moviesData = [];

Future<void> fetchData() async {
  // await Future.wait([
  //   fetchTilesData('MyList').then((data) => myListData = data),
  //   fetchTilesData('Anime').then((data) => animeData = data),
  //   fetchTilesData('Popular On Netflix').then((data) => popularListData = data),
  //   fetchTilesData('Trending Now').then((data) => trendingListData = data),
  //   fetchTilesData('Movies').then((data) => moviesData = data),
  // ]);
  myListData = await fetchTilesData('My List');
  animeData = await fetchTilesData('Anime');
  popularListData = await fetchTilesData('Popular On Netflix');
  trendingListData = await fetchTilesData('Trending Now');
  moviesData = await fetchTilesData('Movies');
  print("MyLIST");
  print(myListData);
}

List nvbar = [
  {"icon": AntDesign.home, "text": "Home"},
  {"icon": AntDesign.download, "text": "Downloads"},
];
const List mylist = [
  {"img": "assets/images/img1.png"},
  {"img": "assets/images/img21.jpeg"},
  {"img": "assets/images/img25.jpeg"},
  {"img": "assets/images/img5.png"},
  {"img": "assets/images/img18.png"},
];

const List popularList = [
  {"img": "assets/images/img_5.png"},
  {"img": "assets/images/img_6.png"},
  {"img": "assets/images/img_7.png"},
  {"img": "assets/images/img2.png"},
  {"img": "assets/images/img_8.png"},
];

const List trendingList = [
  {"img": "assets/images/img15.png"},
  {"img": "assets/images/img19.png"},
  {"img": "assets/images/img14.png"},
  {"img": "assets/images/img16.png"},
  {"img": "assets/images/img_9.png"},
];

const List originalList = [
  {"img": "assets/images/img_13.png"},
  {"img": "assets/images/img_14.png"},
  {"img": "assets/images/img_15.png"},
  {"img": "assets/images/img_16.png"},
];
const List animeList = [
  {"img": "assets/images/img_17.png"},
  {"img": "assets/images/img23.jpeg"},
  {"img": "assets/images/img22.jpeg"},
  {"img": "assets/images/img_18.png"},
  {"img": "assets/images/img_19.png"},
];

const List movies = [
  {"img": "assets/images/img31.jpeg"},
  {"img": "assets/images/img32.jpeg"},
  {"img": "assets/images/img33.jpeg"},
  {"img": "assets/images/img34.jpeg"},
  {"img": "assets/images/img35.jpeg"},
  {"img": "assets/images/img30.jpeg"},
];

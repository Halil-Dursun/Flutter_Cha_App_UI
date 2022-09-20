class User {
  final String id;
  final String name;
  final String surname;
  final String imageUrl;

  const User(
      {required this.id,
      required this.name,
      required this.surname,
      required this.imageUrl});

  static const List<User> users = [
    User(
        id: "1",
        name: "Max",
        surname: "Table",
        imageUrl:
            "https://cdn.pixabay.com/photo/2017/08/30/12/45/girl-2696947__340.jpg"),
    User(
        id: "2",
        name: "Ahmet",
        surname: "Bıçak",
        imageUrl:
            "https://cdn.pixabay.com/photo/2017/06/10/22/58/composing-2391033__340.jpg"),
    User(
        id: "3",
        name: "Adriana",
        surname: "Glasses",
        imageUrl:
            "https://cdn.pixabay.com/photo/2020/09/18/21/12/person-5582976__340.jpg"),
    User(
        id: "4",
        name: "Cristiano",
        surname: "Ronaldo",
        imageUrl:
            "https://cdn.pixabay.com/photo/2015/07/20/12/57/ambassador-852766__340.jpg"),
    User(
        id: "5",
        name: "Brad",
        surname: "Pitt",
        imageUrl:
            "https://cdn.pixabay.com/photo/2015/01/07/20/53/hat-591973__340.jpg"),
    User(
        id: "6",
        name: "Michael",
        surname: "Jordan",
        imageUrl:
            "https://cdn.pixabay.com/photo/2017/12/31/15/56/portrait-3052641__340.jpg"),
  ];
}

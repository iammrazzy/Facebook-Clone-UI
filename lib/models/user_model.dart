class UserModel {
  int id, like;
  String name;
  String image;
  String coverImage;
  String decs;
  String bios;
  String palce;
  String home;
  String marryStatus;
  String join;
  String follower;
  String firstHobby;
  String secondHobby;
  String mes;
  String date;
  bool isLiked;

  UserModel({
    required this.id,
    required this.name,
    required this.image,
    required this.coverImage,
    required this.decs,
    required this.bios,
    required this.palce,
    required this.home,
    required this.marryStatus,
    required this.join,
    required this.follower,
    required this.firstHobby,
    required this.secondHobby,
    required this.mes,
    required this.date,
    required this.isLiked,
    required this.like,
  });
}

// List<UserModel> allUsers =[...];
List<UserModel> allUsers = [
  UserModel(
    id: 1010,
    name: 'រ៉ា',
    image: 'images/Razz.jpg',
    coverImage: 'images/Coding.jpg',
    decs: 'Clone facebook UI using Flutter...!',
    bios: 'Stay cool | Be happy',
    home: 'Lives in Phnom Penh',
    palce: 'From Phnom Srouch',
    marryStatus: 'Single but not available',
    join: 'Joined April 2019',
    follower: 'Follwed by 425 people',
    firstHobby: 'Coding',
    secondHobby: 'Researching',
    mes: 'Sent a photo',
    date: '10:00 pm',
    isLiked: false,
    like: 250,
  ),
  UserModel(
    id: 1010,
    name: 'មករា',
    image: 'images/Makara.jpg',
    coverImage: 'images/Politic.jpg',
    decs: 'Pray for respect...!',
    bios: 'Wipe your tear continue your journy!',
    home: 'Lives in Phnom Penh',
    palce: 'From Kampot',
    marryStatus: 'Single',
    join: 'Joined April 2017',
    follower: 'Follwed by 500 people',
    firstHobby: 'Reading',
    secondHobby: 'Listening to music',
    mes: 'Sent a sticker',
    date: '8:00 pm',
    isLiked: false,
    like: 300,
  ),
  UserModel(
    id: 1010,
    name: 'ណេត',
    image: 'images/Neth.jpg',
    coverImage: 'images/Photographer.jpg',
    decs: 'Testing Canon 90D | 60 mm!',
    bios: 'Travell around the world!',
    home: 'Lives in Phnom Penh',
    palce: 'From Phnom Srouch',
    marryStatus: 'Single',
    join: 'Joined May 2018',
    follower: 'Follwed by 480 people',
    firstHobby: 'Travelling',
    secondHobby: 'Landscape capture',
    mes: 'Sent a voice',
    date: '11:00 pm',
    isLiked: false,
    like: 180,
  ),
  UserModel(
      id: 1010,
      name: 'ឃៀម',
      image: 'images/Kheam.jpg',
      coverImage: 'images/Lawyer.jpg',
      decs: 'Testing Macbook pro M2 2023!',
      bios: 'Lawyer | New Generation',
      home: 'Lives in Phnom Penh',
      palce: 'From Oral',
      marryStatus: 'Single',
      join: 'Joined February 2017',
      follower: 'Follwed by 880 people',
      firstHobby: 'Gaming',
      secondHobby: 'learning',
      mes: 'Sent a video',
      date: '5:00 pm',
      isLiked: false,
      like: 500),
  UserModel(
      id: 1010,
      name: 'មាស',
      image: 'images/Meas.jpg',
      coverImage: 'images/Teacher.jpg',
      decs: 'Testing Motobyte Dream 2023!',
      bios: 'Knowledge is power!',
      home: 'Lives in Phnom Penh',
      palce: 'From Samrong Tong',
      marryStatus: 'in Realtionship with Beer',
      join: 'Joined December 2021',
      follower: 'Follwed by 390 people',
      firstHobby: 'Travelling',
      secondHobby: 'Drinking',
      mes: 'Pin a message',
      date: '2:00 am',
      isLiked: false,
      like: 345),
];

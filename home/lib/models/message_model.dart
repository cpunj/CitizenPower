class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;

  final bool unread;
  final bool read;

  Message({
    this.sender,
    this.time,
    this.text,
    this.unread,
    this.read,
  });
}

class User {
  final int id;
  final String name;
  final String imageUrl;

  User({
    this.id,
    this.name,
    this.imageUrl,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/Wilkie.jpeg',
);

// USERS
final User ejaz = User(
  id: 1,
  name: 'Ejaz Ahmed',
  imageUrl: "assets/grace.jpg",
);
final User jack = User(
  id: 2,
  name: 'Jack ',
  imageUrl: 'assets/Wilkie.jpeg',
);
final User harry = User(
  id: 3,
  name: 'Harrison',
  imageUrl: 'assets/Wilkie.jpeg',
);
final User salman = User(
  id: 4,
  name: 'Salman',
  imageUrl: 'assets/Wilkie.jpeg',
);
final User chandan = User(
  id: 5,
  name: 'Chandan',
  imageUrl: 'assets/Wilkie.jpeg',
);
final User khern = User(
  id: 6,
  name: 'Khern',
  imageUrl: 'assets/Wilkie.jpeg',
);
final User jenny = User(
  id: 7,
  name: 'Jenny',
  imageUrl: 'assets/Wilkie.jpeg',
);

// FAVORITE CONTACTS
List<User> favorites = [ejaz, jack, harry, salman, chandan, khern, jenny];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: ejaz,
    time: '5:30 PM',
    text: 'Hey, how are u , can u please give a miilon dollar lend ? :p',
    unread: false,
  ),
  Message(
    sender: jack,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
  ),
  Message(
    sender: harry,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
  Message(
    sender: salman,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
  ),
  Message(
    sender: chandan,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
  Message(
    sender: jenny,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
  Message(
    sender: khern,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: jack,
    time: '2:23 PM',
    text: 'Hey, Ejaz how\'s it going? What did you do today?',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '7:20 PM',
    text: 'jackkkkkkkkkkkk ',
    unread: false,
  ),
  Message(
    sender: jack,
    time: '8:05 PM',
    text: 'yo?',
    unread: true,
  ),
  Message(
    sender: jack,
    time: '1:15 PM',
    text: 'EJAZ',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '12:30 PM',
    text: 'good day mate?',
    unread: true,
  ),
  Message(
    sender: jack,
    time: '12:00 PM',
    text: 'good mrng',
    unread: true,
  ),
];

class Message {
  final String senderId;
  final String recipientId;
  final String text;
  final DateTime createdAt;
  Message({
    required this.senderId,
    required this.recipientId,
    required this.text,
    required this.createdAt,
  });

  static List<Message> messages = [
    Message(
      senderId: "1",
      recipientId: "2",
      text: "Hey,How are you ?",
      createdAt:
          DateTime(2022, 08, 01, 10, 10, 10),
    ),
    Message(
      senderId: "1",
      recipientId: "2",
      text: "I'm staying here today.",
      createdAt:
          DateTime(2022, 08, 01, 10, 10, 10).add(const Duration(seconds: 120)),
    ),
    Message(
      senderId: "2",
      recipientId: "1",
      text: "Hey, I'm good thanks. What are you doing here today",
      createdAt:
          DateTime(2022, 08, 01, 10, 10, 10).add(const Duration(seconds: 250)),
    ),
    Message(
      senderId: "2",
      recipientId: "1",
      text: "What is the issue?",
      createdAt:
          DateTime(2022, 08, 01, 10, 10, 10).add(const Duration(seconds: 400)),
    ),
    Message(
      senderId: "3",
      recipientId: "4",
      text: "Hey,How are you ?",
      createdAt:
          DateTime(2022, 08, 01, 10, 10, 10),
    ),
    Message(
      senderId: "3",
      recipientId: "4",
      text: "I'm staying here today.",
      createdAt:
          DateTime(2022, 08, 01, 10, 10, 10).add(const Duration(seconds: 120)),
    ),
    Message(
      senderId: "4",
      recipientId: "3",
      text: "Hey, I'm good thanks. What are you doing here today",
      createdAt:
          DateTime(2022, 08, 01, 10, 10, 10).add(const Duration(seconds: 250)),
    ),
    Message(
      senderId: "4",
      recipientId: "3",
      text: "What is the issue?",
      createdAt:
          DateTime(2022, 08, 01, 10, 10, 10).add(const Duration(seconds: 400)),
    ),
    Message(
      senderId: "5",
      recipientId: "6",
      text: "Hey,How are you ?",
      createdAt:
          DateTime(2022, 08, 01, 10, 10, 10),
    ),
    Message(
      senderId: "5",
      recipientId: "6",
      text: "I'm staying here today.",
      createdAt:
          DateTime(2022, 08, 01, 10, 10, 10).add(const Duration(seconds: 120)),
    ),
    Message(
      senderId: "6",
      recipientId: "5",
      text: "Hey, I'm good thanks. What are you doing here today",
      createdAt:
          DateTime(2022, 08, 01, 10, 10, 10).add(const Duration(seconds: 250)),
    ),
    Message(
      senderId: "6",
      recipientId: "5",
      text: "What is the issue?",
      createdAt:
          DateTime(2022, 08, 01, 10, 10, 10).add(const Duration(seconds: 400)),
    ),
  ];
}

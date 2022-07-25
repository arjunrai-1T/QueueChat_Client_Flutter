class Chat {
  final String name,
      lastMessage,
      image,
      time,
      callStatus,
      callType,
      chatMessage;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
    this.callStatus = '',
    this.callType = '',
    this.chatMessage = '',
  });
}

List chatsData = [
  Chat(
    name: "Jenny Wilson",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/user.png",
    time: "3m ago",
    isActive: false,
    callStatus: 'Outgoing',
    callType: 'Audio',
    chatMessage: 'Today, 12:28 PM',
  ),
  Chat(
    name: "Esther Howard",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isActive: true,
    callStatus: 'Incoming',
    callType: 'Video',
    chatMessage: 'Today, 01:11 AM',
  ),
  Chat(
    name: "Ralph Edwards",
    lastMessage: "Do you have update...",
    image: "assets/images/user_3.png",
    time: "5d ago",
    isActive: false,
    callStatus: 'Incoming',
    callType: 'Video',
    chatMessage: 'Today, 5:28 AM',
  ),
  Chat(
    name: "Jacob Jones",
    lastMessage: "You’re welcome :)",
    image: "assets/images/user_4.png",
    time: "5d ago",
    isActive: true,
    callStatus: 'Outgoing',
    callType: 'Audio',
    chatMessage: 'Today, 12:28 PM',
  ),
  Chat(
    name: "Albert Flores",
    lastMessage: "Thanks",
    image: "assets/images/user_5.png",
    time: "6d ago",
    isActive: false,
    callStatus: 'Incoming',
    callType: 'Video',
    chatMessage: 'Today, 01:11 AM',
  ),
  Chat(
    name: "Jenny Wilson",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/user.png",
    time: "3m ago",
    isActive: false,
    callStatus: 'Outgoing',
    callType: 'Audio',
    chatMessage: 'Today, 12:28 PM',
  ),
  Chat(
    name: "Esther Howard",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isActive: true,
    callStatus: 'Incoming',
    callType: 'Video',
    chatMessage: 'Today, 5:28 AM',
  ),
  Chat(
    name: "Ralph Edwards",
    lastMessage: "Do you have update...",
    image: "assets/images/user_3.png",
    time: "5d ago",
    isActive: false,
    callStatus: 'Incoming',
    callType: 'Video',
    chatMessage: 'Today, 01:11 AM',
  ),
  Chat(
    name: "Jenny Wilson",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/user.png",
    time: "3m ago",
    isActive: false,
    callStatus: 'Outgoing',
    callType: 'Audio',
    chatMessage: 'Today, 12:28 PM',
  ),
  Chat(
    name: "Esther Howard",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isActive: true,
    callStatus: 'Incoming',
    callType: 'Video',
    chatMessage: 'Today, 5:28 AM',
  ),
  Chat(
    name: "Ralph Edwards",
    lastMessage: "Do you have update...",
    image: "assets/images/user_3.png",
    time: "5d ago",
    isActive: false,
    callStatus: 'Incoming',
    callType: 'Video',
    chatMessage: 'Today, 01:11 AM',
  ),
  Chat(
    name: "Jacob Jones",
    lastMessage: "You’re welcome :)",
    image: "assets/images/user_4.png",
    time: "5d ago",
    isActive: true,
    callStatus: 'Outgoing',
    callType: 'Audio',
    chatMessage: 'Today, 12:28 PM',
  ),
  Chat(
    name: "Albert Flores",
    lastMessage: "Thanks",
    image: "assets/images/user_5.png",
    time: "6d ago",
    isActive: false,
    callStatus: 'Incoming',
    callType: 'Video',
    chatMessage: 'Today, 5:28 AM',
  ),
  Chat(
    name: "Jenny Wilson",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/user.png",
    time: "3m ago",
    isActive: false,
    callStatus: 'Incoming',
    callType: 'Video',
    chatMessage: 'Today, 01:11 AM',
  ),
  Chat(
    name: "Esther Howard",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isActive: true,
    callStatus: 'Outgoing',
    callType: 'Audio',
    chatMessage: 'Today, 12:28 PM',
  ),
  Chat(
    name: "Ralph Edwards",
    lastMessage: "Do you have update...",
    image: "assets/images/user_3.png",
    time: "5d ago",
    isActive: false,
    callStatus: 'Incoming',
    callType: 'Video',
    chatMessage: 'Today, 01:11 AM',
  ),
  Chat(
    name: "Jenny Wilson",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/user.png",
    time: "3m ago",
    isActive: false,
    callStatus: 'Incoming',
    callType: 'Video',
    chatMessage: 'Today, 5:28 AM',
  ),
  Chat(
    name: "Esther Howard",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isActive: true,
    callStatus: 'Incoming',
    callType: 'Video',
    chatMessage: 'Today, 01:11 AM',
  ),
  Chat(
    name: "Ralph Edwards",
    lastMessage: "Do you have update...",
    image: "assets/images/user_3.png",
    time: "5d ago",
    isActive: false,
    callStatus: 'Outgoing',
    callType: 'Audio',
    chatMessage: 'Today, 12:28 PM',
  ),
  Chat(
    name: "Jacob Jones",
    lastMessage: "You’re welcome :)",
    image: "assets/images/user_4.png",
    time: "5d ago",
    isActive: true,
    callStatus: 'Incoming',
    callType: 'Video',
    chatMessage: 'Today, 5:28 AM',
  ),
  Chat(
    name: "Albert Flores",
    lastMessage: "Thanks",
    image: "assets/images/user_5.png",
    time: "6d ago",
    isActive: false,
    callStatus: 'Incoming',
    callType: 'Video',
    chatMessage: 'Today, 01:11 AM',
  ),
  Chat(
    name: "Jenny Wilson",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/user.png",
    time: "3m ago",
    isActive: false,
    callStatus: 'Outgoing',
    callType: 'Audio',
    chatMessage: 'Today, 12:28 PM',
  ),
  Chat(
    name: "Esther Howard",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isActive: true,
    callStatus: 'Incoming',
    callType: 'Video',
    chatMessage: 'Today, 5:28 AM',
  ),
  Chat(
    name: "Ralph Edwards",
    lastMessage: "Do you have update...",
    image: "assets/images/user_3.png",
    time: "5d ago",
    isActive: false,
    callStatus: 'Outgoing',
    callType: 'Audio',
    chatMessage: 'Today, 12:28 PM',
  ),
];
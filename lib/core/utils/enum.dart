enum UserType { patronUser, venueAdmin }
enum Tabs { venues, messages, payments, myTreat, people, profile }
enum MainTabs { venues, messages, people, profile }
enum SortBy { name, credit, discount, none }
enum SortByValue { creditHighToLow, creditLowtoHigh, none }
enum APIResultType {
  LOADING,
  SUCCESS,
  FAILURE,
  SESSION_EXPIRED,
  NO_INTERNET,
  UNAUTHORISED,
  NOTFOUND
}
enum NetworkResultType {
  SUCCESS,
  ERROR,
  NO_INTERNET,
  UNAUTHORISED,
  NOTFOUND
}

enum MessageType { person, venue, system }
enum ChatMessageSource {
  sender,
  receiver,
}
enum ChatMessageStaus { delivered, read }
enum ChatMessageDescription { link, message, image, treat }

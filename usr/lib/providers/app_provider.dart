import 'package:flutter/material.dart';
import '../models/event.dart';
import '../models/news.dart';
import '../models/user.dart';

class AppProvider extends ChangeNotifier {
  // Mock data - replace with Supabase calls when connected
  List<Event> _events = [
    Event(
      id: '1',
      title: 'Whanganui River Cruise',
      date: DateTime.now().add(const Duration(days: 7)),
      location: 'Whanganui River',
      description: 'Join us for a scenic river cruise through beautiful Whanganui.',
      image: 'https://via.placeholder.com/300',
      category: 'Outdoor',
      createdAt: DateTime.now(),
    ),
    Event(
      id: '2',
      title: 'Local Music Festival',
      date: DateTime.now().add(const Duration(days: 14)),
      location: 'Victoria Park',
      description: 'Enjoy live music from local bands.',
      image: 'https://via.placeholder.com/300',
      category: 'Music',
      createdAt: DateTime.now(),
    ),
  ];

  List<News> _news = [
    News(
      id: '1',
      title: 'New Community Center Opens',
      source: 'Whanganui Chronicle',
      summary: 'The new community center is now open and ready to serve.',
      image: 'https://via.placeholder.com/300',
      createdAt: DateTime.now(),
    ),
    News(
      id: '2',
      title: 'Local Business Wins Award',
      source: 'River City News',
      summary: 'A local cafe has been recognized for its excellence.',
      image: 'https://via.placeholder.com/300',
      createdAt: DateTime.now(),
    ),
  ];

  User? _currentUser;

  List<Event> get events => _events;
  List<News> get news => _news;
  User? get currentUser => _currentUser;

  // Mock user login - replace with Supabase auth when connected
  void login(String email, String password) {
    // TODO: Implement real authentication with Supabase
    _currentUser = User(id: '1', name: 'Test User', email: email);
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }

  // Mock event creation - replace with Supabase when connected
  void addEvent(Event event) {
    _events.add(event);
    notifyListeners();
  }

  // Filter events by category
  List<Event> getFilteredEvents(String category) {
    if (category == 'All') return _events;
    return _events.where((event) => event.category == category).toList();
  }

  // Search functionality
  List<Event> searchEvents(String query) {
    return _events.where((event) =>
      event.title.toLowerCase().contains(query.toLowerCase()) ||
      event.description.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  List<News> searchNews(String query) {
    return _news.where((newsItem) =>
      newsItem.title.toLowerCase().contains(query.toLowerCase()) ||
      newsItem.summary.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  // Bookmark event
  void toggleBookmark(String eventId) {
    final index = _events.indexWhere((event) => event.id == eventId);
    if (index != -1) {
      _events[index] = _events[index].copyWith(isBookmarked: !_events[index].isBookmarked);
      notifyListeners();
    }
  }

  // Get trending items (mock - most recent)
  List<dynamic> getTrending() {
    final allItems = <dynamic>[..._events, ..._news];
    allItems.sort((a, b) => (b.createdAt as DateTime).compareTo(a.createdAt as DateTime));
    return allItems.take(5).toList();
  }
}

# Whanganui Hub

A modern, responsive web application for the city of Whanganui, New Zealand. Acts as a central hub for local events, news, and community posts.

## Features

- **Home Page**: Combined feed of events and news with trending section
- **Events Page**: List upcoming events with category and date filters
- **News Page**: Local news articles
- **Add Event**: Form to submit new events
- **Search**: Global search across events and news
- **Responsive Design**: Mobile-first, works on phone and desktop
- **Bookmarking**: Save favorite events

## Tech Stack

- **Frontend**: Flutter (cross-platform, including web)
- **State Management**: Provider
- **Backend**: Prepared for Supabase integration (currently using mock data)

## Getting Started

1. Ensure Flutter is installed: https://flutter.dev/docs/get-started/install
2. Clone this repository
3. Run `flutter pub get` to install dependencies
4. For web development: `flutter run -d chrome`
5. For mobile: Connect device and run `flutter run`
6. For deployment: Use CouldAI's Publish button for cloud builds (iOS, Android, macOS, Windows, Linux, Web)

## Project Structure

- `lib/models/`: Data models (Event, News, User)
- `lib/providers/`: State management with Provider
- `lib/screens/`: Main app screens
- `lib/widgets/`: Reusable UI components

## Database Integration

The app is currently using mock data. To connect to a database:
1. Set up Supabase project
2. Create tables for events, news, users
3. Replace mock data in `AppProvider` with Supabase calls
4. Add authentication for user login

## Automation Preparation

The backend structure is abstracted to allow for future API integrations, scraping tools, and AI processing for content cleaning and formatting.

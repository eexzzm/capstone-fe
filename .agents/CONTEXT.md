# Project Context

## Project Overview

This repository contains the Flutter frontend application for tani pintar.

The application is being developed based on UI/UX designs created in Figma.

The development process follows:

Figma Design
↓
Flutter UI Implementation
↓
Frontend Logic
↓
Backend API Integration
↓
End-to-End Application

The backend is developed separately by another team member and is maintained
in a different repository.

This repository is responsible primarily for:
- Flutter frontend
- UI implementation
- Client-side logic
- Navigation
- State management
- API consumption
- Frontend validation and error handling

This repository is NOT responsible for:
- Backend business logic
- Database implementation
- Backend deployment
- Backend infrastructure

## Current Development Phase

Current phase: Frontend Development



Current priority:

Implement the frontend based on the Figma design.

Do not prematurely implement backend integration unless explicitly requested.

## Application Context

Application type:
- Mobile application
- Flutter / Dart

Target platform:
- Android

Primary users:
- Farmer who own a farm that is ready to contain several crops in minimum 1 area, the farmer also already have the needed sensor like air humidity, soil moisture, temperature, etc. 

Primary purpose:
- monitor the current condition and health of each crop / plant that is being track with sensor. the past condition and health is being logged that the farmer can see eveyrthing in history page later. 

Core user flows:
1. User opens application
2. User logs in
3. User accesses dashboard
4. User receives summary information and latest anomalies / activities around the farm that is in danger or caution category. if its all of them healthy then there is nothing to see in the lates activity page.
5. User accesses crops activity history (this is only show anomalies and not a healthy activity) 
6. User performs filtering (date, status) and pagination if needed
7. User receives all activities in the past that happening in the farm
8. User accesses area list
9. User can perform add area, access to the detail page of area, or go to the sensor page
10. User receives all registered area with brief information 
11. User accesses detail page of one specific area
12. User receives current information that being captured by sensors and list of all crops 
13. User accesses sensor page
14. User performs crud on the sensor page
15. User receives list of all registered sensors
16. User accesses profile page 
17. User receives several options that can be access in profile page
18. User performs edit profile


## UI / Design System
1. Reuse existing components whenever possible.
2. Preserve:
    - spacing
    - typography
    - colors
    - border radius
    - iconography
    - component hierarchy
    - interaction states
3. Do not show or register static dummy data into the interface; prepare the design / layout and connect with Provider to show real data when connected to the backend (use empty states if data is empty).
4. **Card & Component Architecture (Avoid Helper Method Anti-Pattern):**
    - Do NOT build cards, list items, or complex sub-components as private helper methods (e.g. `_buildCard()`, `_buildItem()`) inside the View's State file.
    - Always extract cards and complex UI items into standalone `StatelessWidget` files located inside the respective module's `widgets/` directory (e.g. `lib/modules/<feature>/widgets/<card_name>.dart`) or global `lib/widgets/`.
    - This ensures optimal Flutter widget rebuild performance, prevents file bloating/spaghetti code in `views/`, and maintains high readability and maintainability.

## Device Requirements

Primary target:
- Android smartphones

The UI should support common Android screen sizes.

Avoid assuming a single fixed screen resolution.

Do not use hardcoded screen dimensions unless required by the design.

Prefer responsive Flutter layout mechanisms.
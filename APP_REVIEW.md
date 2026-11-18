# Movie Bar iOS 1.0 — Apple App Review (Guideline 2.1)

Status: DRAFT — not submitted. This is a preparation document, not a claim that testing has passed.

## App purpose and target audience
Movie Bar Meckenbeuren is a free customer-facing app for a local hospitality venue in Meckenbeuren, Germany. Its intended audience is guests and prospective visitors. The app is intended to help visitors find venue information, opening hours, events, promotions and dart-related information. Confirm the precise feature set against the submitted build before sending.

## Reviewer access instructions — verify on physical device
1. Launch Movie Bar Meckenbeuren on an iPhone running a current supported iOS version.
2. Navigate through every visible section and verify that each view loads.
3. Open the venue website section and test links and navigation.
4. Test any interactive features included in the submitted binary.
5. Record any account creation, login, deletion, moderation or payment flows **if they exist**.
6. If login is required, provide a working demo account for every account type in App Store Connect review fields (never commit credentials to GitHub).

## Required screen recording
Record on a real supported iPhone, starting **before launching the app**. Demonstrate the normal user journey and all key features, including any relevant account, user-generated-content reporting/blocking, and paid-content flows. Upload to an accessible reviewer location and provide its URL in App Review Notes. Do not claim this recording exists until it has been made.

## Third-party services — pending verification
- Apple iOS / WebKit for displaying web content (the Codemagic script inserts a WKWebView).
- Website destination and hosting: verify actual URL, owner and permissions from app source.
- Any database, analytics, authentication, payment, notifications or external data providers: inspect submitted binary and list only services actually used.
- Confirm permission to use all venue content and any externally supplied media.

## Release readiness
- [ ] Confirm source ZIP and transformation script match submitted Build 7.
- [ ] Verify Xcode build and signed IPA success in Codemagic.
- [ ] Test submitted build on physical iPhone (all supported devices/OS).
- [ ] Verify app launches, links, menus, layout, connectivity, and no crashes.
- [ ] Verify App Store screenshots depict actual in-app functionality.
- [ ] Confirm account/privacy/payment obligations where applicable.
- [ ] Produce real-device screen recording and accessible URL.
- [ ] Complete review notes with actual third-party services, instructions and demo access.
- [ ] Resubmit in App Store Connect.

## Notes for reviewer — incomplete template
Purpose: Movie Bar Meckenbeuren is a free informational app for guests and visitors of the venue in Germany. It provides convenient access to venue information and, where available in this build, events, promotions and dart-related activities.

Access: [INSERT VERIFIED STEPS, INCLUDING LOGIN DETAILS IF NEEDED]
Screen recording: [INSERT VERIFIED VIDEO LINK]
External services: [INSERT VERIFIED SERVICES AND CONTENT RIGHTS]
Testing: [INSERT REAL DEVICE / IOS VERSION / RESULT]

Do not submit the bracketed placeholders.

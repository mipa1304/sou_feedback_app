# SOU Feedback App

Flutter visitor feedback app for the Statue of Unity premises.

## Quick visitor feedback

From the login screen, select **Quick visitor feedback**. Visitors can scan an
area QR code in the app or choose an area manually, then submit a 1–5 star
rating, a typed comment, or a speech-to-text comment. English, Hindi, Gujarati,
and Tamil are available for voice input. The app saves the comment as text; it
does not upload an audio recording.

The **Area QR codes** button displays the codes to place in visitor areas. Each
QR code contains an area identifier and is meant to be scanned from within the
app. If camera access is unavailable, visitors can choose an area manually.

## Firebase setup

Visitor submissions are written to the `VisitorFeedback` Firestore collection.
Enable anonymous sign-in in Firebase Authentication and deploy the Firestore
rules before using this feature against the production project:

```shell
firebase deploy --only firestore:rules
```

The app requests camera access for QR scanning and microphone/speech recognition
access for dictated comments.
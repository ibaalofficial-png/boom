# Boom Music Native iOS

Project iOS Boom Music + Native Glass shell.

## Build via GitHub Actions

Workflow:
`.github/workflows/build-ios.yml`

The workflow builds an unsigned iPhoneOS app and packages it as:
`BoomMusicNative-unsigned.ipa`

After the workflow finishes:
1. Open GitHub → Actions.
2. Open **Build Boom Music iOS**.
3. Open the successful run.
4. Download artifact **BoomMusicNative-unsigned-ipa**.

The unsigned IPA is for build verification only. To install on a device, Apple code signing/provisioning is required.

## Project

- `BoomMusicNative/BoomMusicNative.xcodeproj`
- `BoomMusicNative/Sources/` — Swift native engine + Glass UI
- `BoomMusicNative/WebResources/` — Boom Music web app

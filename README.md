# invarn fixture: ios-pods

A minimal SwiftUI iOS app integrated with CocoaPods, depending on Alamofire. Used by [invarnhq/templates](https://github.com/invarnhq/templates) curated templates that target the iOS stack with CocoaPods present.

This is a standalone fixture repo — the matching curated template targets this repo at root, the same shape as a customer-connected CocoaPods iOS app.

## What's checked in

- `project.yml` — [XcodeGen](https://github.com/yonaskolb/XcodeGen) project spec. Source of truth.
- `IosPodsDemo.xcodeproj/` — generated from `project.yml` and **committed** so iOS detection can recognize this repo as an iOS project at clone time. Regenerate via `xcodegen generate` if it drifts from `project.yml`.
- `IosPodsDemo.xcworkspace/` — produced by `pod install` and **committed** so the workspace is visible to detection. Regenerate via `pod install` after any `Podfile` change.
- `Podfile` — CocoaPods spec pinning `Alamofire ~> 5.9`.
- `Podfile.lock` — locks Alamofire to a specific version so the fixture is deterministic.
- `IosPodsDemo/` — SwiftUI app source (~30 LOC). `ContentView.swift` `import`s Alamofire and references `Session.default` so the link must resolve.
- `IosPodsDemoTests/` — one XCTestCase with two passing tests.

## What's NOT checked in

- `Pods/` — installed by `pod install`. Regenerated at build time by the matching curated template's `cocoapods-install` step.
- `xcuserdata/` — per-user Xcode state. Gitignored.
- `DerivedData/`, `.build/`, `build/` — Xcode build output. Gitignored.

## Regenerate locally

If you change `project.yml` or `Podfile`:

```bash
xcodegen generate
pod install
git add IosPodsDemo.xcodeproj IosPodsDemo.xcworkspace Podfile.lock
```

You'll need [XcodeGen](https://github.com/yonaskolb/XcodeGen) and [CocoaPods](https://cocoapods.org/) installed (`brew install xcodegen cocoapods`).

## Build it locally

CocoaPods-integrated targets must build against the workspace, not the project. The first build needs `Pods/` installed:

```bash
pod install
xcodebuild -workspace IosPodsDemo.xcworkspace -scheme IosPodsDemo -destination 'platform=iOS Simulator,OS=latest,name=iPhone 17' build test
```

## Which curated templates target this fixture

- `ios-pr-gate` — `cocoapods-install` runs (`requires_when: { pods: true }` holds), then build + unit test should be green against this fixture.

## Properties

- ≤ 500 LOC of hand-written source (the `.xcodeproj` and `.xcworkspace` are generated).
- ≤ 3-minute clean build on the standard macOS runner.
- One external dependency (Alamofire), pinned via `~> 5.9` and locked in `Podfile.lock`.
- Single scheme (`IosPodsDemo`).
- One test target (`IosPodsDemoTests`).

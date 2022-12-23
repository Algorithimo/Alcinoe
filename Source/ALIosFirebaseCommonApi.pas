﻿unit ALIosFirebaseCommonApi;

interface

{$I Alcinoe.inc}

uses
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.Foundation;

{$M+}

type

  {****************************************************************************************}
  //https://firebase.google.com/docs/reference/ios/firebasecore/api/reference/Classes/FIRApp
  FIRAppClass = interface(NSObjectClass)
  ['{37BEFC11-8AE6-4312-971D-53BF9D8DB22A}']
    {class} procedure configure; cdecl;
  end;
  FIRApp = interface(NSObject)
  ['{69F89279-48F0-4276-B337-37FE79821507}']
  end;
  TFIRApp = class(TOCGenericImport<FIRAppClass, FIRApp>) end;

implementation

procedure ClangRTLoader; cdecl; external '/usr/lib/clang/lib/darwin/libclang_rt.ios.a';
procedure FirebaseCoreInternalLoader; cdecl; external framework 'FirebaseCoreInternal';
procedure FirebaseCoreLoader; cdecl; external framework 'FirebaseCore';
procedure FBLPromisesLoader; cdecl; external framework 'FBLPromises';
procedure FirebaseInstallationsLoader; cdecl; external framework 'FirebaseInstallations';
//Without GoogleUtilitiesLoader the app crash when we launch it and call TFIRApp.OCClass.configure
//just after installing the app (but if we relaunch it again then everything work good)
procedure GoogleUtilitiesLoader; cdecl; external framework 'GoogleUtilities';

{$IFNDEF ALCompilerVersionSupported}
  {$MESSAGE WARN 'Check if https://quality.embarcadero.com/browse/RSP-38700 is corrected and if yes check if all declarations below are still mandatories.'}
{$IFEND}
procedure libswiftCompatibility50Loader; cdecl; external '/usr/lib/swift/iphoneos/libswiftCompatibility50.a';
procedure libswiftCompatibility51Loader; cdecl; external '/usr/lib/swift/iphoneos/libswiftCompatibility51.a';
procedure libswiftCompatibilityConcurrencyLoader; cdecl; external '/usr/lib/swift/iphoneos/libswiftCompatibilityConcurrency.a';
procedure libswiftCompatibilityDynamicReplacementsLoader; cdecl; external '/usr/lib/swift/iphoneos/libswiftCompatibilityDynamicReplacements.a';
procedure libswiftCoreFoundationLoader; cdecl; external '/usr/lib/swift/libswiftCoreFoundation.dylib';
procedure libswiftCoreImageLoader; cdecl; external '/usr/lib/swift/libswiftCoreImage.dylib';
procedure libswiftCoreLoader; cdecl; external '/usr/lib/swift/libswiftCore.dylib';
procedure libswiftDarwinLoader; cdecl; external '/usr/lib/swift/libswiftDarwin.dylib';
procedure libswiftDataDetectionLoader; cdecl; external '/usr/lib/swift/libswiftDataDetection.dylib';
procedure libswiftDispatchLoader; cdecl; external '/usr/lib/swift/libswiftDispatch.dylib';
procedure libswiftFileProviderLoader; cdecl; external '/usr/lib/swift/libswiftFileProvider.dylib';
procedure libswiftMetalLoader; cdecl; external '/usr/lib/swift/libswiftMetal.dylib';
procedure libswiftObjectiveCLoader; cdecl; external '/usr/lib/swift/libswiftObjectiveC.dylib';
procedure libswiftQuartzCoreLoader; cdecl; external '/usr/lib/swift/libswiftQuartzCore.dylib';
procedure libswiftUIKitLoader; cdecl; external '/usr/lib/swift/libswiftUIKit.dylib';

end.

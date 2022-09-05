# app-boilerplate

앱 생산성을 높이기 위한 보일러플레이트 프로젝트

## 참고사항
1. pubspec.yaml 파일에 추가한 패키지의 링크가 주석처리 되어 있다.
2. 이 프로젝트는 예제 코드일 뿐으로 프로젝트에 맞게 각 패키지를 설정해야할 필요성이 있다. e.g. 신규 Firebase 프로젝트 생성 후 xcode 및 android gradle파일 수정 등등

### Firebase Docs
파이어 베이스를 설정할 때에는 아래 링크를 따라서 설정하도록 한다. 
flutterfire cli 를 사용하기 전에 새로운 프로젝트를 위한 컨테이너를 생성해야 한다.
https://firebase.google.com/docs/flutter/setup?platform=ios

android에서 Firebase가 정상적으로 작동하지 않을 경우(디버그 버전), signing key의 SHA1 인증서가 콘솔에 등록되어 있는지 확인 필요
(eztechfin-boilerplate => 프로젝트 설정 => 일반 => Android 앱 => 디지털 지문 등록)

#### debug signing key값을 구하는 방법

```shell
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

## model 자동생성 명령어
모델을 정의한 다음 아래 명령어를 실행하여 from/toJson기능을 자동으로 생성하도록 한다.
```shell
flutter pub run build_runner build --delete-conflicting-outputs 
```


# WireBarleyTest



## Description

- 사용 기술
  	- Language: Swift
  	- Library: SnapKit

## How to use

1. CocoaPods install

   ```
   $ sudo gem install cocoapods
   ```

2. install Library

   ```
   $ pod install
   $ open WireBarleyCodingTest.xcworkspace
   ```

   

## Implementation

![RPReplay-Final1591858809](https://user-images.githubusercontent.com/57229970/84358667-728d5b00-ac02-11ea-9e90-1b76d18e5dac.gif)



- 구현 내용

  - **MVC pattern** 적용

  - **SnapKit**을 사용한 UI 구성

  - **URLSessionDataTask**를 사용하여 실시간 환율 정보 요청

  - 응답받은 Data를 JSONSerialization를 사용하여 JSON Data 파싱

  - 다양한 기기에 UI를 대응하기 위해  **extension** 함수를 사용

    - UIFont: iPhone 11pro를 기준으로 height의 비율 계산을 통해 적절한 폰트 반환
    - CGFloat: iPhone 11pro를 기준으로 height 또는 width의 비율 계산을 통해 적절한 CGFloat 반환

    


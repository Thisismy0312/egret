# Egret

[![CI Status](https://img.shields.io/travis/Thisismy0312/Egret.svg?style=flat)](https://travis-ci.org/Thisismy0312/Egret)
[![Version](https://img.shields.io/cocoapods/v/Egret.svg?style=flat)](https://cocoapods.org/pods/Egret)
[![License](https://img.shields.io/cocoapods/l/Egret.svg?style=flat)](https://cocoapods.org/pods/Egret)
[![Platform](https://img.shields.io/cocoapods/p/Egret.svg?style=flat)](https://cocoapods.org/pods/Egret)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Egret is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Egret'
```

## Useage

```swift
import Egret
```

### Example

#### EgretButton

```swift
let button = EgretButton()

button.colorHead = UIColor(hex: 0xEDCC99)             // Heade color of EgretButton
button.colorTail = UIColor(hex: 0xC4925A)             // Tail color of EgretButton
button.title = "Hello!"                               // Title of EgretButton
button.titleColor = .white                            // The color of button title
button.backAction = { self.button.isEnabled = false } // Click action of EgretButton
button.startPoint = CGPoint(x: 0, y: 1)               // Start position of gradient layer
button.endPoint = CGPoint(x: 1, y: 1)                 // End position of gradient layer
button.radius = 20                                    // Corner radius of EgretButton
```

**EgretButton attributes**

| attributes | type |
|:------------:|:------:|
|`colorHead`| UIColor|
|`colorTail`|UIColor|
|`titleColor`|UIColor|
|`title`|String?|
|`font`|UIFont|
|`startPoint`|CGPoint|
|`endPoint`|CGPoint|
|`backAction`|(() -> Void)?|
|`radius`|CGFloat|
|`isEnabled`|Bool|
|`icon`|UIImage?|


![image](Images/EgretButton.png)

#### EgretInputView

```swift
let phoneInput = EgretInputView()
let codeInput = EgretInputView()

phoneInput.title = "Mobile"             // Title of EgretInputView
phoneInput.haveCodeSelect = true        // Need country code selector
phoneInput.keyboardType = .numberPad    // Keyboard type of EgretInputView

codeInput.title = "Code"
codeInput.haveSubmit = true             // Show submit
codeInput.sendTitle = "Send"            // Title of submit
codeInput.keyboardType = .numberPad
codeInput.counter = 120                 // Countdown time
codeInput.submitActoin = yourFunction() // Action of Submit
```

**EgretInputView attributes**

|attributes|type|
|:---:|:---:|
|`haveCodeSelect`|Bool|
|`haveSubmit`|bool|
|`sendTitle`|String|
|`enabled`|Bool|
|`title`|String?|
|`keyboardType`|UIKeyboardType|
|`counter`|Int|
|`submitActoin`|(() -> Void)?|
|`text`|String?|
|`code`|String?|

![image](Images/ScreenHost.gif)

## Contributors ✨

<table>
  <tr>
    <td align="center"><a href="http://ruilisi.co/"><img src="https://avatars3.githubusercontent.com/u/15723059?s=400&u=b0a0ec8f555b843a99dce0bffddac285e4196e85&v=4" width="100px;" alt="Miles"/><br /><sub><b>Miles</b></sub></a><br /><a href="https://github.com/ruilisi/Egret/commits?author=Thisismy0312" title="Code">💻</a> <a href="https://github.com/ruilisi/Egret/commits?author=Thisismy0312" title="Documentation">📖</a></td>
  </tr>
</table>

## License

Egret is available under the MIT license. See the LICENSE file for more info.

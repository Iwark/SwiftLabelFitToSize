SwiftLabelFitToSize
===================

Shorten and add '...' to text to fit label's size.

ラベルのサイズに合うようにテキストの文字数を削って「...」を追記するメソッドです。

## Install

Add SwiftLabelFitToSize.swift file to your project.

プロジェクトにSwiftLabelFitToSize.swiftファイルを追加してください。

## Example

```swift

let label = UILabel(frame: CGRectMake(0, 0, 120, 80))
label.numberOfLines = 0
label.text = "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
label.fitToSize()

```

## Result

![](example_result.png)



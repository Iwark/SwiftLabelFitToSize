//
//  SwiftLabelFitToSize.swift
//  cclt
//
//  Created by Kohei Iwasaki on 1/5/15.
//  Copyright (c) 2015 Kohei Iwasaki. All rights reserved.
//

import UIKit

extension UILabel {
    
    // 文字数をサイズに合わせてfitさせる
    func fitToSize() {
        
        var fitSize = self.sizeThatFits(CGSizeMake(self.frame.size.width, CGFloat.max))
        var fitArea = fitSize.width * fitSize.height
        
        let selfArea = self.frame.size.width * self.frame.size.height
        
        // 既に十分サイズが大きければ終了
        if fitArea <= selfArea {
            return
        } else {
            
            let text = (self.text != nil) ? self.text! : ""
            let textLength = countElements(text)
            
            // 1文字あたりのサイズを大まかに取得。
            let sizeForElement = fitArea / CGFloat(textLength)
            
            // 省略する文字数
            var shortenTextLength = Int((fitArea - selfArea) / sizeForElement)
            
            while(fitSize.height > self.frame.size.height){
                if(textLength - shortenTextLength - 1 <= 0){ break }
                let startIndex = advance(text.startIndex, 0)
                let endIndex = advance(startIndex, textLength - shortenTextLength - 1)
                self.text = text[Range(start: startIndex, end: endIndex)] + "…"
                fitSize = self.sizeThatFits(CGSizeMake(self.frame.size.width, CGFloat.max))
                shortenTextLength++
            }
        }
    }
}
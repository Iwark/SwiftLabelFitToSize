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
        var labelSize = self.sizeThatFits(CGSizeMake(self.frame.size.width, CGFloat.max))
        
        if labelSize.height <= self.frame.size.height {
            return
        } else {
            
            let text = (self.text != nil) ? self.text! : ""
            let textLength = countElements(text)
            
            // 1文字あたりのサイズを大まかに取得。
            let labelSizeArea = labelSize.width * labelSize.height
            let sizeForElement = labelSizeArea / CGFloat(textLength)

            // 省略する文字数
            let selfSizeArea = self.frame.size.width * self.frame.size.height
            var shortenTextLength = Int((labelSizeArea - selfSizeArea) / sizeForElement)
            
            while(labelSize.height > self.frame.size.height){
                
                if(textLength - shortenTextLength - 1 <= 0){ break }
                
                let startIndex = advance(text.startIndex, 0)
                let endIndex = advance(startIndex, textLength - shortenTextLength - 1)
                self.text = text[Range(start: startIndex, end: endIndex)] + "…"
                labelSize = self.sizeThatFits(CGSizeMake(self.frame.size.width, CGFloat.max))
                shortenTextLength++
            }
        }
    }
}
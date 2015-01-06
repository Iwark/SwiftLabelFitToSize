//
//  SwiftLabelFitToSize.swift
//  cclt
//
//  Created by Kohei Iwasaki on 1/5/15.
//  Copyright (c) 2015 Kohei Iwasaki. All rights reserved.
//

import UIKit

extension UILabel {

    /**
    Truncate the text to fit.

    :param: omission String which replace the last characters with. Defaults to '…'
    */
    func fitToSizeByTruncate(omission:String="…") {

        var fitSize = self.sizeThatFits(CGSizeMake(self.frame.size.width, CGFloat.max))
        var fitArea = fitSize.width * fitSize.height

        let selfArea = self.frame.size.width * self.frame.size.height

        if fitArea <= selfArea {
            return
        } else {

            let text = (self.text != nil) ? self.text! : ""
            let textLength = countElements(text)

            let omissionLength = countElements(omission)

            let sizeForElement = fitArea / CGFloat(textLength)

            var shortenTextLength = Int((fitArea - selfArea) / sizeForElement)

            while(fitSize.height > self.frame.size.height){
                if(textLength - shortenTextLength - omissionLength <= 0){ break }
                let startIndex = advance(text.startIndex, 0)
                let endIndex = advance(startIndex, textLength - shortenTextLength - omissionLength)
                self.text = text[Range(start: startIndex, end: endIndex)] + omission
                fitSize = self.sizeThatFits(CGSizeMake(self.frame.size.width, CGFloat.max))
                shortenTextLength++
            }
        }
    }

    /**
    Reduce the font size to fit.

    :param: step Step of reducing font size. Defaults to 0.5
    :param: minimumSize Minimum size of font size. Defaults to 5.0
    */
    func fitToSizeByReduction(step:CGFloat = 0.5, minimumSize:CGFloat = 5.0) {

        var fitSize = self.sizeThatFits(CGSizeMake(self.frame.size.width, CGFloat.max))
        var fitArea = fitSize.width * fitSize.height

        let selfArea = self.frame.size.width * self.frame.size.height

        let fontName = self.font.fontName
        var fontSize = self.font.pointSize

        while(fitArea > selfArea && fontSize > minimumSize) {

            fontSize -= step
            if fontSize < minimumSize {
                fontSize = minimumSize
            }
            self.font = UIFont(name: fontName, size: fontSize)

            fitSize = self.sizeThatFits(CGSizeMake(self.frame.size.width, CGFloat.max))
            fitArea = fitSize.width * fitSize.height

        }

    }
}

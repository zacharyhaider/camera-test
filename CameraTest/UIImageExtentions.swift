//
//  UIImageExtentions.swift
//  CameraTest
//
//  Created by Student on 12/2/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

extension UIImage {
    func getPixels() -> [[CGFloat]] {
        guard let cgImage = self.cgImage else {
            return []
        }
        guard let imageData = cgImage.dataProvider?.data as Data? else {
            return []
        }
        let buffer = UnsafeMutableBufferPointer<UInt32>.allocate(capacity: cgImage.width * cgImage.height)
        _ = imageData.copyBytes(to: buffer)
        var result = [[CGFloat]]()
        for pixel in buffer {
                let b = pixel & 255
                let g = (pixel >> 8) & 255
                let r = (pixel >> 16) & 255
            let color = [CGFloat(r), CGFloat(g),CGFloat(b)]
            result.append(color)
        }
        return result
    }
}

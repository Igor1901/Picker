//
//  CustomButton.swift
//  Picker
//
//  Created by Игорь Пачкин on 23/4/23.
//

import UIKit
import SnapKit

class CustomButton: UIButton {
    var firstImage: UIImage?
    var secondImage: UIImage?

    var isToggledOn = false {
        didSet {
            if isToggledOn {
                self.setImage(secondImage, for: .normal)
            } else {
                self.setImage(firstImage, for: .normal)
            }
        }
    }

    func toggle() {
        isToggledOn.toggle()
    }
}

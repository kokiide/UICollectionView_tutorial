//
//  ColorCollectionViewCell.swift
//  UICollectionView Tutorial
//
//  Created by Koki Ide on 2017/05/15.
//  Copyright © 2017 kokiide. All rights reserved.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    
    var colorImageView: UIImageView!
    
    override func awakeFromNib() {
        colorImageView = UIImageView(frame: contentView.frame)
        colorImageView.contentMode = .scaleAspectFill
        colorImageView.clipsToBounds = true
        contentView.addSubview(colorImageView) //remember to add UI elements to the contentView, not the cell itself
    }
}

//
//  SmallCollectionViewCell.swift
//  CardsOffersUI
//
//  Created by Anant on 4/27/17.
//  Copyright © 2017 Anant. All rights reserved.
//

import UIKit

class SmallCollectionViewCell: UICollectionViewCell , OfferCell{
   
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
     func updateCell() {
      label.text = "Label"
    }
  

}

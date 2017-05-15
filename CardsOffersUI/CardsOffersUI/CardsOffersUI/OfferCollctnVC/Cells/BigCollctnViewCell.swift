//
//  BigCollctnViewCell.swift
//  CardsOffersUI
//
//  Created by Anant on 4/27/17.
//  Copyright © 2017 Anant. All rights reserved.
//

import UIKit

protocol OfferCell {
    func updateCell()
}

class BigCollctnViewCell: UICollectionViewCell, OfferCell {
   

    @IBOutlet weak var label: UILabel!
     func updateCell() {
            label.text = "Offer 60%"
    }

}


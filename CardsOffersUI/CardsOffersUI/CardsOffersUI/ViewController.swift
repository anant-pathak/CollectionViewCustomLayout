//
//  ViewController.swift
//  CardsOffersUI
//
//  Created by Anant on 4/27/17.
//  Copyright © 2017 Anant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var vc: OfferCollectionViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
          }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: Any) {
        vc = OfferCollectionViewController()
        self.present(vc, animated: true, completion: nil)

    }

}


//
//  OfferCollectionViewController.swift
//  CardsOffersUI
//
//  Created by Anant on 4/27/17.
//  Copyright © 2017 Anant. All rights reserved.
//

import UIKit

class OfferCollectionViewController: UIViewController {

    var cellBigIdent: String{
        return String(describing: BigCollctnViewCell.self)
    }
    var cellSmallIden: String{
        return  String(describing: SmallCollectionViewCell.self)
    }
    
    @IBOutlet weak var cardCollectionView: UICollectionView!
   // var cardCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
        
      //  cardCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout())
      //  cardCollectionView.collectionViewLayout = flowLayout()
        //Cells:
      //  view.addSubview(cardCollectionView)
     //   cardCollectionView.translatesAutoresizingMaskIntoConstraints = false
        cardCollectionView.backgroundColor = UIColor.blue
        cardCollectionView.contentInset = UIEdgeInsets(top: 23, left: 5, bottom: 10, right: 5)

        let cellBig = UINib(nibName: cellBigIdent, bundle: nil)
        let cellSmall = UINib(nibName: cellSmallIden, bundle: nil)
        cardCollectionView.register(cellBig , forCellWithReuseIdentifier: cellBigIdent)
        cardCollectionView.register(cellSmall, forCellWithReuseIdentifier: cellSmallIden)
        cardCollectionView.dataSource = self
        cardCollectionView.delegate = self
        
        if let layout = cardCollectionView.collectionViewLayout as? OfferCardLayout{
            layout.delegate = self
        }
        
       // setConstraints(child: cardCollectionView)
        // Do any additional setup after loading the view.
    }

    func setConstraints(child _child: UIView){
        NSLayoutConstraint.activate([
            _child.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8),
            _child.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -8),
            _child.leadingAnchor.constraint(equalTo: (_child.superview?.leadingAnchor)!, constant: 8),
        _child.trailingAnchor.constraint(equalTo: (_child.superview?.trailingAnchor)!, constant: -8)
            ])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension OfferCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: OfferCell!
    
        if(indexPath.item == 0){
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellBigIdent, for: indexPath) as?  BigCollctnViewCell
            
        }
        else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellSmallIden, for: indexPath) as? SmallCollectionViewCell
        }
        cell.updateCell()
        // var layout =    (collectionView.collectionViewLayout as? OfferCardLayout)
        return cell as! UICollectionViewCell
       
     //   let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  , for: indexPath)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        var sz = (collectionViewLayout as! UICollectionViewFlowLayout).itemSize
//        if(indexPath.item == 0){
//            sz.width = 159
//            sz.height = 159
//            
//        }
//        else{
//            sz.width = 77
//            sz.height = 77
//        }
//        
//        return sz
//        
//    }
//    
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
////        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
////    }
//    
//    func flowLayout()-> UICollectionViewFlowLayout{
//        let flwLayout = UICollectionViewFlowLayout()
//        flwLayout.scrollDirection = .vertical
//        flwLayout.minimumInteritemSpacing = 5
//        flwLayout.sectionInset = UIEdgeInsets(top: 100, left: 100, bottom: 50, right: 50)
//       // flwLayout.invalidateLayout()
//        
//        return flwLayout
//    }
//    
    
    
    
}

extension OfferCollectionViewController: OfferCardLayoutDelegate{
    func collectionView(collectionView:UICollectionView, heightForCell indexPath: IndexPath,
                        withWidth:CGFloat) -> CGFloat{
        if(indexPath.item == 0){
            return 159
        }
        else {
            return 77
        }
    }
}

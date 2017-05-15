//
//  OfferCardLayout.swift
//  CardsOffersUI
//
//  Created by Anant on 4/28/17.
//  Copyright © 2017 Anant. All rights reserved.
//

import UIKit

protocol OfferCardLayoutDelegate {
    // 1
    func collectionView(collectionView:UICollectionView, heightForCell indexPath: IndexPath,
                        withWidth:CGFloat) -> CGFloat
   }

class OfferCardLayout: UICollectionViewLayout {
    var delegate: OfferCardLayoutDelegate!
    var cellPadding: CGFloat = 2.5
    var cache: [UICollectionViewLayoutAttributes] = []
    var contentHeight: CGFloat = 0.0
    var contentWidth: CGFloat{
        let insets = collectionView?.contentInset
        return (collectionView?.bounds.width)! - ((insets?.left)! + (insets?.right)!)
    }
    
    override func prepare() {
        if cache.isEmpty{
            //1st row:
            var columnWidth: [CGFloat] = [contentWidth/2,contentWidth/4,contentWidth/4]
            let xOffset: [CGFloat] = [0, columnWidth[0], ( columnWidth[0] + columnWidth[1] )]
            var yOffset: [CGFloat] = [0,0,0]
            createAttributes(startItem: 0, items: 5, totalCol: 3, yOffset: &yOffset , xOffset: xOffset, columnWidth: columnWidth)
            //2nd row:
            let singleColumnwidth = contentWidth / CGFloat(4)
            let columnWidth2 = [CGFloat](repeating: singleColumnwidth ,count:4)
            var xOffset2: [CGFloat] = []
            for i in 0..<4{
                xOffset2.append(CGFloat(i) * singleColumnwidth)
            }
            var yOffset2 =  [CGFloat](repeating: yOffset[0], count: 4)
            createAttributes(startItem: 5, items: 4, totalCol: 4, yOffset: &yOffset2, xOffset: xOffset2, columnWidth: columnWidth2)
        }
    }
    
    func createAttributes(startItem _startItem: Int ,items _totalItems: Int,totalCol _totalCol: Int , yOffset _yOffset: inout [CGFloat], xOffset _xOffset:[CGFloat], columnWidth _columnWidth: [CGFloat]){
        var item = _startItem
        var column = 0
        let totalNumOfItems = _totalItems + _startItem
        while item < totalNumOfItems{
            if(_yOffset[column] > _yOffset[(column + 1)%_totalCol]){
                column = (column + 1) % _totalCol
                continue //check logic again. when the large big cell is the last one
            }
            let indexPath = IndexPath(item: item, section: 0)
            let width = _columnWidth[column] - 2*cellPadding
            let cellHeight = delegate.collectionView(collectionView: collectionView!, heightForCell: indexPath , withWidth: width)
            let height = cellPadding + cellHeight + cellPadding
           var frame = CGRect(x: _xOffset[column], y: _yOffset[column], width: _columnWidth[column], height: height)
            frame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            cache.append(attributes)
            contentHeight = max(contentHeight, frame.maxY )
            _yOffset[column] = _yOffset[column] + height
            column = (column + 1) % _totalCol
            item += 1
        }
    }
    
    override var collectionViewContentSize: CGSize{
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cache
    }
    
    
    
    
}

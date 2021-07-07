//
//  RibbonCollectionViewCell.swift
//  Component
//
//  Created by Eesa Jacobs on 2021/07/06.
//

import UIKit

class RibbonCollectionViewCell: UICollectionViewCell {
    
    lazy var ribbon: RibbonView = .loadFromNib()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(ribbon)
        ribbon.translatesAutoresizingMaskIntoConstraints = false
        configureRibbonConstraints()
    }
    
    private func configureRibbonConstraints(){
        let leading = NSLayoutConstraint(item: ribbon, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 0)
        
        let trailing = NSLayoutConstraint(item: ribbon, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1.0, constant: 0)
        
        let top = NSLayoutConstraint(item: ribbon, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 0)
        
        let bottom = NSLayoutConstraint(item: ribbon, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        contentView.addConstraints([leading, trailing, top, bottom])
    }
    
}

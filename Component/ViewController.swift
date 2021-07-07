//
//  ViewController.swift
//  Component
//
//  Created by Eesa Jacobs on 2021/07/06.
//

import UIKit

class ViewController: UIViewController{
    
    lazy var collectionView: UICollectionView = {
        var flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RibbonCollectionViewCell.self, forCellWithReuseIdentifier: "ribbonCell")
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        configureCollectionViewConstraints()
    }
    
    private func configureCollectionViewConstraints(){
        let leading = NSLayoutConstraint(item: collectionView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0)
        
        let trailing = NSLayoutConstraint(item: collectionView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0)
        
        let centerY = NSLayoutConstraint(item: collectionView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0)
        
        let height = NSLayoutConstraint(item: collectionView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200)
        
        view.addConstraints([leading, trailing, centerY, height])
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ribbonCell", for: indexPath) as? RibbonCollectionViewCell{
            if(indexPath.row == 0) {
                cell.ribbon.makeFrontAndRearEndRounded()
                cell.ribbon.filledPercentage = 1
            } else{
                //this is just a test
//                if (indexPath.row == 1){
//                    cell.ribbon.filledPercentage = 0.5
//
                cell.ribbon.isRearEndArcRequired = true
                cell.ribbon.makeFrontEndRounded()
            }
            
            return cell
            
            //TODO: find a way to loop through all items, have them configure filledPercentage one after the other to achieve a nice seemless animation of the progress being filled
        }
        
        return UICollectionViewCell(frame: .zero)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width / CGFloat(collectionView.numberOfItems(inSection: indexPath.section))
        return CGSize(width: width, height: width/2)
    }
}

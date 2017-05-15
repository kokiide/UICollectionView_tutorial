//
//  ViewController.swift
//  UICollectionView Tutorial
//
//  Created by Koki Ide on 2017/05/15.
//  Copyright © 2017 kokiide. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var images = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5"), UIImage(named: "6"), UIImage(named: "7")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupCollectionView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Initializing a collectionview and adding it to the current VC's view
    func setupCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        
        //register ColorCollectionViewCell with ReuseIdentifire colorCell
        
        collectionView.register(ColorCollectionViewCell.self, forCellWithReuseIdentifier: "colorCell")
        //change to white later
        collectionView.backgroundColor = UIColor.green
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    //in this Delegate method we are Specifying the number of sections in the collectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    //Specifying the number of cells in the given section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    
    //only setting up the cells. Cell data setup on different method underneath to make speed faster
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //using of the ReuseIdentifire by dequeueReusableCell...  now pass this to CCVC by saying as! CCVC
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colorCell", for: indexPath) as! ColorCollectionViewCell
        //call cell's awakeFromNib method so our imageview gets setup
        cell.awakeFromNib()
        return cell
    }
    
    //populate with the image type: willdisplaycell and chose top one. will be called after "passing CCVC by using as!" method but before the cells are displayed
    
    
    //setting up the data of the cells
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let colorCell = cell as! ColorCollectionViewCell
        colorCell.colorImageView.image = images[indexPath.row]
    }
    
    //specifying the size of the cells. add UICollectionViewDelegateFlowLayout to use this. type cgsize
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
}

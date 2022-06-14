//
//  ShowingImageView.swift
//  Bravo
//
//  Created by Ahmed on 2/4/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import UIKit
import Zoomy
import Loaf
import SDWebImage
class ShowingImageView: UIViewController , UICollectionViewDataSource ,UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var pageController_OT: UIPageControl!
    @IBOutlet var ImageCollection_OT: UICollectionView!
    
    @IBOutlet weak var back_OT: UIButton!
    
    @IBOutlet weak var saveImage_OT: UIButton!{
        didSet{
            self.saveImage_OT.layer.cornerRadius = 8
            saveImage_OT.setTitle("Save".localized(), for: .normal)
        }
    }
    
    var GallaryState = false
    var selectedItem = 0
    var images:[String]? = nil 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageController_OT.numberOfPages = images?.count ?? 0
        
        self.ImageCollection_OT.reloadData()
        
        var swipeup = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(gesture:)))
        swipeup.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeup)
        
        var swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(gesture:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.down:
                print("Swiped down")
                let transition = CATransition()
                transition.duration = 0.5
                transition.type = CATransitionType.push
                transition.subtype = CATransitionSubtype.fromBottom
                transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
                view.window!.layer.add(transition, forKey: kCATransition)
                
                self.dismiss(animated: true, completion: nil)
                
            case UISwipeGestureRecognizer.Direction.up:
                print("Swiped up")
                let transition = CATransition()
                transition.duration = 0.5
                transition.type = CATransitionType.push
                transition.subtype = CATransitionSubtype.fromTop
                transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
                view.window!.layer.add(transition, forKey: kCATransition)
                
                self.dismiss(animated: true, completion: nil)
                
            default:
                break
            }
        }
    }
    
    @IBAction func exitAC(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images?.count ?? 0
    }
    
    @IBAction func sidePuton_AC(_ sender: Any) {
        if self.saveImage_OT.isHidden == true{
            self.saveImage_OT.isHidden = false
        }else{
            self.saveImage_OT.isHidden = true
        }
    }
    
    @IBAction func saveImage_AC(_ sender: Any) {
        
  if let url = URL(string: self.images?[self.selectedItem] ?? ""),
               let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
               UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                    }
        
        
                self.saveImage_OT.isHidden = true
        Loaf("downloaded successfully", state: .success, sender: self).show()

        

        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShowImageCell", for: indexPath)as! ShowImageCell

        
        cell.postImage.sd_setImage(with: URL(string: images![indexPath.item]), placeholderImage: UIImage(named: "placeholder"))
        addZoombehavior(for: cell.postImage)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageController_OT.currentPage = indexPath.item
        self.selectedItem = indexPath.item
        print(self.selectedItem)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.width) , height: (collectionView.frame.height ))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
       
    }
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {

    }
}

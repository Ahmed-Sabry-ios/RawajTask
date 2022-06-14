//
//  ArticlesCell.swift
//  RawajTask
//
//  Created by ProMap on 13/06/2022.
//

import UIKit

class ArticlesCell: UITableViewCell {
    
    
    @IBOutlet weak var MainView_OT: UIView!
    
    
    @IBOutlet weak var ArticleTypeLB_OT: UILabel!
    @IBOutlet weak var ArticleNameLB_OT: UILabel!
    @IBOutlet weak var ArticleDateLB_OT: UILabel!
    
    @IBOutlet weak var ArticleImage_OT: UIImageView!
    
    
    
    
    var Article:Result?{
        didSet{
            setData()
        }
    }
    
    var openImage:(()->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUI()
    }
    func setUI() {
        MainView_OT.mirageCardrounded()
        ArticleTypeLB_OT.doveGray12()
        ArticleNameLB_OT.pictonBlueBold14()
        ArticleDateLB_OT.LynchBlack9()
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        ArticleImage_OT.isUserInteractionEnabled = true
        ArticleImage_OT.addGestureRecognizer(tapGestureRecognizer)
        
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        self.openImage?()
        
    }
    
    func setData() {
        
        ArticleTypeLB_OT.text = Article?.section ?? ""
        ArticleNameLB_OT.text = Article?.title ?? ""
        ArticleDateLB_OT.text = Article?.publishedDate ?? ""
        
        if (Article?.media?.count ?? 0) != 0{
            if let mediadata = Article?.media?[((Article?.media?.count ?? 1) - 1)]{
                
                ArticleImage_OT.sd_setImage(with: URL(string: mediadata.mediaMetadata?.last?.url ?? ""))
                
            }
        
           
        }
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  ArticleDetailsView.swift
//  RawajTask
//
//  Created by ProMap on 14/06/2022.
//

import UIKit
import RxSwift
import RxCocoa

class ArticleDetailsView: COCHBaseViewController {
    
    @IBOutlet weak var backBT_OT: UIButton!
    
    
    @IBOutlet weak var ArticleImage_OT: UIImageView!
    @IBOutlet weak var bylineLB_OT: UILabel!
    @IBOutlet weak var titleLB_OT: UILabel!
    @IBOutlet weak var abstractView_OT: UITextView!
    
    
    
    let disposebag = DisposeBag()
    var Article:Result?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(Article)
        subscribeToMenuButton()
        setUI()
    }
    func setUI() {
        ArticleImage_OT.roundCorners(corners: .allCorners, radius: ArticleImage_OT.frame.height / 8)
        bylineLB_OT.white15()
        titleLB_OT.whiteBlack22()
        abstractView_OT.textColor = Lynch
        abstractView_OT.font = UIFont(name:AppFontName.Regular ,size: 16)
        
        
        
        if (Article?.media?.count ?? 0) != 0{
            if let mediadata = Article?.media?[((Article?.media?.count ?? 1) - 1)]{
             ArticleImage_OT.sd_setImage(with: URL(string: mediadata.mediaMetadata?.last?.url ?? ""))
            }
         }
        bylineLB_OT.text = Article?.byline ?? ""
        titleLB_OT.text = Article?.title ?? ""
        abstractView_OT.text = Article?.abstract ?? ""
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        ArticleImage_OT.isUserInteractionEnabled = true
        ArticleImage_OT.addGestureRecognizer(tapGestureRecognizer)
        
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if let vc = UIStoryboard.load(.main, identifier: "ShowingImageView") as? ShowingImageView {
            
            if (Article?.media?.count ?? 0) != 0{
                if let mediadata = Article?.media?[((Article?.media?.count ?? 1) - 1)]{
                    
                    vc.images = [mediadata.mediaMetadata?.last?.url ?? ""]
                    
                }}
           vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
        }
        
    }
    
    func subscribeToMenuButton()  {
        self.backBT_OT.rx.tap
            .throttle(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self](_) in
                guard let self = self else { return }
                self.dismiss(animated: true)

        }).disposed(by: disposebag)
    }

   

}

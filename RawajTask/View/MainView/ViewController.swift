//
//  ViewController.swift
//  RawajTask
//
//  Created by ProMap on 13/06/2022.
//

import UIKit
import Loaf
import KRProgressHUD
import RxSwift
import RxCocoa
class ViewController: COCHBaseViewController {
    
    @IBOutlet weak var titleLB_OT: UILabel!
    
    @IBOutlet weak var ArticleLIst_OT: UITableView!
    
    var mostPopular:MainViewModel? = MainViewModel()
    
    let disposebag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        self.mostPopular?.getData(query: "7")
        self.subscribeToResponse()
    }
    func setupUI(){
        titleLB_OT.whiteBlack22()
        titleLB_OT.text = "Article"
        
        ArticleLIst_OT.register(UINib(nibName: "ArticlesCell", bundle: nil), forCellReuseIdentifier: "ArticlesCell")
        
        
        
    }
    
}
//extension ViewController:UISearchBarDelegate{
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        print(searchTF_OT.text)
//        searchTF_OT.resignFirstResponder()
//
//    }
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        self.searchTF_OT.text = ""
//
//        searchTF_OT.resignFirstResponder()
//
//    }
//
//}



extension ViewController{
    
    func subscribeToResponse() {
        self.mostPopular?.Searchobservable.bind(to:self.ArticleLIst_OT.rx.items(cellIdentifier:"ArticlesCell", cellType:ArticlesCell.self)) { row, ArticleData, cell in
            print(row)
            cell.Article = ArticleData
            cell.openImage = {[weak self] in
                guard let self = self else {return}
                if let vc = UIStoryboard.load(.main, identifier: "ShowingImageView") as? ShowingImageView {
                    
                    if (ArticleData.media?.count ?? 0) != 0{
                        if let mediadata = ArticleData.media?[((ArticleData.media?.count ?? 1) - 1)]{
                            
                            vc.images = [mediadata.mediaMetadata?.last?.url ?? ""]
                            
                        }
                        
                        
                    }
                    
                    
                    
                    vc.modalPresentationStyle = .overFullScreen
                    self.present(vc, animated: true, completion: nil)
                }
            }
            
            
        }.disposed(by: disposebag)
        
        
        self.ArticleLIst_OT.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                let cell = self?.ArticleLIst_OT.cellForRow(at: indexPath) as? ArticlesCell
                
                if let vc = UIStoryboard.load(.main, identifier: "ArticleDetailsView") as? ArticleDetailsView {
                    vc.Article = cell?.Article
                    
                    vc.modalPresentationStyle = .overFullScreen
                    self?.present(vc, animated: true, completion: nil)
                }
                
                
                
            }).disposed(by: disposebag)
        
        self.mostPopular?.loadingbehavior.subscribe (onNext: { (isLoading) in
            if isLoading {
                KRProgressHUD.show()
                
            } else {
                KRProgressHUD.dismiss()
            }
        }).disposed(by: disposebag)
        
        
        
    }
}

extension ViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

//
//  MainViewModel.swift
//  RawajTask
//
//  Created by ProMap on 13/06/2022.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire
import Loaf
class MainViewModel {


    var loadingbehavior = BehaviorRelay<Bool>(value: false)
   private var SearchSubject = PublishSubject<[Result]>()
var Searchobservable:Observable<[Result]>{
        return SearchSubject
    }


    func getData(query:String) {
        loadingbehavior.accept(true)
        let params = [
            "api-key": Api_Router.AccessKey

        ] as [String : Any]
       
        APIServices.instance.getData(url: "\(query).json", method: .get, params: params, encoding: URLEncoding.default, headers: nil) { [weak self](TimesModel: NytimesModel?, baseErrorModel: NytimesModel?, error) in
            guard let self = self else { return }
            self.loadingbehavior.accept(false)
            if let error = error {
                // network error
                print(error.localizedDescription)
            } else if let baseErrorModel = baseErrorModel {

            } else {
                guard let Times = TimesModel else { return }
                print(Times)
               if let results = Times.results{
                self.SearchSubject.onNext(results)
                }
                
            }
        }
    }



}

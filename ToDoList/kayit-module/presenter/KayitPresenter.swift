//
//  KayitPresenter.swift
//  ToDoList
//
//  Created by Yagizozturk on 14.10.2022.
//

import Foundation

class urunKayitPresenter : ViewToPresenterUrunKayitProtocol {
    
    var urunKayitInteractor : PresenterToInteractorUrunKayitProtocol?
    
    func ekle(yapilacak_is : String) {
        urunKayitInteractor?.kisiEkle(yapilacak_is: yapilacak_is)
    }
}

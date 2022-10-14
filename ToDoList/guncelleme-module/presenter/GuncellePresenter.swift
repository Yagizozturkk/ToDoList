//
//  GuncellePresenter.swift
//  ToDoList
//
//  Created by Yagizozturk on 14.10.2022.
//

import Foundation

class UrunDetayPresenter : ViewToPresenterUrunDetayProtocol {
    var urunDetayInteractor: PresenterToInteractorUrunDetayProtocol?
    
    func guncelle(yapilacak_id: Int, yapilacak_is: String) {
        urunDetayInteractor?.urunGuncelle(yapilacak_id: yapilacak_id, yapilacak_is: yapilacak_is)
    }
}

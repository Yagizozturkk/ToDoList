//
//  AnasayfaPresenter.swift
//  ToDoList
//
//  Created by Yagizozturk on 14.10.2022.
//

import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol {
    
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func yapilacakIsYukle() {
        anasayfaInteractor?.yapilacakIsleriAl()
    }
    
    func ara(aramaKelimesi: String) {
        anasayfaInteractor?.yapilacakIsAra(aramaKelimesi: aramaKelimesi)
    }
    
    func sil(yapilacak_id: Int) {
        anasayfaInteractor?.yapilacakIsSil(yapilacak_id: yapilacak_id)
    }
}

extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yapilacakIsListesi : [Alinacaklar]) {
        anasayfaView?.vieweVeriGonder(yapilacakIsListesi : yapilacakIsListesi)
    }
}

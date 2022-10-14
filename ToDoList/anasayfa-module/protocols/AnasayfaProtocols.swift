//
//  AnasayfaProtocols.swift
//  ToDoList
//
//  Created by Yagizozturk on 14.10.2022.
//

import Foundation

protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor:PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView:PresenterToViewAnasayfaProtocol? {get set}
    
    func yapilacakIsYukle()
    func ara(aramaKelimesi : String)
    func sil(yapilacak_id : Int)
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter:InteractorToPresenterAnasayfaProtocol? {get set}
    
    func yapilacakIsleriAl()
    func yapilacakIsAra(aramaKelimesi:String)
    func yapilacakIsSil(yapilacak_id:Int)
}

protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yapilacakIsListesi : [Alinacaklar])
}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yapilacakIsListesi : [Alinacaklar])
}

protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref : AnasayfaVC)
}

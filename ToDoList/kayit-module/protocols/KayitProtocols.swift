//
//  KayitProtocols.swift
//  ToDoList
//
//  Created by Yagizozturk on 14.10.2022.
//

import Foundation

protocol ViewToPresenterUrunKayitProtocol {
    var urunKayitInteractor:PresenterToInteractorUrunKayitProtocol? {get set}
    
    func ekle(yapilacak_is : String)
}

protocol PresenterToInteractorUrunKayitProtocol {
    func kisiEkle(yapilacak_is : String)
}

protocol PresenterToRouterUrunKayitProtocol {
    static func createModule(ref : KayitViewController)
}

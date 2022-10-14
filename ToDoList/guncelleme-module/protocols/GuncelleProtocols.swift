//
//  GuncelleProtocols.swift
//  ToDoList
//
//  Created by Yagizozturk on 14.10.2022.
//

import Foundation


protocol ViewToPresenterUrunDetayProtocol {
    var urunDetayInteractor: PresenterToInteractorUrunDetayProtocol? {get set}
    
    func guncelle(yapilacak_id : Int , yapilacak_is : String)
}

protocol PresenterToInteractorUrunDetayProtocol {
    func urunGuncelle(yapilacak_id : Int , yapilacak_is : String)
}

protocol PresenterToRouterUrunDetayProtocol {
    static func createModule(ref : DetayViewController)
}

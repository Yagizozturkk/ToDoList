//
//  KayitRouter.swift
//  ToDoList
//
//  Created by Yagizozturk on 14.10.2022.
//

import Foundation

class UrunKayitRouter : PresenterToRouterUrunKayitProtocol {
    static func createModule(ref : KayitViewController) {
        ref.urunKayitPresenterNesnesi = urunKayitPresenter()
        ref.urunKayitPresenterNesnesi?.urunKayitInteractor = urunKayitInteractor()
    }
}

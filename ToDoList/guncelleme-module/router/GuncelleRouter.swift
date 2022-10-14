//
//  GuncelleRouter.swift
//  ToDoList
//
//  Created by Yagizozturk on 14.10.2022.
//

import Foundation

class UrunDetayRouter : PresenterToRouterUrunDetayProtocol {
    static func createModule(ref: DetayViewController) {
        ref.urunDetayPresenterNesnesi  = UrunDetayPresenter()
        ref.urunDetayPresenterNesnesi?.urunDetayInteractor = UrunDetayInteractor()
    }
}

//
//  KayitInteractor.swift
//  ToDoList
//
//  Created by Yagizozturk on 14.10.2022.
//

import Foundation

class urunKayitInteractor : PresenterToInteractorUrunKayitProtocol {
    
    let db : FMDatabase?
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacakislerdb.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    func kisiEkle(yapilacak_is : String) {
        db?.open()
        
        do{
            try db!.executeUpdate("INSERT INTO yapilacaklar (yapilacak_is) VALUES (?)", values: [yapilacak_is])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
}

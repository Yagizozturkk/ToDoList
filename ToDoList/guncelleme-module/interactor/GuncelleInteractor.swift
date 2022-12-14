//
//  GuncelleInteractor.swift
//  ToDoList
//
//  Created by Yagizozturk on 14.10.2022.
//

import Foundation

class UrunDetayInteractor : PresenterToInteractorUrunDetayProtocol {
    let db : FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacakislerdb.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    
    func urunGuncelle(yapilacak_id : Int, yapilacak_is : String) {
        db?.open()
        
        do{
            try db!.executeUpdate("UPDATE yapilacaklar SET yapilacak_is = ? WHERE yapilacak_id = ?", values: [yapilacak_is, yapilacak_id])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}

//
//  AnasayfaInteractor.swift
//  ToDoList
//
//  Created by Yagizozturk on 14.10.2022.
//

import Foundation

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    let db: FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacakislerdb.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    
    func yapilacakIsleriAl() {
        var liste = [Alinacaklar]()
        
        db?.open()
        
        do{
            let r = try db!.executeQuery("SELECT * FROM yapilacaklar", values: nil)
            
            while r.next() {
                let yapilacakIs = Alinacaklar(yapilacak_is: r.string(forColumn: "yapilacak_is")!, yapilacak_id: Int(r.string(forColumn: "yapilacak_id"))!)
                liste.append(yapilacakIs)
            }
            
            anasayfaPresenter?.presenteraVeriGonder(yapilacakIsListesi : liste)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func yapilacakIsAra(aramaKelimesi: String) {
        var liste = [Alinacaklar]()
        
        db?.open()
        
        do{
            let r = try db!.executeQuery("SELECT * FROM yapilacaklar WHERE yapilacak_is like '%\(aramaKelimesi)%'", values: nil)
            
            while r.next() {
                let yapilacak = Alinacaklar(yapilacak_is: r.string(forColumn: "yapilacak_is")!, yapilacak_id: Int(r.string(forColumn: "yapilacak_id"))!)
                liste.append(yapilacak)
            }
            
            anasayfaPresenter?.presenteraVeriGonder(yapilacakIsListesi : liste)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func yapilacakIsSil(yapilacak_id : Int) {
        db?.open()
        
        do{
            try db!.executeUpdate("DELETE FROM yapilacaklar WHERE yapilacak_id = ?", values: [yapilacak_id])
            yapilacakIsleriAl()
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}

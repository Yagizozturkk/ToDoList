//
//  DetayViewController.swift
//  ToDoList
//
//  Created by Yagizozturk on 14.10.2022.
//

import UIKit

class DetayViewController: UIViewController {

    @IBOutlet weak var urunAdiTF: UITextField!
    
    var yapilacakIsListesi : Alinacaklar?
    var urunDetayPresenterNesnesi : ViewToPresenterUrunDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UrunDetayRouter.createModule(ref: self)
        
        if let y = yapilacakIsListesi {
            urunAdiTF.text = y.yapilacak_is
        }
    }
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let urunAdi = urunAdiTF.text , let y = yapilacakIsListesi {
            urunDetayPresenterNesnesi?.guncelle(yapilacak_id: y.yapilacak_id! , yapilacak_is: urunAdi)
        }
    }
    
}

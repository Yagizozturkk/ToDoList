//
//  KayitViewController.swift
//  ToDoList
//
//  Created by Yagizozturk on 14.10.2022.
//

import UIKit

class KayitViewController: UIViewController {

    @IBOutlet weak var urunAdiTF: UITextField!
    
    var urunKayitPresenterNesnesi : ViewToPresenterUrunKayitProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UrunKayitRouter.createModule(ref: self)
    }
    
    @IBAction func buttonKaydet(_ sender: Any) {
        if let yapilacakIs = urunAdiTF.text {
            urunKayitPresenterNesnesi?.ekle(yapilacak_is: yapilacakIs)
        }
    }
    
}

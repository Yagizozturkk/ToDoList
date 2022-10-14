//
//  ViewController.swift
//  ToDoList
//
//  Created by Yagizozturk on 14.10.2022.
//

import UIKit

class AnasayfaVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var AlinacaklarTableView: UITableView!
    
    var yapilacakIsListesi = [Alinacaklar]()
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?

    override func viewDidLoad() {
        super.viewDidLoad() 
        searchBar.delegate = self
        AlinacaklarTableView.delegate = self
        AlinacaklarTableView.dataSource = self
        
        veritabaniKopyala()
        
        AnasayfaRouter.createModule(ref: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.yapilacakIsYukle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetayVC" {
            if let yapilacakIs = sender as? Alinacaklar {
                let gidilecekVC = segue.destination as! DetayViewController
                gidilecekVC.yapilacakIsListesi = yapilacakIs
            }
        }
    }
    
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "yapilacakislerdb", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacakislerdb.sqlite")
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("Veritabani daha once kopyalanmis.")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{
                print(error)
            }
        }
    }
}

extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yapilacakIsListesi : [Alinacaklar]) {
        self.yapilacakIsListesi = yapilacakIsListesi
        self.AlinacaklarTableView.reloadData()
    }
}

extension AnasayfaVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.ara(aramaKelimesi: searchText)
    }
}

extension AnasayfaVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yapilacakIsListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yapilacakIs = yapilacakIsListesi[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "alinacakCell") as! TableViewCellHucre
        hucre.AlinacakBilgiLabel.text = "\(yapilacakIs.yapilacak_is!)"
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yapilacakIs = yapilacakIsListesi[indexPath.row]
        performSegue(withIdentifier: "toDetayVC", sender: yapilacakIs)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){(contextualAction,view,bool) in
            let yapilacakIs = self.yapilacakIsListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yapilacakIs.yapilacak_is!) silinsin mi?", preferredStyle: .alert)
            //
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.anasayfaPresenterNesnesi?.sil(yapilacak_id: yapilacakIs.yapilacak_id!)
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}

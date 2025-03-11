//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Burak Kaymak on 9.02.2025.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Bilindiği üzere burası uygulama çalışınca yapılacak ilk hamledir.
        
        
        //storedName değişkenine name ismi ile kaydedilmiş objeyi ata demektir.
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
      //  nameLabel.text = storedName (Eğer bunu kullanırsam any olan bir objeyi string olan bir objeye eşitlemeye çalışırım.
      //Dolayısıyla if let kullanmam gerekecek.
        
        if let newName = storedName as? String { // String yapabilirsen anlamında as? kullanılır.
            nameLabel.text = "Name : \(newName)"
        }
        
        if let newBirthday = storedBirthday as? String {
            birthdayLabel.text = "Birthday : \(newBirthday)"
        }
        
        
        
    
    }
    
    @IBOutlet weak var nameTextfield: UITextField!
    
    @IBOutlet weak var birthdayTextfield: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    
    
    @IBAction func saveClicked(_ sender: Any) {
        
        
        //Girilen textfield'ı name key'i adı altında kaydet anlamına gelir. Buradan viewDidload kısmına gidilmelidir.
        UserDefaults.standard.set(nameTextfield.text!, forKey: "name")
        UserDefaults.standard.set(birthdayTextfield.text!, forKey: "birthday")
        
        nameLabel.text = "Name : \(nameTextfield.text!)"
        birthdayLabel.text = "Birthdhay : \(birthdayTextfield.text!)"
                
    }
    
    
    @IBAction func deleteClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if storedName is String {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name : "
            
        }
        
        if storedBirthday is String{
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday : "
        }
    }
    
    
    
    
}


//
//  NotEkleViewController.swift
//  NotUygulamasi
//
//  Created by Kasım Adalan on 30.07.2019.
//  Copyright © 2019 info. All rights reserved.
//

import UIKit

class NotEkleViewController: UIViewController {
    @IBOutlet weak var textfieldDersAdi: UITextField!
    
    @IBOutlet weak var textfieldNot1: UITextField!
    @IBOutlet weak var textfieldNot2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    
    @IBAction func notEkle(_ sender: Any) {
        
        if let ad=textfieldDersAdi.text,let not1 = textfieldNot1.text,let not2 = textfieldNot2.text{
            
            if let n1 = Int(not1),let n2 = Int(not2){
                notEkle(ders_ad: ad, not1:n1 , not2: n2)
            }
           
        }
        
         
    }
    
    
    
    func notEkle(ders_ad:String,not1:Int,not2:Int){
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/notlar/insert_not.php")!)
        request.httpMethod = "POST"
        let postString = "ders_adi=\(ders_ad)&not1=\(not1)&not2=\(not2)"
        request.httpBody=postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request){data,response,error in
            if error != nil || data == nil{print("hata")
                return}
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]{
                    
                    print(json)
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    
}

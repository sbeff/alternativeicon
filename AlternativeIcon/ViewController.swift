//
//  ViewController.swift
//  AlternativeIcon
//
//  Created by Emanuele Beffa on 18/08/17.
//  Copyright © 2017 Emanuele Beffa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func changeToLight(_ sender: UIButton) {
        self.changeIcon(withName: nil)
        print("[INFO] Imposto l'icona di default")
    }
    
    @IBAction func changeToDark(_ sender: UIButton) {
        self.changeIcon(withName: "xCodingDark")
        print("[INFO] Imposto l'icona alternativa")
    }
    
    @IBAction func check(_ sender: UIButton) {
        self.checkCurrentIcon()
    }
    
    func changeIcon(withName name: String?) {
        if #available(iOS 10.3, *) {
            guard UIApplication.shared.supportsAlternateIcons == true else {
                print("[INFO] L'app non supporta le icone alternative")
                return
            }
            
            UIApplication.shared.setAlternateIconName(name, completionHandler: { error in
                if error != nil {
                    print(error!.localizedDescription)
                }
            })
        } else {
            print("[INFO] L'icona alternativa non può essere impostata se la versione di iOS è inferiore alla 10.3")
        }
    }
    
    func checkCurrentIcon() {
        if #available(iOS 10.3, *) {
            guard UIApplication.shared.supportsAlternateIcons == true else {
                print("[INFO] L'app non supporta le icone alternative")
                return
            }
            
            if let icon = UIApplication.shared.alternateIconName {
                print("[INFO] L'icona alternativa in uso è: \(icon)")
            } else {
                print("[INFO] L'icona alternativa non è in uso")
            }
        } else {
            print("[INFO] L'icona alternativa non può essere impostata se la versione di iOS è inferiore alla 10.3")
        }
    }
}

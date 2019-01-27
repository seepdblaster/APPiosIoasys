//
//  LoginViewController.swift
//  APPioasys
//
//  Created by Bruno Rodrigues  on 22/01/19.
//  Copyright © 2019 Bruno Rodrigues. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    @IBOutlet weak var EmailTextField : UITextField!
    @IBOutlet weak var SenhaTextField : UITextField!
    @IBAction func EntrarLogIn(){
        var email = EmailTextField.text
        var senha = SenhaTextField.text
        
        Alamofire.request("http://empresas.ioasys.com.br/api/v1/users/auth/sign_in", method: .post, parameters: ["email": email, "password": senha], encoding: JSONEncoding.default, headers: ["Content-Type": "application/json"]).responseJSON {(response) in
            let success = (response.result.value as? [String : Any])?["success"] as? Bool
            if success ?? false {
                var headers = response.response?.allHeaderFields as? [String : Any]
                var tokens = headers?["access-token"] as! String
                UserDefaults.standard.set(tokens, forKey: "token")
                var id = headers?["uid"] as! String
                UserDefaults.standard.set(id, forKey: "id")
                var client = headers?["client"] as! String
                UserDefaults.standard.set(client, forKey: "client")
                Alamofire.request("http://empresas.ioasys.com.br/api/v1/enterprises", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Content-Type": "application/json", "uid": id, "access-token": tokens, "client": client]).responseData(completionHandler: { (empresasResponse) in
                    guard let empresas = try?JSONDecoder().decode(rapper.self, from: empresasResponse.data!) else { return }
                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyBoard.instantiateViewController(withIdentifier: "3") as? UINavigationController
                    let tableViewController = viewController?.viewControllers[0] as? TableViewController
                    tableViewController?.listaEmpresas = empresas.arrayEmpresas
                    self.present(viewController!, animated: true, completion: nil)
                    
                })
                
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

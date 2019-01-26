//
//  InfoEmpresasViewController.swift
//  APPioasys
//
//  Created by Bruno Rodrigues  on 24/01/19.
//  Copyright © 2019 Bruno Rodrigues. All rights reserved.
//

import UIKit

class InfoEmpresasViewController: UIViewController {


    @IBOutlet weak var infoEmpresa: UILabel!
    @IBOutlet weak var imagemEmpresa: UIImageView!
    var infoEmpresas: Empresas?
    func setUp (){
        var infos = infoEmpresas?.descricao
        infoEmpresa.text = infos
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

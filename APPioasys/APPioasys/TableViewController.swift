//
//  TableViewController.swift
//  APPioasys
//
//  Created by Bruno Rodrigues  on 23/01/19.
//  Copyright © 2019 Bruno Rodrigues. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaEmpresas!.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var celula = tableView.dequeueReusableCell(withIdentifier: "InfoStoryBoard") as? TableCells
        celula?.labelNomeEmpresa.text = listaEmpresas?[indexPath.row].nome
        celula?.labelTipoEmpresa.text = listaEmpresas?[indexPath.row].tipo.nome
        celula?.labelCidadeEmpresa.text = listaEmpresas?[indexPath.row].country
        return celula!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "6") as? InfoEmpresasViewController
        viewController?.infoEmpresas = listaEmpresas?[indexPath.row]
        self.navigationController?.pushViewController(viewController!, animated: true)

    }
    
    @IBOutlet weak var lista : UITableView!
    
    var listaEmpresas : [Empresas]?
    override func viewDidLoad() {
        super.viewDidLoad()
        lista.delegate = self
        lista.dataSource = self
        
    }

}

//
//  tipoEmpresas.swift
//  APPioasys
//
//  Created by Bruno Rodrigues  on 22/01/19.
//  Copyright © 2019 Bruno Rodrigues. All rights reserved.
//

import Foundation
struct TipoEmpresas : Codable{
    var id : Int
    var nome : String
    init(id: Int, nome: String) {
        self.nome = nome
        self.id = id
    }
    enum CodingKeys : String, CodingKey {
        case id
        case nome = "enterprise_type_name"
    }
}

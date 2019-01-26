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
    enum CodingKeys : String, CodingKey {
        case id
        case nome = "enterprise_type_name"
    }
}

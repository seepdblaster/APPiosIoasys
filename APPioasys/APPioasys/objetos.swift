//
//  objetos.swift
//  APPioasys
//
//  Created by Bruno Rodrigues  on 22/01/19.
//  Copyright © 2019 Bruno Rodrigues. All rights reserved.
//

import Foundation
struct Empresas : Codable{
    var nome : String
    var descricao : String
    var imagem : String
    var country : String
    var tipo : TipoEmpresas
    enum CodingKeys : String, CodingKey{
        case nome = "enterprise_name"
        case descricao = "description"
        case imagem = "photo"
        case country
        case tipo = "enterprise_type"
    }
    init(nome: String, descricao: String, imagem: String, country: String, tipo: TipoEmpresas) {
        self.nome = nome
        self.descricao = descricao
        self.imagem = imagem
        self.country = country
        self.tipo = tipo
    }
}
struct rapper : Codable{
    var arrayEmpresas : [Empresas]
    enum CodingKeys : String, CodingKey{
        case arrayEmpresas = "enterprises"
    }
}

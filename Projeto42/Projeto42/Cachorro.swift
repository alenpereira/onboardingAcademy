//
//  Cachorro.swift
//  Projeto42
//
//  Created by Alessandra Pereira on 10/03/20.
//  Copyright © 2020 Alessandra Pereira. All rights reserved.
//

//import Foundation

class Cachorro {
    var anos: Int
    var meses: Int
    /// Possible values: "pequeno", "médio" or "grande"
    let porte: String
    
    init(anos: Int, meses: Int, tamanho: String) {
        self.anos = anos
        self.meses = meses
        self.porte = tamanho
    }
    
    func anosHumanos() -> Int {
        return anos * 7
    }
    
    func mesesHumanos() -> Int {
        return meses * 7/12
    }
    
    func idadeHumana() -> Int {
        var idadeHumana: Int
        idadeHumana = anosHumanos() + mesesHumanos()

        if porte == "pequeno" {
            idadeHumana = idadeHumana - 7
        } else if porte == "grande" {
            idadeHumana = idadeHumana + 5
        }
        
        return idadeHumana
    }
}

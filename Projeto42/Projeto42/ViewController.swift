//
//  ViewController.swift
//  Projeto42
//
//  Created by Alessandra Pereira on 01/03/20.
//  Copyright © 2020 Alessandra Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var botaoMedio: UIButton!
    @IBOutlet var botaoGrande: UIButton!
    @IBOutlet var yearsTextField: UITextField!
    @IBOutlet var monthsTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let duke: Cachorro
        duke = Cachorro(anos: 7, meses: 4, tamanho: "médio")
        print(duke.anos, duke.meses, duke.porte)
    }
    
    @IBAction func tocouBotao(_ sender: UIButton) {
        let years: Int
        
        if sender == botaoMedio  {
            years = transformarAnosCaninosEmHumanos(porte:"médio")
        }
        else if sender == botaoGrande {
            years = transformarAnosCaninosEmHumanos(porte:"grande")
        }
        else {
            years = transformarAnosCaninosEmHumanos(porte:"pequeno")
        }
        exibir(resultado: years)
    }
    
    func transformarAnosCaninosEmHumanos(porte: String) -> Int {
        // Lê o que está escrito no text field de anos
        let years = yearsTextField.text!
        let months = monthsTextField.text!
        
        // Transforma o texto em Int
        let yearsInt = Int(years)!
        let monthsInt = Int(months)!
        
        // Multiplica o valor escrito em anos por 7
        let dog = Cachorro(anos: yearsInt, meses: monthsInt, tamanho: porte)
        let dogYears = dog.idadeHumana()
        
        return dogYears
    }
    
    func esconderComponentes() {
        // Esconde os labels, botões e text fields relativos a anos, meses e porte
    }
    
    func exibir(resultado: Int) {
        // Escreve na label de resultados o valor calculado em anos
        let yearsString = "\(resultado) anos"
        
        // Exibe os labels de resultado e o botão de recãocular
        resultLabel.text = yearsString
    }
}


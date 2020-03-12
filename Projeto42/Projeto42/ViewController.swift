//
//  ViewController.swift
//  Projeto42
//
//  Created by Alessandra Pereira on 01/03/20.
//  Copyright © 2020 Alessandra Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var yearsTextField: UITextField!
    @IBOutlet var monthsTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var sizepicker: UIPickerView!
    
    let portes: [String] = ["Pequeno", "Médio", "Grande"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sizepicker.dataSource = self
        sizepicker.delegate = self
    }
    
    @IBAction func tapButton(_ sender: Any) {
        let linhaSelecionada: Int = sizepicker.selectedRow(inComponent: 0)
        let porteSelecionado = portes[linhaSelecionada]
        
        let years: Int
        if porteSelecionado == "Médio" {
            years = transformarAnosCaninosEmHumanos(porte: "médio")
        }
        else if porteSelecionado == "Pequeno" {
            years = transformarAnosCaninosEmHumanos(porte: "pequeno")
        }
        else {
            years = transformarAnosCaninosEmHumanos(porte: "grande")
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return portes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return portes[row]
    }
}


//
//  ViewController.swift
//  IMC-ViewCode
//
//  Created by Carolina de Faria Paulo on 08/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var tituloLabel: UILabel
    private var descricaoLabel: UILabel
    
    private lazy var pesoLabel: UILabel = {
      let view = UILabel(frame: .zero)
      view.translatesAutoresizingMaskIntoConstraints = false
      view.layer.cornerRadius = 20
      return view
    }()

    private lazy var alturaLabel: UILabel = {
      let view = UILabel(frame: .zero)
      view.translatesAutoresizingMaskIntoConstraints = false
    return view
    }()

    private lazy var pesoTextField: UITextField = {
      let view = UITextField(frame: .zero)
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()

    private lazy var alturaTextField: UITextField = {
      let view = UITextField(frame: .zero)
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    
    private lazy var calculaButton: UIButton = {
      let view = UIButton(frame: .zero)
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    
    private lazy var resultadoView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var resultadoDescricaoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var resultadoImagem: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var resultadoLabel: UILabel = {
      let view = UILabel(frame: .zero)
      view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var imc: Double = 0.0
    
    internal required init() {
        tituloLabel = ViewController.createLabel()
        descricaoLabel = ViewController.createLabel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   static private func createLabel() -> UILabel {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 20
        
        return label
    }
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor(red: 83/255.0, green: 177.0/255.0, blue: 192/255.0, alpha: 1)
        self.view = view
        applyViewCode()
        
    }
    
    @IBAction func calcularImc(_ sender: Any) {
        if let weight = Double(pesoTextField.text!) , let height = Double(alturaTextField.text!){
            imc = weight / ( height * height)
            showResults()
        }else{
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    func showResults() {
        var result: String = ""
        var image: String = ""
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "magreza"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso Saudável"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Acima do peso"
                image = "obesidade"
        }
        resultadoLabel.text = " \(Int(imc)):  \(result)"
        resultadoImagem.image = UIImage(named: image)
        resultadoView.isHidden = false
        view.endEditing(true)
    }
    
}

extension ViewController: ViewCodeConfiguration {

    func buildHierarchy() {
        view.addSubview(tituloLabel)
        view.addSubview(descricaoLabel)
        view.addSubview(pesoLabel)
        view.addSubview(pesoTextField)
        view.addSubview(alturaLabel)
        view.addSubview(alturaTextField)
        view.addSubview(calculaButton)
        view.addSubview(resultadoView)
        view.addSubview(resultadoDescricaoLabel)
        view.addSubview(resultadoLabel)
        view.addSubview(resultadoImagem)
    }
    
    func setupConstraints() {
        
        // Titulo
            tituloLabel.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
            tituloLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
            tituloLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
            tituloLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
            tituloLabel.font = UIFont(name: "KohinoorDevanagari-Semibold", size: 36.0)
        
        // Descricao
            descricaoLabel.centerYAnchor.constraint(equalTo: tituloLabel.bottomAnchor, constant: 20).isActive = true
            descricaoLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
            descricaoLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
            descricaoLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
            descricaoLabel.font = UIFont(name: "KohinoorDevanagari-Regular", size: 17.0)
        
        // Peso
            pesoLabel.centerYAnchor.constraint(equalTo: descricaoLabel.bottomAnchor, constant: 20).isActive = true
            pesoLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -70).isActive = true
            pesoLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
            pesoLabel.font = UIFont(name: "KohinoorDevanagari-Regular", size: 17.0)
            pesoLabel.widthAnchor.constraint(equalToConstant: 110).isActive = true
        
            pesoTextField.centerYAnchor.constraint(equalTo: pesoLabel.bottomAnchor, constant: 20).isActive = true
            pesoTextField.centerXAnchor.constraint(equalTo: pesoLabel.centerXAnchor, constant: 0).isActive = true
            pesoTextField.heightAnchor.constraint(equalTo: pesoLabel.heightAnchor).isActive = true
            pesoTextField.widthAnchor.constraint(equalTo: pesoLabel.widthAnchor, constant: 0).isActive = true
            pesoLabel.widthAnchor.constraint(equalTo: pesoLabel.widthAnchor).isActive = true
            
        //Altura
            alturaLabel.centerYAnchor.constraint(equalTo: descricaoLabel.bottomAnchor, constant: 20).isActive = true
            alturaLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 70).isActive = true
            alturaLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
            alturaLabel.font = UIFont(name: "KohinoorDevanagari-Regular", size: 17.0)
            alturaLabel.widthAnchor.constraint(equalTo: pesoLabel.widthAnchor).isActive = true
        
            alturaTextField.centerYAnchor.constraint(equalTo: alturaLabel.bottomAnchor, constant: 20).isActive = true
            alturaTextField.centerXAnchor.constraint(equalTo: alturaLabel.centerXAnchor, constant: 0).isActive = true
            alturaTextField.heightAnchor.constraint(equalTo: pesoTextField.heightAnchor).isActive = true
            alturaTextField.widthAnchor.constraint(equalTo: alturaLabel.widthAnchor, constant: 0).isActive = true
            alturaTextField.widthAnchor.constraint(equalTo: pesoTextField.widthAnchor).isActive = true
        
        //Button
            calculaButton.centerYAnchor.constraint(equalTo: alturaTextField.bottomAnchor, constant: 30).isActive = true
            calculaButton.leadingAnchor.constraint(equalTo: pesoTextField.leadingAnchor, constant: 0).isActive = true
            calculaButton.trailingAnchor.constraint(equalTo: alturaLabel.trailingAnchor, constant: 0).isActive = true
            calculaButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //ResultadoView
            resultadoView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
            resultadoView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
            resultadoView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 16).isActive = true
            resultadoView.topAnchor.constraint(equalTo: calculaButton.bottomAnchor, constant: 16).isActive = true
            resultadoView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        
        //ResultadoDescricaoLabel
            resultadoDescricaoLabel.centerYAnchor.constraint(equalTo: resultadoView.topAnchor, constant: 30).isActive = true
            resultadoDescricaoLabel.centerXAnchor.constraint(equalTo: resultadoView.centerXAnchor, constant: 0).isActive = true
            resultadoDescricaoLabel.leadingAnchor.constraint(equalTo: pesoTextField.leadingAnchor, constant: 0).isActive = true
            resultadoDescricaoLabel.trailingAnchor.constraint(equalTo: alturaLabel.trailingAnchor, constant: 0).isActive = true
        
        //ResultadoLabel
            resultadoLabel.leadingAnchor.constraint(equalTo: resultadoView.leadingAnchor, constant: 16).isActive = true
            resultadoLabel.trailingAnchor.constraint(equalTo: resultadoView.trailingAnchor, constant: 16).isActive = true
            resultadoLabel.centerYAnchor.constraint(equalTo: resultadoView.topAnchor, constant: 55).isActive = true
            resultadoLabel.centerXAnchor.constraint(equalTo: resultadoView.centerXAnchor, constant: 0).isActive = true
        
        //ResultadoImagem
            resultadoImagem.leadingAnchor.constraint(equalTo: resultadoView.leadingAnchor, constant: 16).isActive = true
            resultadoImagem.trailingAnchor.constraint(equalTo: resultadoView.trailingAnchor, constant: 16).isActive = true
            resultadoImagem.topAnchor.constraint(equalTo: resultadoLabel.bottomAnchor, constant: 16).isActive = true
            resultadoImagem.centerXAnchor.constraint(equalTo: resultadoView.centerXAnchor, constant: 0).isActive = true
            resultadoImagem.contentMode = UIView.ContentMode.scaleAspectFit
        
        }
    
    func configureViews() {
    
        // Titulo
        tituloLabel.text = "Cálculo do IMC"
        tituloLabel.textAlignment = .center
        tituloLabel.textColor = .white
        tituloLabel.layer.masksToBounds = true
        
        // Descricao
        descricaoLabel.text = "Descubra seu índice de Massa Corporal"
        descricaoLabel.textAlignment = .center
        descricaoLabel.textColor = .white
        descricaoLabel.layer.cornerRadius = 10
        descricaoLabel.layer.masksToBounds = true
        
        // Peso
        pesoLabel.text = "Peso(Kg)"
        pesoLabel.textAlignment = .center
        pesoLabel.textColor = .white
        pesoLabel.layer.masksToBounds = true
        
        pesoTextField.backgroundColor =  .white
        pesoTextField.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        pesoTextField.placeholder = "Ex.: 65"
        pesoTextField.textAlignment = .center
        pesoTextField.autocapitalizationType = .none
        pesoTextField.layer.cornerRadius = 5
        pesoTextField.keyboardType = UIKeyboardType.decimalPad
        
        
        //Altura
        alturaLabel.text = "Altura(m)"
        alturaLabel.textAlignment = .center
        alturaLabel.textColor = .white
        alturaLabel.layer.cornerRadius = 10
        alturaLabel.layer.masksToBounds = true
        
        alturaTextField.backgroundColor =  .white
        alturaTextField.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        alturaTextField.placeholder = "Ex.: 1.75"
        alturaTextField.textAlignment = .center
        alturaTextField.autocapitalizationType = .none
        alturaTextField.layer.cornerRadius = 5
        alturaTextField.keyboardType = UIKeyboardType.decimalPad
        
        //Button
        calculaButton.setTitle("Calcular", for: .normal)
        calculaButton.backgroundColor = .white
        calculaButton.layer.cornerRadius = 6
        calculaButton.setTitleColor(UIColor(red: 83/255.0, green: 177.0/255.0, blue: 192/255.0, alpha: 1), for: .normal)
        calculaButton.addTarget(self, action: #selector(calcularImc), for: .touchDown)
        
        //ResultadoDescricaoLabel
        resultadoDescricaoLabel.text = "Seu indice de massa corporal é:"
        resultadoDescricaoLabel.textAlignment = .center
        resultadoDescricaoLabel.layer.masksToBounds = true
        
        //ResultadoLabel
        resultadoLabel.textAlignment = .center
        resultadoLabel.layer.masksToBounds = true
        
        //ResultadoView
        resultadoView.isHidden = true
        resultadoView.layer.masksToBounds = true
        resultadoView.backgroundColor = UIColor(red: 175/255.0, green: 239/255.0, blue: 242/255.0, alpha: 1)
    }

}


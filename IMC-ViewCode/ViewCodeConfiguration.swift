//
//  ViewCodeConfiguration.swift
//  IMC-ViewCode
//
//  Created by Carolina de Faria Paulo on 08/11/21.
//

protocol ViewCodeConfiguration {
    func buildHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewCodeConfiguration {
    func configureViews() {}
    
    func applyViewCode() {
        buildHierarchy()
        setupConstraints()
        configureViews()
    }
}

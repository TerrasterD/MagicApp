//
//  ViewConfiguration.swift
//  MagicApp
//
//  Created by victor.d.ciccarini on 26/04/21.
//

import Foundation

protocol ViewConfiguration {

    func setupViewHierarchy()
    func setupConstraints()
    func setupAditionalConfiguration()
    func setupView()

}

extension ViewConfiguration {

    func setupView() {
        setupViewHierarchy()
        setupConstraints()
        setupAditionalConfiguration()
    }

    func setupAditionalConfiguration() {

    }

}

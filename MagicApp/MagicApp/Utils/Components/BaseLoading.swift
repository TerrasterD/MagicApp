//
//  BaseLoading.swift
//  MagicApp
//
//  Created by victor.d.ciccarini on 04/05/21.
//

import UIKit

final public class BaseLoading: UIView, ViewConfiguration {

// MARK: - Atributes
    private lazy var loading: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
    }()

    private lazy var background: UIView = {
        let backgroundView = UIView(frame: CGRect.zero)
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0.6
        return backgroundView
    }()
// MARK: - Initializers
    public init() {
        super.init(frame: CGRect.zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: - Methods
    func setupViewHierarchy() {
        addSubview(background)
        background.addSubview(loading)
    }
    func setupConstraints() {
        background.layout.applyConstraint { view in
            view.constrainEdges(to: self)
        }
        loading.layout.applyConstraint { view in
            view.centered(on: background)
            view.heightAnchor(equalTo: 50)
            view.widthAnchor(equalTo: 50)
        }
    }

}

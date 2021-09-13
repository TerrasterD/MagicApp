//
//  ExtensionHeader.swift
//  MagicApp
//
//  Created by victor.d.ciccarini on 29/04/21.
//

import UIKit

class ExtensionHeader: UITableViewHeaderFooterView, ViewConfiguration {

    // MARK: - Atributes

    public lazy var label: UILabel = {
        let label = UILabel()
        label.text = "A"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()

    // MARK: - Initializers

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    func setupViewHierarchy() {
        contentView.addSubview(label)
    }

    func setupConstraints() {
        label.layout.applyConstraint { (view) in
            view.topAnchor(equalTo: contentView.topAnchor)
            view.leadingAnchor(equalTo: contentView.leadingAnchor, constant: 16)
            view.trailingAnchor(equalTo: contentView.trailingAnchor)
            view.bottomAnchor(equalTo: contentView.bottomAnchor)
        }
    }

}

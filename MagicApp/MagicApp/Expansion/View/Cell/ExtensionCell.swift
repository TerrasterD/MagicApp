//
//  ExtensionCell.swift
//  MagicApp
//
//  Created by victor.d.ciccarini on 23/04/21.
//

import UIKit

protocol SectionExtensionCell: AnyObject {

    func numberOfRows() -> [Dictionary<String, [SetInfo]>.Element]

}

class ExtensionCell: UITableViewCell, ViewConfiguration {

    // MARK: - Atributes

    public var code: String?

    public lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        nameLabel.textColor = .white
        return nameLabel
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()

    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    func setup(name: String) {
        nameLabel.text = name
    }

    func setupViewHierarchy() {
        contentView.addSubview(nameLabel)
    }

    func setupConstraints() {
        nameLabel.layout.applyConstraint { (view) in
            view.topAnchor(equalTo: contentView.topAnchor, constant: 8)
            view.leadingAnchor(equalTo: contentView.leadingAnchor, constant: 16)
            view.trailingAnchor(equalTo: contentView.trailingAnchor, constant: -16)
            view.bottomAnchor(equalTo: contentView.bottomAnchor)
        }

    }

    func setupAditionalConfiguration() {
        accessoryType = .disclosureIndicator
        guard let image = UIImage(named: "Vector") else {
            return
        }
        accessoryView = UIImageView(image: image)
    }

}

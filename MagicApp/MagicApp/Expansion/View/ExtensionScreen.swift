//
//  ExtensionScreen.swift
//  MagicApp
//
//  Created by victor.d.ciccarini on 26/04/21.
//

import UIKit

class ExtensionScreen: UIView {

    // MARK: - Atributes

    public static let cellId: String = "extensionCell"
    public static let headerId: String = "extensionHeader"

    /// The title of the screen
    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.text = ""
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 36)
        return label
    }()
    ///
    private lazy var dataSource: ExtensionTableViewDataSource = .init()
    ///
    private lazy var tableView: ExtensionTableView = {
        let tableView = ExtensionTableView()
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.register(ExtensionCell.self, forCellReuseIdentifier: ExtensionScreen.cellId)
        tableView.register(ExtensionHeader.self, forHeaderFooterViewReuseIdentifier: ExtensionScreen.headerId)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .white
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return tableView
    }()
    ///
    private lazy var backgroundImage: UIImageView = {
        guard let image = UIImage(named: "Backgroound_Extension") else {
            fatalError("Could not load background image")
        }
        let backgroundImage = UIImageView(image: image)
        return backgroundImage
    }()

    // MARK: - Initializers
    init() {

        // Atribute that
        super.init(frame: CGRect.zero)

        setupView()

    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    public func setup(title: String, itens: [ExpansionsListModel]) {
        nameLabel.text = title
        dataSource.updateItens(itens: itens)
        tableView.reloadData()
    }

    public func getNameLabel() -> UILabel {
        return nameLabel
    }

    public func getTableView() -> ExtensionTableView {
        return tableView
    }

}

extension ExtensionScreen: ViewConfiguration {

    func setupViewHierarchy() {
        self.addSubview(backgroundImage)
        self.addSubview(nameLabel)
        self.addSubview(tableView)
    }

    func setupConstraints() {

        backgroundImage.layout.applyConstraint { view in
            view.topAnchor(equalTo: self.topAnchor)
            view.leadingAnchor(equalTo: self.leadingAnchor)
            view.trailingAnchor(equalTo: self.trailingAnchor)
            view.bottomAnchor(equalTo: self.bottomAnchor)
        }

        nameLabel.layout.applyConstraint { (view) in
            view.topAnchor(equalTo: self.safeTopAnchor, constant: 20)
            view.leadingAnchor(equalTo: self.leadingAnchor, constant: 16)
            view.trailingAnchor(equalTo: self.trailingAnchor, constant: -16)
        }

        tableView.layout.applyConstraint { (view) in
            view.topAnchor(equalTo: nameLabel.bottomAnchor, constant: 20)
            view.leadingAnchor(equalTo: self.leadingAnchor, constant: -20)
            view.trailingAnchor(equalTo: self.trailingAnchor, constant: 20)
            view.bottomAnchor(equalTo: self.safeBottomAnchor)
        }

    }

}

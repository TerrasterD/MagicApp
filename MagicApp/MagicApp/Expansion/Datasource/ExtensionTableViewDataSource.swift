//
//  ExtensionTableViewDataSource.swift
//  MagicApp
//
//  Created by victor.d.ciccarini on 26/04/21.
//

import UIKit

final class ExtensionTableViewDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Atributes
    private(set) var list: [ExpansionsListModel] = []
    private  weak var cellDelegate: SectionExtensionCell?

    // MARK: - Initializer

    // MARK: - Methods
    // The number of the section
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }

    // The number of the rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].rows.count
    }

    // Atributing a cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ExtensionScreen.cellId) as? ExtensionCell else {
            fatalError()
        }
        let item = list[indexPath.section].rows[indexPath.row]
        cell.setup(name: item.name)
        // Configure Cell
        // cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cell.backgroundColor = .clear

        return cell
    }

    public func updateItens(itens: [ExpansionsListModel]) {

        list = itens// .sorted {$0.key < $1.key}

    }
    // MARK: - Methods Header

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        guard let header = tableView.dequeueReusableHeaderFooterView(
                withIdentifier: ExtensionScreen.headerId) as? ExtensionHeader else {
            return UITableViewHeaderFooterView()
        }
        header.label.text = list[section].sectionTitle
        return header
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}

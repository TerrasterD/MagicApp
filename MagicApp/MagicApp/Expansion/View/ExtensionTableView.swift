//
//  ExtensionTableView.swift
//  MagicApp
//
//  Created by victor.d.ciccarini on 26/04/21.
//

import UIKit

class ExtensionTableView: UITableView {

    // MARK: - Initializers

    init() {
        super.init(frame: CGRect.zero, style: UITableView.Style.insetGrouped)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

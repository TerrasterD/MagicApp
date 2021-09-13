//
//  ExtensionScreenViewController.swift
//  MagicApp
//
//  Created by victor.d.ciccarini on 26/04/21.
//

import UIKit

final class ExtensionScreenViewController: UIViewController {

    // MARK: - Atributes
    internal lazy var extensionScreen: ExtensionScreen = .init()

    private let extensionViewModel: ExtensionViewModel

    // MARK: - Initializers

    init(viewModel: ExtensionViewModel = .init()) {
        self.extensionViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        extensionViewModel.delegate = self
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    override func loadView() {
        self.view = extensionScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    private func fetchData() {
        extensionViewModel.fetchData()
    }

}

extension ExtensionScreenViewController: ExtensionViewModelDelegate {

    func didDataReady() {
        self.extensionScreen.setup(title: "Expansions", itens: self.extensionViewModel.expansionList)
    }

    func showLoading() {
        loading.show()
    }

    func hideLoading() {
        loading.hide()
    }

    func didErrorOcurred() {
        error.show(tryAgainAction: fetchData)
    }

}

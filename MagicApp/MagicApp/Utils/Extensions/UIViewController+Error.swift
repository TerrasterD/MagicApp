//
//  ViewController+Loading.swift
//  MagicApp
//
//  Created by victor.d.ciccarini on 04/05/21.
//

import UIKit

extension UIViewController {

    var error: BaseErrorDSL {
        return .init(viewController: self)
    }

}

final public class BaseErrorDSL {

// MARK: - Atributes
    private let viewController: UIViewController

// MARK: - Initializers
    public init(viewController: UIViewController) {
        self.viewController = viewController
    }
// MARK: - Methods
    public func show(tryAgainAction: @escaping () -> Void) {
        let alert = UIAlertController(title: "Tivemos um problema",
                                      message: "Um erro inesperado aconteceu. Se quiser, tente novamente",
                                      preferredStyle: .alert)
        let actionAlert = UIAlertAction(title: "Tentar novamente", style: .default) { _ in
            tryAgainAction()
        }
        alert.addAction(actionAlert)
        viewController.present(alert, animated: true)
    }
}

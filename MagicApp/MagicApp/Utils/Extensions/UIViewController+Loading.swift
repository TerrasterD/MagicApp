//
//  ViewController+Loading.swift
//  MagicApp
//
//  Created by victor.d.ciccarini on 04/05/21.
//

import UIKit

extension UIViewController {

    var loading: BaseLoadingDSL {
        return .init(viewController: self)
    }

}

final public class BaseLoadingDSL {

// MARK: - Atributes
    private let viewController: UIViewController

// MARK: - Initializers
    public init(viewController: UIViewController) {
        self.viewController = viewController
    }
// MARK: - Methods
    public func show() {
        let loading = BaseLoading()
        viewController.view.addSubview(loading)
        loading.layout.applyConstraint { view in
            view.constrainEdges(to: viewController.view)
        }
    }

    public func hide() {
        for view in viewController.view.subviews where view is BaseLoading {
            view.removeFromSuperview()
        }
    }
}

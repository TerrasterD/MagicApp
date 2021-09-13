//
//  ViewCodeDSL.swift
//  Core
//
//  Created by Diogo Autilio on 04/10/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

public extension UIView {

    var layout: ViewCodeDSL {
        return ViewCodeDSL(view: self)
    }
}

public class ViewCodeDSL {

    let view: UIView

    init(view: UIView) {
        self.view = view
    }

    public func applyConstraint(_ block: ((UIView) -> Void)) {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        block(self.view)
    }
}

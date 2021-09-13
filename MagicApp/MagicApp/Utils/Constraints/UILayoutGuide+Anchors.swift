//
//  UILayoutGuide+Anchors.swift
//  Core
//
//  Created by alan.pegoli on 28/01/20.
//  Copyright © 2020. All rights reserved.
//

import UIKit

extension UIView {

    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        }
        return topAnchor
    }
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.bottomAnchor
        }
        return bottomAnchor
    }
    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.leadingAnchor
        }
        return leadingAnchor
    }
    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.trailingAnchor
        }
        return trailingAnchor
    }
    var safeCenterXAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.centerXAnchor
        }
        return centerXAnchor
    }
    var safeCenterYAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.centerYAnchor
        }
        return centerYAnchor
    }
    var safeWidthAnchor: NSLayoutDimension {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.widthAnchor
        }
        return widthAnchor
    }
    var safeHeightAnchor: NSLayoutDimension {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.heightAnchor
        }
        return heightAnchor
    }

    public func constraintToSuperview() {
        if let view = self.superview {
            self
                .topAnchor(equalTo: view.safeTopAnchor)
                .leadingAnchor(equalTo: view.safeLeadingAnchor)
                .trailingAnchor(equalTo: view.safeTrailingAnchor)
                .bottomAnchor(equalTo: view.safeBottomAnchor)
        }
    }
    @discardableResult
    public func topAnchor(equalTo anchor: NSLayoutYAxisAnchor,
                          constant: CGFloat = 0,
                          priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = topAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func topAnchor(greaterThanOrEqualTo anchor: NSLayoutYAxisAnchor,
                          constant: CGFloat = 0,
                          priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = topAnchor.constraint(greaterThanOrEqualTo: anchor,
                                                                  constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func topAnchor(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor,
                          constant: CGFloat = 0,
                          priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = topAnchor.constraint(lessThanOrEqualTo: anchor,
                                                                  constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func bottomAnchor(equalTo anchor: NSLayoutYAxisAnchor,
                             constant: CGFloat = 0,
                             priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = bottomAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func bottomAnchor(greaterThanOrEqualTo anchor: NSLayoutYAxisAnchor,
                             constant: CGFloat = 0,
                             priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = bottomAnchor.constraint(greaterThanOrEqualTo: anchor,
                                                                     constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func bottomAnchor(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor,
                             constant: CGFloat = 0,
                             priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = bottomAnchor.constraint(lessThanOrEqualTo: anchor,
                                                                     constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func leadingAnchor(equalTo anchor: NSLayoutXAxisAnchor,
                              constant: CGFloat = 0,
                              priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = leadingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func leadingAnchor(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor,
                              constant: CGFloat = 0,
                              priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = leadingAnchor.constraint(lessThanOrEqualTo: anchor,
                                                                      constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func leadingAnchor(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor,
                              constant: CGFloat = 0,
                              priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = leadingAnchor.constraint(greaterThanOrEqualTo: anchor,
                                                                      constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func trailingAnchor(equalTo anchor: NSLayoutXAxisAnchor,
                               constant: CGFloat = 0,
                               priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = trailingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func trailingAnchor(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor,
                               constant: CGFloat = 0,
                               priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = trailingAnchor.constraint(lessThanOrEqualTo: anchor,
                                                                       constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func trailingAnchor(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor,
                               constant: CGFloat = 0,
                               priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = trailingAnchor.constraint(greaterThanOrEqualTo: anchor,
                                                                       constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func heightAnchor(equalTo height: CGFloat,
                             priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = heightAnchor.constraint(equalToConstant: height)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func heightAnchor(greaterThanOrEqualToConstant height: CGFloat,
                             priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = heightAnchor.constraint(greaterThanOrEqualToConstant: height)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func heightAnchor(equalTo nsLayoutDimension: NSLayoutDimension, multiplier: CGFloat = 1) -> Self {
        let constraint: NSLayoutConstraint = heightAnchor.constraint(equalTo: nsLayoutDimension,
                                                                     multiplier: multiplier)
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func heightAnchor(lessThanOrEqualToConstant height: CGFloat,
                             priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = heightAnchor.constraint(lessThanOrEqualToConstant: height)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func heightAnchor(lessThanOrEqualTo anchor: NSLayoutDimension,
                             priority: UILayoutPriority = UILayoutPriority.required,
                             multiplier: CGFloat = 1) -> Self {
        let constraint: NSLayoutConstraint = heightAnchor.constraint(lessThanOrEqualTo: anchor,
                                                                     multiplier: multiplier)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func heightAnchor(greatherThanOrEqualTo anchor: NSLayoutDimension,
                             priority: UILayoutPriority = UILayoutPriority.required,
                             multiplier: CGFloat = 1) -> Self {
        let constraint: NSLayoutConstraint = heightAnchor.constraint(greaterThanOrEqualTo: anchor,
                                                                     multiplier: multiplier)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func widthAnchor(equalTo width: CGFloat,
                            priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = widthAnchor.constraint(equalToConstant: width)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func widthAnchor(equalTo nsLayoutDimension: NSLayoutDimension, multiplier: CGFloat = 1) -> Self {
        let constraint: NSLayoutConstraint = widthAnchor.constraint(equalTo: nsLayoutDimension,
                                                                    multiplier: multiplier)
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func widthAnchor(greaterThanOrEqualToConstant width: CGFloat,
                            priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = widthAnchor.constraint(greaterThanOrEqualToConstant: width)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func widthAnchor(lessThanOrEqualToConstant width: CGFloat,
                            priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = widthAnchor.constraint(lessThanOrEqualToConstant: width)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func centerXAnchor(equalTo anchor: NSLayoutXAxisAnchor,
                              constant: CGFloat = 0,
                              priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = centerXAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func centerYAnchor(equalTo anchor: NSLayoutYAxisAnchor,
                              constant: CGFloat = 0,
                              priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = centerYAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func centerYAnchor(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> Self {
        let constraint: NSLayoutConstraint = centerYAnchor.constraint(lessThanOrEqualTo: anchor,
                                                                      constant: constant)
        constraint.isActive = true
        return self
    }
    @discardableResult
    public func constrainEdges(to view: UIView, inset: CGFloat = 0) -> Self {
        return self
            .topAnchor(equalTo: view.topAnchor, constant: inset)
            .bottomAnchor(equalTo: view.bottomAnchor, constant: -inset)
            .leadingAnchor(equalTo: view.leadingAnchor, constant: inset)
            .trailingAnchor(equalTo: view.trailingAnchor, constant: -inset)
    }
    @discardableResult
    public func centered(on view: UIView) -> Self {
        return self
            .centerXAnchor(equalTo: view.centerXAnchor)
            .centerYAnchor(equalTo: view.centerYAnchor)
    }
}

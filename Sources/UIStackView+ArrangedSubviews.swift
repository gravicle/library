import UIKit

public extension UIStackView {

    public func addArrangedSubviews(_ views: UIView...) {
        addArrangedSubviews(views)
    }

    public func addArrangedSubviews(_ views: [UIView]) {
        views.forEach(addArrangedSubview)
    }

}

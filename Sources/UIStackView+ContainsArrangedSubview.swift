import UIKit

extension UIStackView {

    public func contains(arrangedSubview view: UIView) -> Bool {
        return arrangedSubviews.contains(view)
    }

}

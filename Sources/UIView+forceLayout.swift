import UIKit

extension UIView {

    public func forceLayout() {
        setNeedsLayout()
        layoutIfNeeded()
        layoutSubviews()
    }

}

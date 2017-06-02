import UIKit

extension UIView {

    /// Layout superview to animate costraint changes
    /// https://stackoverflow.com/a/39501882/2671390
    public func layoutToApplyConstraintChanges() {
        self.superview?.layoutIfNeeded()
    }

}

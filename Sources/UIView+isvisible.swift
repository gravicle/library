import UIKit

extension UIView {

    public var isVisiblle: Bool {
        get { return !isHidden }
        set { isHidden = !newValue }
    }

}

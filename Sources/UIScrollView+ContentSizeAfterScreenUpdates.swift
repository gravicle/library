import UIKit

extension UIScrollView {

    /**
     Force calculation of the final size, even during content animations
     like tableView insert/delete/move animations.
     https://stackoverflow.com/a/41581418/2671390
    */
    public var contentSizeAfterScreenUpdates: CGSize {
        let contentCanvas = CGSize(width: contentSize.width, height: .greatestFiniteMagnitude)
        return sizeThatFits(contentCanvas)
    }

}

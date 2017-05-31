import UIKit

// MARK: - Layout

public extension UIStackView {

    public struct Layout {

        public var axis: UILayoutConstraintAxis
        public var distribution: UIStackViewDistribution
        public var alignment: UIStackViewAlignment

        public init(
            axis: UILayoutConstraintAxis = .vertical,
            distribution: UIStackViewDistribution = .equalSpacing,
            alignment: UIStackViewAlignment = .fill) {
            self.axis = axis
            self.distribution = distribution
            self.alignment = alignment
        }

    }

}

// MARK: Layouts

public extension UIStackView.Layout {

    public static let verticalGrid = UIStackView.Layout(
        axis: .vertical,
        distribution: .fillEqually,
        alignment: .fill
    )

    public static let horizontalGrid = UIStackView.Layout(
        axis: .horizontal,
        distribution: .fillEqually,
        alignment: .fill
    )

    
}

// MARK: - Packing

public extension UIStackView {

    public struct Packing {

        public var insets: UIEdgeInsets
        public var interspacing: CGFloat
        public var isLayoutMarginsRelativeArrangement: Bool

        public init(
            insets: UIEdgeInsets = UIEdgeInsets.zero,
            interspacing: CGFloat = 0,
            isLayoutMarginsRelativeArrangement: Bool = true) {
            self.insets = insets
            self.interspacing = interspacing
            self.isLayoutMarginsRelativeArrangement = isLayoutMarginsRelativeArrangement
        }

    }

}

// MARK: - UIStackView + Configuration

public extension UIStackView {

    public var layout: Layout {
        get { return Layout(axis: axis, distribution: distribution, alignment: alignment) }
        set { apply(newValue) }
    }

    public var packing: Packing {
        get { return Packing(insets: layoutMargins, interspacing: self.spacing, isLayoutMarginsRelativeArrangement: isLayoutMarginsRelativeArrangement) }
        set { apply(newValue) }
    }

    public convenience init(arrangedSubviews: [UIView] = [], layout: Layout, packing: Packing = .init()) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.apply(layout)
        self.apply(packing)
    }

}

private extension UIStackView {
    func apply(_ layout: Layout) {
        axis = layout.axis
        alignment = layout.alignment
        distribution = layout.distribution
    }

    func apply(_ packing: Packing) {
        self.spacing = packing.interspacing
        layoutMargins = packing.insets
        isLayoutMarginsRelativeArrangement = packing.isLayoutMarginsRelativeArrangement
    }

}

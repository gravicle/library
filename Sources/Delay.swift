import Foundation

public func delay(_ duration: Double, _ closure: (() -> Void)?) {
    guard let closure = closure else {
        return
    }

    let dispatchTime = DispatchTime.now() + Double(Int64(duration * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: closure)
}

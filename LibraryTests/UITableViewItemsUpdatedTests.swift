import XCTest
import Library
import RxCocoa
import Nimble

class UITableViewItemsUpdatedTests: XCTestCase {

    class TableView: UITableView, UITableViewDataSource {
        let reuseID = "reuseID"
        var items = [Int]()

        override init(frame: CGRect, style: UITableViewStyle) {
            super.init(frame: frame, style: style)
            register(UITableViewCell.self, forCellReuseIdentifier: reuseID)
            dataSource = self
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return items.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath)
        }
    }

    lazy var tableView: TableView = {
        let tv = TableView(frame: .zero, style: .plain)
        return tv
    }()

    func testThatEventIsDispatchedWhenAnItemIsDeleted() {
        tableView.items = [0, 1, 2]
        tableView.reloadData()

        let exp = expectation(description: "")
        tableView.rx.itemsUpdated
            .asDriver()
            .drive { (_) in exp.fulfill() }

        tableView.items = [0, 1]
        tableView.deleteRows(at: [.init(row: 2, section: 0)], with: .none)

        wait(for: [exp], timeout: 1.0)
    }

    func testThatEventIsDispatchedWhenAnItemIsAdded() {
        tableView.items = [0, 1, 2]
        tableView.reloadData()

        let exp = expectation(description: "")
        tableView.rx.itemsUpdated
            .asDriver()
            .drive { (_) in exp.fulfill() }

        tableView.items = [0, 1, 2, 3]
        tableView.insertRows(at: [.init(row: 2, section: 0)], with: .none)

        wait(for: [exp], timeout: 1.0)
    }

    func testThatEventIsDispatchedWhenMutationIsMadeInAnUpdateBlock() {
        tableView.items = [0, 1, 2]
        tableView.reloadData()

        let exp = expectation(description: "")
        tableView.rx.itemsUpdated
            .asDriver()
            .drive { (_) in exp.fulfill() }

        tableView.beginUpdates()
        tableView.items = [0, 1, 2, 3]
        tableView.insertRows(at: [.init(row: 2, section: 0)], with: .none)
        tableView.endUpdates()

        wait(for: [exp], timeout: 1.0)
    }

    func testThatEventIsDispatchedWhenMutationIsMadeWithAnimation() {
        tableView.items = [0, 1, 2]
        tableView.reloadData()

        let exp = expectation(description: "")
        tableView.rx.itemsUpdated
            .asDriver()
            .drive { (_) in exp.fulfill() }

        tableView.items = [0, 1, 2, 3]
        tableView.insertRows(at: [.init(row: 2, section: 0)], with: .fade)

        wait(for: [exp], timeout: 1.0)
    }

    func testThatEventIsDispatchedWhenMultipleMutationsAreMade() {
        tableView.items = [0, 1, 2]
        tableView.reloadData()

        let exp = expectation(description: "")
        tableView.rx.itemsUpdated
            .asDriver()
            .drive { (_) in exp.fulfill() }

        tableView.items = [1, 2, 3]

        tableView.beginUpdates()
        tableView.deleteRows(at: [.init(row: 0, section: 0)], with: .fade)
        tableView.insertRows(at: [.init(row: 2, section: 0)], with: .fade)
        tableView.endUpdates()

        wait(for: [exp], timeout: 1.0)
    }

}

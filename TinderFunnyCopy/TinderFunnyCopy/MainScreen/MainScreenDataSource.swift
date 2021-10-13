//
//  MainScreenDataSource.swift
//  TinderFunnyCopy
//
//  Created by macuser on 13.10.2021.
//  
//

import UIKit

// MARK: - MainScreenDataSource

class MainScreenDataSource: NSObject, UITableViewDataSource {

    weak var cellDelegate: MainScreenCellDelegate?
    private let model: MainScreenModelProtocol

    init(withModel model: MainScreenModelProtocol) {
        self.model = model
    }

    func registerNibsForTableView(tableView: UITableView) {
        MainScreenTableViewCell.register(for:tableView)
    }

    // MARK: - Private methods

    func configure(cell: MainScreenTableViewCell, forItem item: String) {
        cell.titleLabel.text = item
    }

    // MARK: - UITableViewDataSource

    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.deque(for: indexPath) as MainScreenTableViewCell
        cell.delegate = cellDelegate

        let testItem = self.model.items[indexPath.row];
        self.configure(cell: cell, forItem: testItem)

        return cell
    }
}


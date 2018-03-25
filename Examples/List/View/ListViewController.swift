//
//  ListViewController.swift
//  StateGeneratorExamples
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController {

    fileprivate let index = Index.shared
}

/// DataSource
extension ListViewController {
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return index.sections.count
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return index.sections[section].1.count
    }

    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return index.sections[section].0
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListTableViewCell.self), for: indexPath) as! ListTableViewCell
        let demo = index.sections[indexPath.section].1[indexPath.row]
        cell.setTitle(demo.title)
        return cell
    }
}

/// Delegate
extension ListViewController {

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let demo = index.sections[indexPath.section].1[indexPath.row]
        let viewController = demo.factory()

        viewController.title = demo.title

        navigationController?.pushViewController(viewController, animated: true)
    }
}

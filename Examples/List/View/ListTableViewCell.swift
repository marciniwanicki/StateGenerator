//
//  ListTableViewCell.swift
//  StateGeneratorExamples
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation
import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet private var titleLabel: UILabel!

    func setTitle(_ title: String) {
        titleLabel.text = title
    }
}

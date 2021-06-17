//
//  SomeView.swift
//  SnapshotIssue
//
//  Created by Daren Hayward on 17/06/2021.
//

import Foundation
import UIKit

class SomeView: UIView {
    @IBOutlet weak var titleLabel: UILabel!

    func configure(with viewModel: SomeViewModel) {
        titleLabel.text = viewModel.title
        titleLabel.shadowColor = .blue
        titleLabel.shadowOffset = CGSize.zero
        titleLabel.layer.shadowRadius = 8.0
        titleLabel.layer.shadowOpacity = 0.6
        titleLabel.layer.masksToBounds = false
        titleLabel.layer.shouldRasterize = true
    }
}

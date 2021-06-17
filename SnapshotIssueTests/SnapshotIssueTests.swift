//
//  SnapshotIssueTests.swift
//  SnapshotIssueTests
//
//  Created by Daren Hayward on 17/06/2021.
//

import XCTest
import ADLayoutTest
import ADUtils
import SnapshotTesting
import SwiftCheck
@testable import SnapshotIssue

class SnapshotIssueTests: XCTestCase {

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        runLayoutTests(
            named: "Example",
            randomStrategy: .consistent,
            maxTestsCount: 5
        ) { (viewModel: SomeViewModel) in
            let view = SomeView.ad_fromNib()
            view.overrideUserInterfaceStyle = .light
            view.frame = CGRect(x: 0, y: 0, width: 1600, height: 1000)
            view.configure(with: viewModel)
            view.setNeedsLayout()
            view.layoutIfNeeded()
            assertSnapshot(
                matching: view,
                as: .image
            )

            return .success
        }
    }
}

extension SomeViewModel: Arbitrary {
    public static var arbitrary: Gen<SomeViewModel> {
        return Gen<SomeViewModel>.compose { c in
            return SomeViewModel(title: c.generate(using: .word))
        }
    }
}

//
//  SortViewModelTest.swift
//  iTunesAlbumTests
//
//  Created by 703177808 on 29/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import XCTest

class SortViewModelTest: XCTestCase {

    var currentExpectaion: XCTestExpectation?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testDefaults(){
        let vm = SortViewModel()
        XCTAssertNil(vm.coordinatorDelegate)
    }

    func testSelectRowAtIndexPath(){
        let vm = SortViewModel()
        vm.coordinatorDelegate = self
        currentExpectaion = expectation(description: "testSelectRowAtIndexPath")
        vm.selectRowAtIndexPath(indexPath: NSIndexPath(row: 3, section: 1) as IndexPath)
        waitForExpectations(timeout: 1) { error in
            vm.coordinatorDelegate = nil
        }
    }

}

extension SortViewModelTest: SortViewModelCoordinatorDelegate{
    func didSelectRowForSort(sortValue: SortValue) {
        XCTAssertEqual(SortValue.collectionPrice, sortValue)
        currentExpectaion?.fulfill()
    }


}

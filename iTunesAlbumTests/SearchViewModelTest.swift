//
//  SearchViewModelTest.swift
//  iTunesAlbumTests
//
//  Created by 703177808 on 29/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import XCTest

class SearchViewModelTest: XCTestCase {

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
        let vm = SearchViewModel()
        XCTAssertNil(vm.album)
        XCTAssertNil(vm.model)
        XCTAssertNil(vm.coordinatorDelegate)
    }

//    func testSearch() {
//        let vm = SearchViewModel()
//        vm.model = AlbumListModel()
//        vm.coordinatorDelegate = self
//        currentExpectaion = expectation(description: "testSearch")
//        let album = Album(artistName: "jack", trackName: "upside")
//        vm.album = album
//        vm.search()
//        waitForExpectations(timeout: 50) { error in
//            vm.coordinatorDelegate = nil
//        }
//    }
//}

//extension SearchViewModelTest: SearchViewModelCoordinatorDelegate{
//    func searchButtonAction(result: [Album], data: Album) {
//        XCTAssertEqual("jack", data.artistName)
//        currentExpectaion?.fulfill()
//    }
//
//    
//}

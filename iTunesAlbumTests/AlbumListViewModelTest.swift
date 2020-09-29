//
//  AlbumListViewModelTest.swift
//  iTunesAlbumTests
//
//  Created by 703177808 on 29/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import XCTest

class AlbumListViewModelTest: XCTestCase {
    let vm = AlbumListViewModel()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        vm.items = self.getData()
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
        XCTAssertNil(vm.viewDelegate)
        XCTAssertNil(vm.album)
        XCTAssertNil(vm.sortValue)
        XCTAssertNil(vm.selectedAlbums)
        XCTAssertNil(vm.coordinatorDelegate)
    }

    func getData()-> [Album]{
        guard let pathString = Bundle(
            for: type(of: self)).path(forResource: "MockData", ofType: "json") else {
                fatalError("MockData.json not found")
        }
        let data = NSData(contentsOfFile: pathString)
        let theJsonData = try? JSONSerialization.jsonObject(with: data! as Data, options: [])
        let sm = SearchManager()
        let albums = sm.updateAlbums(data: theJsonData as! NSDictionary)
        return albums
    }
    func testNumberOfItems() {
        XCTAssertEqual(50,vm.numberOfItems)
    }

    func testSearchForItem() {
        vm.album = Album(artistName: "josh", trackName: "toy")
        vm.searchForItem()
    }

    func testItemAtIndex() {
        let album = vm.itemAtIndex(0)
        XCTAssertEqual("Jack Johnson", album?.artistName)
    }


    func testContainsItem() {
//        let sm = SearchManager()
//        let date = sm.convertStringToDate(dateStr: "2006-02-06T12:00:00Z")
//        let album = Album(artistName: "Jack Johnson", trackName: "Upside Down", collectionName: "Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George", collectionPrice: 6.99, releaseDate: date, artworkURL: "https://is2-ssl.mzstatic.com/image/thumb/Music118/v4/24/46/97/24469731-f56f-29f6-67bd-53438f59ebcb/source/100x100bb.jpg")
        vm.selectedAlbums = [Album]()
        vm.selectedAlbums?.append(vm.itemAtIndex(0)!)
        let value = vm.containsItem(vm.itemAtIndex(0)!)
        print(value)
        XCTAssertTrue(value)
    }
}

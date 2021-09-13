//
//  ExtensionViewModel.swift
//  MagicAppTests
//
//  Created by victor.d.ciccarini on 06/05/21.
//
@testable import MagicApp
import XCTest

class ExtensionViewModelTestCase: XCTestCase {

    var sut: ExtensionViewModel!
    var clientStub: ExtensionRequestAPIStub!
    var viewModelDel: ExtensionViewModelDelegateSpy!

    override func setUp() {
//      Arrange
        super.setUp()
        clientStub = ExtensionRequestAPIStub()
        viewModelDel = ExtensionViewModelDelegateSpy()
        sut = ExtensionViewModel(requestApi: clientStub)
        sut.delegate = viewModelDel
        sut.fetchData()
    }
    override func tearDown() {
        sut = nil
        clientStub = nil
        viewModelDel = nil
        super.tearDown()
    }
    func testFetch() {
        XCTAssertTrue(viewModelDel.isShowLoading)
        XCTAssertTrue(viewModelDel.isHideLoading)
        XCTAssertTrue(viewModelDel.isDidDataReady)
        XCTAssertFalse(viewModelDel.isDidErrorOcurred)
    }

}

class ExtensionViewModelDelegateSpy: ExtensionViewModelDelegate {

    var isDidDataReady: Bool = false
    var isShowLoading: Bool = false
    var isHideLoading: Bool = false
    var isDidErrorOcurred: Bool = false

    func didDataReady() {
        isDidDataReady = true
    }

    func showLoading() {
        isShowLoading = true
    }

    func hideLoading() {
        isHideLoading = true
    }

    func didErrorOcurred() {
        isDidErrorOcurred = true
    }
}

//
//  ExtensionScreenViewControllerTestCase.swift
//  MagicAppTests
//
//  Created by victor.d.ciccarini on 04/05/21.
//

@testable import MagicApp
import XCTest

class ExtensionScreenViewControllerTestCase: XCTestCase {

    var sut: ExtensionScreenViewController!
    var spy: ExtensionViewModelSpy!

    override func setUp() {
//      Arrange
        super.setUp()
        spy = ExtensionViewModelSpy()
        sut = ExtensionScreenViewController(viewModel: spy)
    }
    override func tearDown() {
        sut = nil
        spy = nil
        super.tearDown()
    }
    func testAppeareance() {
        sut.beginAppearanceTransition(true, animated: false)
        sut.endAppearanceTransition()
        XCTAssertTrue(sut.view is ExtensionScreen)
        XCTAssertTrue(spy.isFetchCalled)
    }
    func testDidDataReady() {
        let screenSpy = ExtensionScreenSpy()
        sut.extensionScreen = screenSpy
        sut.didDataReady()
        XCTAssertEqual(screenSpy.titleRecieved, "Expansions")
        XCTAssertEqual(screenSpy.itensRecieved.count, spy.expansionList.count)
    }

}

final class ExtensionViewModelSpy: ExtensionViewModel {

    var isFetchCalled: Bool = false

    override func fetchData() {
        isFetchCalled = true
    }

}

final class ExtensionRequestAPIStub: RequestAPIProtocol {

    func request<T>(typeRequest: TypeRequest,
                    typeResponse: T.Type,
                    completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {
        // swiftlint:disable force_cast
        completion(.success(Deck(setsA: [Set.fakeExpansion1(), Set.fakeExpansion2(), Set.fakeExpansion3()]) as! T))
        // swiftlint:enable force_cast
    }
}

final class ExtensionScreenSpy: ExtensionScreen {

    var titleRecieved: String = ""
    var itensRecieved: [ExpansionsListModel] = []

    override func setup(title: String, itens: [ExpansionsListModel]) {
        titleRecieved = title
        itensRecieved = itens
    }
}

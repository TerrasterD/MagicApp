//
//  ExtensionViewModel.swift
//  MagicApp
//
//  Created by victor.d.ciccarini on 29/04/21.
//

import UIKit

struct SetInfo {

    let name: String
    let code: String

}

protocol ExtensionViewModelDelegate: AnyObject {

    func didDataReady()
    func showLoading()
    func hideLoading()
    func didErrorOcurred()

}

class ExtensionViewModel {

    private let requestApi: RequestAPIProtocol
    private(set) var expansionList: [ExpansionsListModel] = []
    weak var delegate: ExtensionViewModelDelegate?

    init(requestApi: RequestAPIProtocol = RequestAPI()) {
        self.requestApi = requestApi
    }

    func fetchData() {

        delegate?.showLoading()
        requestApi.request(typeRequest: ExtensionRequest.decks,
                           typeResponse: Deck.self) { [weak self] response in
            DispatchQueue.main.async { [weak self] in
                self?.delegate?.hideLoading()
                switch response {
                case .success(let data):
                    self?.handleResponse(deck: data)
                    self?.delegate?.didDataReady()
                case .failure:
                    self?.delegate?.didErrorOcurred()
                }
            }
        }

    }

    private func handleResponse(deck: Deck) {

        var sets: [SetInfo] = []
        expansionList.removeAll()
        sets = deck.setsA.map {SetInfo( name: $0.name, code: $0.code)}
        sets.sort { $0.name < $1.name}
        var auxLetter: String = ""
        sets.forEach { item in
            guard let letter = item.name.first?.uppercased() else {return}
            if letter != auxLetter {
                auxLetter = letter
                let rows = sets.filter {$0.name.first?.uppercased() == letter }
                let list = ExpansionsListModel(sectionTitle: letter, rows: rows)
                expansionList.append(list)
            }
        }
    }

}

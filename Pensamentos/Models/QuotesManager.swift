//
//  File.swift
//  Pensamentos
//
//  Created by André Felipe de Sousa Almeida - AAD on 21/09/21.
//

import Foundation


class QuotesManager {
    let quotes: [Quote]
    
    init(){
        let fileURL = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        let jsonData = try! Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        quotes = try! decoder.decode([Quote].self, from: jsonData)
    }
}

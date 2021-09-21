//
//  Quotes.swift
//  Pensamentos
//
//  Created by André Felipe de Sousa Almeida - AAD on 21/09/21.
//

import Foundation

struct Quote: Codable {
    let quote: String
    let author: String
    let image: String
    
    var quoteFormatted: String {
        "❝" + quote + "❞"
    }
    
    var authorFormatted: String {
        "―" + author + "―"
    }
}

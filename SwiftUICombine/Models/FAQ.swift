//
//  SwiftUIView.swift
//  SwiftUICombine
//
//  Created by Rodrigo Santos on 18/06/21.
//

import SwiftUI

struct FAQ: Decodable, Identifiable {
    var id: Int
    var question: String
    var answer: String
}

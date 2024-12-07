//
//  Model.swift
//  MVVM-Coordinator
//
//  Created by shashank mishra on 07/12/24.
//

import Foundation

let jsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()

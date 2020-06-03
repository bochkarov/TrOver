//
//  SerializationError.swift
//  TrOver
//
//  Created by Bochkarov Valentyn on 03/06/2020.
//  Copyright © 2020 Bochkarov Valentyn. All rights reserved.
//  `SerializationError` is an `Error` enum that represents a JSON serialization error.

import Foundation

enum SerializationError: Error {
    
    /// This case indicates that the expected field in the JSON object is not found.
    case missing(String)
}

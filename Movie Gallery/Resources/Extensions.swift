//
//  Extensions.swift
//  Movie Gallery
//
//  Created by Martín Serrano on 14/09/23.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}

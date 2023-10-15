//
//  Extensions.swift
//  Netflix Clone One
//
//  Created by Jaloliddin Egamberdiyev on 15/10/23.
//

import Foundation


extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}

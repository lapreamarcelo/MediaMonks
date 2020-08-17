//
//  Enviroment.swift
//  MediaMonks
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

import Foundation

enum AppConfigKey: String {
    case baseURL = "BASE_URL"
}

struct Enviroment {

    func urlValue(withKey key: AppConfigKey) -> URL? {
        guard let stringURL = infoDictionary[key.rawValue] as? String, let url = URL(string: stringURL) else {
            return nil
        }

        return url
    }

    private let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        
        return dict
    }()
}


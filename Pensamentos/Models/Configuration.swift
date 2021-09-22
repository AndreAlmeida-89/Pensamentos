//
//  Configuration.swift
//  Pensamentos
//
//  Created by André Felipe de Sousa Almeida - AAD on 21/09/21.
//

import Foundation

enum UserDafaultsKeys: String {
    case timeInterval = "timeInterval"
    case colorScheme = "colorScheme"
    case autorefresh = "autorefresh"
}

class Configuration {
    let defaults = UserDefaults.standard
    static var shared: Configuration = Configuration()
    
    var timeInterval: Double {
        get {
            defaults.double(forKey: UserDafaultsKeys.timeInterval.rawValue)
        }
        set {
            defaults.set(newValue, forKey: UserDafaultsKeys.timeInterval.rawValue)
        }
    }
    
    var colorScheme: Int {
        get {
            defaults.integer(forKey: UserDafaultsKeys.colorScheme.rawValue)
        }
        set {
            defaults.set(newValue, forKey: UserDafaultsKeys.colorScheme.rawValue)
        }
    }
    
    var autorefresh: Bool {
        get {
            defaults.bool(forKey: UserDafaultsKeys.autorefresh.rawValue)
        }
        set {
            defaults.set(newValue, forKey: UserDafaultsKeys.autorefresh.rawValue)
        }
    }
    
    private init(){
        
        if defaults.double(forKey: UserDafaultsKeys.timeInterval.rawValue) == 0 {
            defaults.set(8.0, forKey: UserDafaultsKeys.timeInterval.rawValue)
        }
    }
    
}

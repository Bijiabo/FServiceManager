//
//  FConstant.swift
//  F
//
//  Created by huchunbo on 15/11/10.
//  Copyright © 2015年 TIDELAB. All rights reserved.
//

import Foundation

public struct FConstant {
    struct Notification {
        // FStatus
        struct FStatus {
            static let addObserver = "FStatus_AddObserver"
            static let removeObserver = "FStatus_RemoveObserver"

            static let didLogin = "FStatus_DidLogin"
            static let didLogout = "FStatus_DidLogout"
        }
    }
    
    struct UserDefaults {
        //FStatus
        struct FStatus {
            static let logged_in = "logged_in"
        }
    }
    
    struct String {
        struct FStatus {
            static let loginStatus = "_loginStatus"
        }
    }
}
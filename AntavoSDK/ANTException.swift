//
//  Exception.swift
//  AntavoSDK
//
//  Copyright © 2017 Antavo Ltd. All rights reserved.
//

enum ANTException: Error {
    case runtimeError(String)
    case apiError(String)
}

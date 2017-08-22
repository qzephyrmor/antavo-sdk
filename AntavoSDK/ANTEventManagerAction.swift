//
//  ANTEventManagerAction.swift
//  AntavoSDK
//
//  Created by AntavoDev on 22/08/17.
//  Copyright © 2017 Fekete Zsolt. All rights reserved.
//

// MARK: Event Manager Action entry class.
class ANTEventManangerAction {
    /**
     Stores a callback function for a registered manager action (non-parameterezied callbacks).
     */
    let action:(() -> ())?
    
    /**
     Stores a callback function for a registered manager action (parameterized callbacks).
     */
    let actionExpectsInfo:((Any?) -> ())?
    
    /**
     Initializes an ANTEventManagerAction object to receive Antavo SDK events without any extra data.
     
     - Parameter callback: Defines a callback function which gets all necessary data from initator.
     */
    init(callback: @escaping (() -> ()) ) {
        self.action = callback;
        self.actionExpectsInfo = nil;
    }
    
    /**
     Initializes an ANTEventManagerAction object to receive Antavo SDK events.
     
     - Parameter callback: Defines a callback function which gets all necessary data from intiator.
     */
    init(callback: @escaping ((Any?) -> ()) ) {
        self.actionExpectsInfo = callback;
        self.action = nil;
    }
}

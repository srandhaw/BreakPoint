//
//  Message.swift
//  BreakPoint
//
//  Created by Sehajbir Randhawa on 7/25/18.
//  Copyright © 2018 Sehajbir. All rights reserved.
//

import Foundation

class Message{
    private var _content: String
    private var _senderID: String
    
    var content: String{
        return _content
    }
    
    var senderID: String{
        return _senderID
    }
    
    init(content: String, senderID: String) {
        self._content = content
        self._senderID = senderID
    }
    
}

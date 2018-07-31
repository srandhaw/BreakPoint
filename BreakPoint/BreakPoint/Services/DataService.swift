//
//  DataService.swift
//  BreakPoint
//
//  Created by Sehajbir Randhawa on 7/19/18.
//  Copyright © 2018 Sehajbir. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService{
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    
    var REF_BASE: DatabaseReference{
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference{
        return _REF_USERS
    }
    
    var REF_GROUPS: DatabaseReference{
        return _REF_GROUPS
    }
    
    var REF_FEED: DatabaseReference{
        return _REF_FEED
    }
    
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    func uploadPost(message: String, uid: String, groupKey: String?, completion: @escaping CompletionHandler){
        
        if(groupKey != nil){
            //send to groups ref
        }
        else{
            _REF_FEED.childByAutoId().updateChildValues(["content": message, "senderId": uid])
            completion(true)
        }
        
    }
    
    func getAllFeedMessages(handler: @escaping (_ messages: [Message]) -> ()){
        
        var messageArray: [Message] = []
        
        REF_FEED.observeSingleEvent(of: .value) { (feedMessageSnapshot) in
            
            guard let feedMessageSnapshot = feedMessageSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for message in feedMessageSnapshot{
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderID = message.childSnapshot(forPath: "senderId").value as! String
                let message = Message(content: content, senderID: senderID)
                messageArray.append(message)
            }
            
            handler(messageArray)
        }
    }
    
    func getUsernameFromUID(uid: String, handler: @escaping (_ username: String) -> ()){
        REF_USERS.observeSingleEvent(of: .value) { (usersSnapshot) in
            
            guard let usersSnapshot = usersSnapshot.children.allObjects  as? [DataSnapshot] else { return }
            
            for user in usersSnapshot{
                if user.key == uid {
                    handler(user.childSnapshot(forPath: "email").value  as! String)
                }
            }
        }
    }
    
    func getEmail(searchQuery: String, handler: @escaping (_ emailArray: [String]) -> ()){
        
        var emailArray: [String] = []
        
        REF_USERS.observe(.value) { (userSnapshot) in
            
             guard let userSnapshot = userSnapshot.children.allObjects  as? [DataSnapshot] else { return }
            
            for user in userSnapshot{
                let email = user.childSnapshot(forPath: "email").value as! String
               
                if(email.contains(searchQuery) && email != Auth.auth().currentUser?.email){
                    emailArray.append(email)
                }
            }
            handler(emailArray)
        }
        
        
        
    }
    
    func getIDsForUsername(usernames: [String], handler: @escaping (_ uidArray: [String]) -> ()){
        var uidArray: [String] = []
        
         REF_USERS.observe(.value) { (userSnapshot) in
            
            guard let userSnapshot = userSnapshot.children.allObjects  as? [DataSnapshot] else { return }
            
            for user in userSnapshot{
                let email = user.childSnapshot(forPath: "email").value as! String
                if(usernames.contains(email)){
                    uidArray.append(user.key)
                }
            }
            handler(uidArray)
    }
    
}
    
    func createGroup(title: String, description: String, idArray: [String], handler: @escaping (_ completion: Bool) -> ()){
        
        REF_GROUPS.childByAutoId().updateChildValues(["title": title, "description": description, "members": idArray])
        
        handler(true)
    }
    
    func getAllGroups(handler: @escaping (_ groupsArray: [Group]) -> ()){
        var groupsArray: [Group] = []
        
        REF_GROUPS.observe(.value) { (groupSnapshot) in
            
            guard let groupSnapshot = groupSnapshot.children.allObjects  as? [DataSnapshot] else { return }
            
            for group in groupSnapshot{
                let memberArray = group.childSnapshot(forPath: "members").value as! [String]
                if(memberArray.contains((Auth.auth().currentUser?.uid)!)){
                    
                    let title = group.childSnapshot(forPath: "title").value as! String
                    let descriptionG = group.childSnapshot(forPath: "description").value as! String
                    let key =  group.key
                    let group1 = Group(groupTitle: title, groupDesc: descriptionG, key: key, memberCount: memberArray.count, members: memberArray)
                    groupsArray.append(group1)
                }
            }
            handler(groupsArray)
    }
        
    }
        
    
}



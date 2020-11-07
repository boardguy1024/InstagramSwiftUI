//
//  DataHandler.swift
//  InstagramSwiftUI
//
//  Created by park kyung suk on 2020/09/20.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase

class DataHandler: ObservableObject {
    @Published var homePagePosts = [Post]()
    @Published var explorePagePosts = [PostIdentifiable]()
    @Published var searchPosts = [Post]()
    @Published var loggedInUser = UserObject()
    init() {
        self.loadHomePagePosts()
        self.loadExplorePagePosts()
    }
    
    func loadHomePagePosts() {
        let ref = Database.database().reference()
        ref.child("posts").observe(.value) { (snapshot) in
            
            for snap in snapshot.children.allObjects as! [DataSnapshot] {
                
                guard let dict = snap.value as? [String: AnyObject] else { return }
                self.homePagePosts.append(handlePostDict(dict))
                self.homePagePosts.sort { (post1, post2) -> Bool in
                    post1.date!.compare(post2.date!) == .orderedDescending
                }
            }
        }
    }
    
    func loadExplorePagePosts() {
        let ref = Database.database().reference()
        ref.child("posts").observe(.value) { (snapshot) in
            
            for snap in snapshot.children.allObjects as! [DataSnapshot] {
                
                guard let dict = snap.value as? [String: AnyObject] else { return }
                self.explorePagePosts.append(PostIdentifiable(post: handlePostDict(dict)))
            }
        }
    }
    
    func loadPostsFrom(_ keyword: String) {
        let ref = Database.database().reference()
        print("my SearchTerms: \(keyword)")
        ref.child("posts").queryOrdered(byChild: "searchTerms/\(keyword)").queryEqual(toValue: true).observeSingleEvent(of: .value) { snapshot in
            
            for snap in snapshot.children.allObjects as! [DataSnapshot] {
                print("snapValue: \(snap.value)")
                guard let dict = snap.value as? [String: AnyObject] else { return }
                self.searchPosts.append(handlePostDict(dict))
            }
        }
    }
    
    func checkIfLoggedIn(completion: @escaping (_ isLoggedIn: Bool) -> ()) {
        
        guard let userId = Auth.auth().currentUser?.uid else {
            completion(false)
            return
        }
        
        if uiRealm.object(ofType: UserObject.self, forPrimaryKey: userId) != nil {
           let ref = Database.database().reference().child("users")
            ref.child(userId).observeSingleEvent(of: .value) { (snapshot) in
                guard let dict = snapshot.value as? [String: AnyObject] else { return }
                self.loggedInUser = handleUserDict(dict)
                completion(true)
            }
        } else {
            completion(false)
        }
    }
}

func handlePostDict(_ dict: [String: AnyObject]) -> Post {
    let post = Post()
    
    post.id = dict["id"] as? String ?? ""
    post.comment = dict["comment"] as? String ?? ""
    post.date = (dict["date"] as? String ?? "").iso8601
    post.aspectRatio = dict["aspectRatio"] as? Double ?? 1.0
    post.imageUrl = dict["imageUrl"] as? String ?? ""
    
    post.writeToRealm()
    return post
}

func handleUserDict(_ dict: [String: AnyObject]) -> UserObject {
    let user = UserObject()
    
    user.id = dict["uid"] as? String ?? ""
    user.username = dict["username"] as? String ?? ""
    user.writeToRealm()
    return user
}




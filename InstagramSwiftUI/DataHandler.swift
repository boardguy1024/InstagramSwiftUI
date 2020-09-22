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

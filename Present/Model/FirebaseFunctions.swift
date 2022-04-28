//
//  FirebaseFunctions.swift
//  Present
//
//  Created by Lauren Kelz (student LM) on 2/3/22.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import SwiftUI

struct FirebaseFunctions{
    
    static func getUserInfo(_ userInfo: UserInfo){
        Auth.auth().addStateDidChangeListener {_, user in
            guard let user = user else {
                print("failed to get user info")
                return
            }
            
            userInfo.email = user.email ?? ""
            userInfo.loggedIn = true
            
            let uid = user.uid
            print(uid)
            Firestore
                .firestore()
                .collection("users")
                .document(uid)
                .getDocument { document, _ in
                    guard let document = document else {return}
                    //getting inforamtion from user's document
                    userInfo.email = document.get("email") as? String ?? ""
                    
                }
            
        }
    }
    
    static func signOut(_ userInfo: UserInfo)
    {
        //wraps failure exeption
        try? Auth.auth().signOut()
        userInfo.loggedIn = false
    }
    
    static func addUserName(_ name: String){
        //get the user's id. The image will be stored by this uid.
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        Firestore.firestore()
            .collection("users")
            .document(uid)
            .setData(["name" : name], merge: true)//true means if the document already exists it appends image url to data that already exists
        
    }
    
    static func addBirthday(_ bday: Date){
        //get the user's id. The image will be stored by this uid.
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        Firestore.firestore()
            .collection("users")
            .document(uid)
            .setData(["birthday" : bday], merge: true)//true means if the document already exists it appends image url to data that already exists
        
    }
    
    static func addWishlist(_ wishlist: String){
        //get the user's id. The image will be stored by this uid.
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        Firestore.firestore()
            .collection("users")
            .document(uid)
            .setData(["wishlist" : wishlist], merge: true)//true means if the document already exists it appends image url to data that already exists
        
    }
    
    static func authenticate(email : String, password : String, completion : @escaping (Bool)  -> ()){
        Auth.auth().createUser(withEmail: email, password: password){ user, error in
            if let _ = user{
                print("user created")
                completion(true)
                return
            }
            else{
                print(error.debugDescription)
                completion(false)
                return
            }
        }
    }
    
    static func mergeUser(_ data: [String: Any], completion: @escaping (Error?) -> ()) {
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        
        
        Firestore
            
            .firestore()
            
            .collection("users")
            
            .document(uid)
            
            .setData(data, merge: true) { (error) in
                
                completion(error)
                
                return
                
            }
        
    }
    
    static func createUser(_ userInfo: UserInfo,
                           
                           withEmail email:String,
                           
                           password:String,
                           
                           completion:@escaping (Error?) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            
            guard let uid = result?.user.uid else {
                
                completion(error)
                
                return
                
            }
            
            let data = ["uid": uid, "email": email]
            
            userInfo.uid = UUID(uuidString: uid) ?? UUID()
            
            FirebaseFunctions.mergeUser(data) { (error) in
                
                //                if error == nil{
                //                    // call upload picture.
                //                    FirebaseFunctions.uploadPicture(UIImage(imageLiteralResourceName: "user")) { _ in
                //                    }
                //                }
                
                completion(error)
            }
            
        }
        
    }
    
    static func login(email: String, password: String, completion: @escaping (Bool) -> ()){
        Auth.auth().signIn(withEmail: email, password: password){
            user, error in
            if let _ = user{
                print("user created")
                completion(true)
                return
            }
            else{
                print(error.debugDescription)
                completion(false)
                return
            }
        }
    }
    
    static func forgotPassword(email : String, completion : @escaping (Bool) -> ()){
        Auth.auth().sendPasswordReset(withEmail: email){ error in
            if let _ = error{
                completion(false)
                return
            } else{
                completion(true)
                return
            }
        }
    }
    
    static func getFriendFromEmail(userInfo: UserInfo, email: String, completion: @escaping (Bool) -> ()){
        
        let collectionRef = Firestore
            
            .firestore()
            
            .collection("users")
        
        
        collectionRef.whereField("email", isEqualTo: email)
            
            .getDocuments { (snapshot, err) in
                
                if err != nil || (snapshot?.isEmpty)! {
                    
                    completion(false)
                    
                } else {
                    
                    for document in (snapshot?.documents)! {
                        
                        if let FriendUID = document.data()["uid"]{
                            
                            Firestore
                                
                                .firestore()
                                
                                .collection("users")
                                
                                .document(FriendUID as! String)
                                
                                .getDocument{ (document, err) in
                                    guard let data = document?.data() else {
                                        completion(false)
                                        return
                                    }
                                    
                                    userInfo.friends.append(FriendInfo(data: data))
                                    mergeUser(userInfo.dataAsDictionary()) { _ in
                                        
                                    }
                                }
                        
                            completion(true)
                            
                        }
                        
                    }
                    
                }
                
            }
    }
}


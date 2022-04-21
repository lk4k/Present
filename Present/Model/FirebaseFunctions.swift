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
//                    let imageURL = document.get("image") as? String ?? ""
                    userInfo.name = document.get("name") as? String ?? ""
                    
//                    Storage
//                        .storage()
//                        .reference(forURL: imageURL)
//                        .getData(maxSize: 1 * 1024 * 1024) { data, _ in
//                            if let imageData = data {
//                                userInfo.image = UIImage(data: imageData) ??
//                                    UIImage(named: "user")!
//                            }
//
//                        }
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

    static func uploadPicture(_ image: UIImage, completion: @escaping (Bool) -> ()){
        //get the user's id. The image will be stored by this uid.
        guard let uid = Auth.auth().currentUser?.uid else{
            completion(false)
            return
        }
        
        //get a reference to the storage singleton.
        //creates path to put image
        let storage = Storage.storage().reference().child("users/\(uid)")
        
        
        //convert the image to a form that can be stored in storage as data
        //compresses data so you don't get charged a lot for storage in real app
        guard let imageData = image.jpegData(compressionQuality: 0.50) else{
            completion(false)
            return
        }
        
        //add to storage
        //needs metadata to give info about where data was stored.
        storage.putData(imageData, metadata: StorageMetadata()) { meta, error
            in
            if let _ = meta{
                storage.downloadURL { url, error in
                    guard let downloadURL = url else {return}
                    Firestore.firestore()
                        .collection("users")
                        .document(uid)
                        .setData(["image" : downloadURL.absoluteString], merge: true)//true means if the document already exists it appends image url to data that already exists
                }
            }
        }
        
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
}

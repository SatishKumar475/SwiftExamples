//
//  DataBase.swift
//  AppShark
//
//  Created by satish on 04/01/16.
//  Copyright © 2016 Satish. All rights reserved.
//

import UIKit
//import sqlite3
var AppsharkDB : COpaquePointer = nil
var dataBasePath = NSString()
  var statement:COpaquePointer = nil
class DataBase: NSObject {
    class var shareDatabase: DataBase {
        get {
            struct Static {
                static var instance: DataBase? = nil
                static var token: dispatch_once_t = 0
            }
            dispatch_once(&Static.token, {
                Static.instance = DataBase()
            })
            return Static.instance!
        }
        
    }
    func createUserDetailsTable() {
        let documents = try! NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
        let fileURL = documents.URLByAppendingPathComponent("Appshark.sqlite")
//        var err : NSError?
//        if !filemanger.fileExistsAtPath(dataBasePath as String) {
            let dbPath = (fileURL.path! as NSString).UTF8String
            if dbPath == nil {
                
            }
             if sqlite3_open(dbPath, &AppsharkDB) == SQLITE_OK {
                
                var errMsg: UnsafeMutablePointer<Int8> = nil
                let sql_stm1 = "CREATE TABLE IF NOT EXISTS USERDETAILS (ID INTEGER PRIMARY KEY AUTOINCREMENT,FIRSTNAME TEXT,LASTNAME TEXT,EMAIL TEXT,PHONENUMBER TEXT,PASSWORD TEXT)"
                if (sqlite3_exec(AppsharkDB, sql_stm1, nil, nil, &errMsg) != SQLITE_OK) {
                    print("failed create table,\(errMsg)")
                }else {
                    print("create table")
                }
                
                
            }
//            if sq
//        }
    }
    func insertuserdetails (query : NSString) -> Bool {
        let documents = try! NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
        let fileURL = documents.URLByAppendingPathComponent("Appshark.sqlite")
        let dbPath = (fileURL.path! as NSString).UTF8String
       
        if sqlite3_open(dbPath, &AppsharkDB) == SQLITE_OK {
         let modelquiry = "INSERT INTO USERDETAILS (FIRSTNAME,LASTNAME,EMAIL,PHONENUMBER,PASSWORD) VALUES (?,?,?,?,?)"
          if sqlite3_prepare_v2(AppsharkDB, modelquiry, -1, &statement, nil) == SQLITE_OK{
            sqlite3_bind_text(statement, 1, ("Satish" as NSString).UTF8String, -1, nil)
            sqlite3_bind_text(statement, 2, ("Kumar" as NSString).UTF8String, -1, nil)
            sqlite3_bind_text(statement, 3, ("bujji475@gmail.com" as NSString).UTF8String, -1, nil)
            sqlite3_bind_text(statement, 4, ("8500140475" as NSString).UTF8String, -1, nil)
            sqlite3_bind_text(statement, 5, ("Satish475" as NSString).UTF8String, -1, nil)
                if sqlite3_step(statement) == SQLITE_DONE {
                    print("successfully insertted")
                }
                sqlite3_finalize(statement)
            }
             sqlite3_close(AppsharkDB);
        }
        
        
        
        
        return true
    }
    func fettchinguserdetails () {
        let documents = try! NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
        let fileURL = documents.URLByAppendingPathComponent("Appshark.sqlite")
        let dbPath = (fileURL.path! as NSString).UTF8String
        
        if sqlite3_open(dbPath, &AppsharkDB) == SQLITE_OK {
//            var querySQL = NSString(format:"SELECT PHONENUMBER FROM CONTACTUS") as NSString
            let querySQL = "SELECT ID,FIRSTNAME, LASTNAME, EMAIL, PHONENUMBER, PASSWORD FROM USERDETAILS" as NSString
            let query_stmt = (querySQL as NSString).UTF8String
            
            if sqlite3_prepare_v2(AppsharkDB, query_stmt, -1, &statement, nil) == SQLITE_OK{
                while sqlite3_step(statement) == SQLITE_ROW {
                    let id = String.fromCString(UnsafePointer<CChar>(sqlite3_column_text(statement,0)))!
                    let firstname = String.fromCString(UnsafePointer<CChar>(sqlite3_column_text(statement,1)))!
                    let lastName = String.fromCString(UnsafePointer<CChar>(sqlite3_column_text(statement, 2)))!
                    let email = String.fromCString(UnsafePointer<CChar>(sqlite3_column_text(statement, 3)))!
                    let phoneNumber = String.fromCString(UnsafePointer<CChar>(sqlite3_column_text(statement, 4)))!
                    print("id : \(id),FirstName:\(firstname),LastName :\(lastName),email : \(email),PhoneNumber :\(phoneNumber)")
                    
                }
                 sqlite3_finalize(statement)

        }
              sqlite3_close(AppsharkDB);
        
    }
    
}
    func deleterow (quirySyring : NSString) {
        let documents = try! NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
        let fileURL = documents.URLByAppendingPathComponent("Appshark.sqlite")
        let dbPath = (fileURL.path! as NSString).UTF8String
        
        if sqlite3_open(dbPath, &AppsharkDB) == SQLITE_OK {
            //            var querySQL = NSString(format:"SELECT PHONENUMBER FROM CONTACTUS") as NSString
            
            let querySQL = String("DELETE FROM USERDETAILS WHERE EMAIL='\(quirySyring)'") as NSString
            
            let query_stmt = (querySQL as NSString).UTF8String
             if sqlite3_prepare_v2(AppsharkDB, query_stmt, -1, &statement, nil) == SQLITE_OK{
                if sqlite3_step(statement) == SQLITE_DONE {
                    print("successfully Delete")
                }

            }
        }
        
        
        
        
    }
    func getUserDetailbasedOnId (sendertag : NSInteger) {
        let documents = try! NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
        let fileURL = documents.URLByAppendingPathComponent("Appshark.sqlite")
        let dbPath = (fileURL.path! as NSString).UTF8String
        
        if sqlite3_open(dbPath, &AppsharkDB) == SQLITE_OK {
            //            var querySQL = NSString(format:"SELECT PHONENUMBER FROM CONTACTUS") as NSString
            
            let querySQL = String("SELECT * FROM USERDETAILS WHERE ID=\(sendertag)") as NSString
            
            let query_stmt = (querySQL as NSString).UTF8String
            if sqlite3_prepare_v2(AppsharkDB, query_stmt, -1, &statement, nil) == SQLITE_OK{
                if sqlite3_step(statement) == SQLITE_ROW {
                    let firstname = String.fromCString(UnsafePointer<CChar>(sqlite3_column_text(statement,0)))!
                    let lastName = String.fromCString(UnsafePointer<CChar>(sqlite3_column_text(statement, 1)))!
                    let email = String.fromCString(UnsafePointer<CChar>(sqlite3_column_text(statement, 2)))!
                    let phoneNumber = String.fromCString(UnsafePointer<CChar>(sqlite3_column_text(statement, 3)))!
                    print("FirstName:\(firstname),LastName :\(lastName),email : \(email),PhoneNumber :\(phoneNumber)")
                }
            }
        }
    }
    
}

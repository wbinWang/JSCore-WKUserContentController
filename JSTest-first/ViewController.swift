//
//  ViewController.swift
//  JSTest-first
//
//  Created by wenbin on 2018/4/18.
//  Copyright © 2018年 WeDoMusic. All rights reserved.
//

import UIKit
import JavaScriptCore
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let context = JSContext.init() {
//            let log = {(str : String) -> Void in
//                print("log begin")
//                if let args = JSContext.currentArguments() as? [JSValue] {
//                    for vv in args {
//                        print(vv)
//                    }
//                }
//                if let this = JSContext.currentThis() {
//                    print(this)
//                }
//                print("log end")
//            }
//            context.setObject(log, forKeyedSubscript: "log" as NSCopying & NSObjectProtocol)
//            if let jsLog = context.objectForKeyedSubscript("log") {
//                jsLog.call(withArguments: ["123"])
//            }
            if let context = JSContext.init() {
                let wb = WangBin.init()
                let str = NSString.init(string: "swiftWb")
                context.setObject(wb, forKeyedSubscript: str)
                if let jsWb = context.objectForKeyedSubscript("swiftWb") {
                    if let sWb = jsWb.toObject() as? WangBin {
                        print(sWb.oneValue)
                        print(sWb.secValue)
                        sWb.log()
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class WangBin : NSObject , JSExport {
    var oneValue : String!
    var secValue : String!
    
    override init() {
        super.init()
        oneValue = "one"
        secValue = "sec"
    }
    
    func log() {
        print("log begin")
        //        if let args = JSContext.currentArguments() as? [JSValue] {
        //            for vv in args {
        //                print(vv)
        //            }
        //        }
        //        if let this = JSContext.currentThis() {
        //            print(this)
        //        }
        print("log end")
    }
}


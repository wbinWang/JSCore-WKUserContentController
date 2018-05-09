//
//  WBJSMovieHandle.swift
//  JSTest-first
//
//  Created by wenbin on 2018/5/9.
//  Copyright © 2018年 WeDoMusic. All rights reserved.
//

import UIKit
import JavaScriptCore
@objc protocol WBJSMovieHandleDelegate : JSExport {
    
    /// 跳转到视频选择器
    ///
    /// - Parameters:
    ///   - minDuration: 最小时长
    ///   - maxDuration: 最大时长
    func pushMoviePickerCtr(_ minDuration : Float, maxDuration : Float)
    
    func push(_ min : Float)
    
    func test()
    
    func getUserToken() -> String
}

@objc class WBJSMovieHandle : NSObject , WBJSMovieHandleDelegate {
    func getUserToken() -> String {
        return "ttttttttttttttttooooooooooookkkkkkkkkeeeeen"
    }
    
    func push(_ min: Float) {
        print(Thread.current)
        DispatchQueue.main.async {
            if let ctr = self.wb_controller {
                let movie = WBMoviePickerViewController()
                movie.min = min
                movie.max = 100000.0
                ctr.navigationController?.pushViewController(movie, animated: true)
            }
        }
    }
    
    
    weak var wb_controller : UIViewController?
    
    var jsContext : JSContext?
    
    override init() {
        super.init()
    }
    
    func pushMoviePickerCtr(_ minDuration: Float, maxDuration: Float) {
        print(Thread.current)
        DispatchQueue.main.async {
            if let ctr = self.wb_controller {
                let movie = WBMoviePickerViewController()
                movie.min = minDuration
                movie.max = maxDuration
                ctr.navigationController?.pushViewController(movie, animated: true)
            }
        }
    }
    
    func test() {
        if #available(iOS 10.0, *) {
            let _ = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (tt) in
                self.runing()
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    @objc func runing() {
        let xx = arc4random_uniform(10000)
        print(xx)
        if let htmlJsFunc = self.jsContext?.objectForKeyedSubscript("wbProgress") {
            print(htmlJsFunc)
            htmlJsFunc.call(withArguments: [xx])
        }
    }
}

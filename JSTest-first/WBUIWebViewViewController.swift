//
//  WBUIWebViewViewController.swift
//  JSTest-first
//
//  Created by wenbin on 2018/5/9.
//  Copyright © 2018年 WeDoMusic. All rights reserved.
//

import UIKit
import JavaScriptCore
import WebKit
class WBUIWebViewViewController: UIViewController {
    
    var webView : UIWebView!
    
    var jsContext : JSContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView = UIWebView.init(frame: self.view.bounds)
        self.webView.delegate = self
        self.view.addSubview(webView)
        
        if let t1 = Bundle.main.url(forResource: "t1", withExtension: "html") {
            let req = URLRequest.init(url: t1)
            self.webView.loadRequest(req)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension WBUIWebViewViewController : UIWebViewDelegate {

    func webViewDidFinishLoad(_ webView: UIWebView) {
        if let jsc = webView.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") as? JSContext {
            print(jsc)
            self.jsContext = jsc
            
            let jsh = WBJSMovieHandle()
            jsh.wb_controller = self
            jsh.jsContext = jsc
            self.jsContext!.setObject(jsh, forKeyedSubscript: "WBJSMovieHandle" as NSCopying & NSObjectProtocol)
            
//            if let url = webView.request?.url {
//                print("let url = webView.request?.url--------------oooo")
//                let xx = try? String.init(contentsOf: url, encoding: .utf8)
//                print(xx ?? "")
//                self.jsContext!.evaluateScript(xx!)
//            }
            
            self.jsContext?.exceptionHandler = {(context , ex) in
                print("exceptionHandler-------------->>>")
                print(context ?? "")
                print(ex ?? "")
            }
        }
    }
}


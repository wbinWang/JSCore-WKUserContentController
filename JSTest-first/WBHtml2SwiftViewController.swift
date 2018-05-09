//
//  WBHtml2SwiftViewController.swift
//  JSTest-first
//
//  Created by wenbin on 2018/4/18.
//  Copyright © 2018年 WeDoMusic. All rights reserved.
//

import UIKit
import JavaScriptCore
import WebKit
class WBHtml2SwiftViewController: UIViewController {

    var wkView : WKWebView!
    
    var handle : WBJSMovieHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handle = WBJSMovieHandle.init()
        handle.wb_controller = self
        
        let wkConfig = WKWebViewConfiguration.init()
        wkConfig.userContentController = WKUserContentController.init()
        wkConfig.userContentController.add(self, name: "WBWKView")
        
        self.wkView = WKWebView.init(frame: self.view.bounds , configuration: wkConfig)
        self.wkView.uiDelegate = self
        self.wkView.navigationDelegate = self
        self.view.addSubview(wkView)
        
        if let t1 = Bundle.main.url(forResource: "t2_wkview", withExtension: "html") {
            let req = URLRequest.init(url: t1)
            self.wkView.load(req)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("WBHtml2SwiftViewController deinit")
        
    }
}
extension WBHtml2SwiftViewController : WKUIDelegate {
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        
    }
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Swift.Void) {
        
    }
}
extension WBHtml2SwiftViewController : WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        //填充数据
        self.wkView.evaluateJavaScript("wbUserToken(123123123)", completionHandler: nil)
    }
}
extension WBHtml2SwiftViewController : WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let name = message.name
        print(name)
        print(message.body)
        if let dict = message.body as? Dictionary<String , Any> {
            let method = dict["method"] as! String
            if method == "pushMoviePickerCtr" {
                let par = dict["param"] as! [String : Float]
                handle.pushMoviePickerCtr(par["min"]!, maxDuration: par["max"]!)
            }else if method == "callBackPreogress" {
                self.progressBegin()
            }
        }
    }
}
extension WBHtml2SwiftViewController {
    func progressBegin() {
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
        self.wkView.evaluateJavaScript("wbProgress(\(xx))", completionHandler: nil)
    }
}

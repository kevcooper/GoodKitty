//
//  AppDelegate.swift
//  GoodKitty
//
//  Created by Kevin Cooper on 7/15/15.
//  Copyright © 2015 Coorpe. All rights reserved.
//

import Cocoa
import WebKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var menu: NSMenu!
    @IBOutlet weak var startButton: NSMenuItem!
    @IBOutlet weak var streamView: WebView!
    
    let sysBar = NSStatusBar.systemStatusBar()
    var statusIcon = NSImage(named: "status_icon_black.pdf")
    var statusItem: NSStatusItem!
    var playing = false
    
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        if let appearance = NSUserDefaults.standardUserDefaults().stringForKey("AppleInterfaceStyle"){
            if(appearance == "Dark"){
                statusIcon = NSImage(named: "status_icon_white.pdf")
            }
        }
        
        statusItem = sysBar.statusItemWithLength(NSVariableStatusItemLength)
        statusItem!.image = statusIcon
        statusItem!.alternateImage = statusIcon
        statusItem!.menu = menu
        
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func pressStart(sender: AnyObject) {
        if(!playing){
            streamView.mainFrame.loadRequest(NSURLRequest(URL: NSURL(string: "http://www.twitch.tv/monstercat/embed")!))
            playing = true
        }else{
            streamView.mainFrame.loadRequest(NSURLRequest(URL: NSURL(string: "about:blank")!))
            playing = false
        }
    }
    
}


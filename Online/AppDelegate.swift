//
//  AppDelegate.swift
//  Online
//
//  Created by jsxqf on 15/5/24.
//  Copyright (c) 2015年 jsxqf. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    var timer:NSTimer?
    @IBOutlet weak var onlineMenu: NSMenu!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        let successIcon = NSImage(named: "successIcon")
//        successIcon?.setTemplate(true)
        
        statusItem.image = successIcon
        statusItem.menu = onlineMenu
        
        let sec = 5.0
        self.timer = NSTimer.scheduledTimerWithTimeInterval(sec, target: self, selector: "onTimerUpdate", userInfo: nil, repeats: true)
        self.timer?.fire()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func onTimerUpdate(){
        
        let successIcon = NSImage(named: "successIcon")
        let failIcon = NSImage(named: "failIcon")
        
        if(Reachability.isConnectedToNetwork() == true){
            statusItem.image = successIcon
        }else{
            statusItem.image = failIcon
//            statusItem.button?.image = failIcon
        }
    }
    
    @IBAction func quitOnline(sender: NSMenuItem) {
        
        // top; kill
        NSApplication.sharedApplication().terminate(sender)
    }
    

//    @IBAction func menuClicked(sender: NSMenuItem) {
//
//        let task = NSTask()
//        task.launchPath = "/usr/bin/defaults"
//        
//        if(sender.state == NSOnState){
//            task.arguments = ["write", "com.apple.finder", "AppleShowAllFiles", "NO"]
//            sender.state = NSOffState
//        }else{
//            task.arguments = ["write", "com.apple.finder", "AppleShowAllFiles", "YES"]
//            sender.state = NSOnState
//        }
//        
//        task.launch()
//        task.waitUntilExit()
//        
//        let killFinder = NSTask()
//        killFinder.launchPath = "/usr/bin/killall"
//        killFinder.arguments = ["Finder"]
//        killFinder.launch()
//    }

}


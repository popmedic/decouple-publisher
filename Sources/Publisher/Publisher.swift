//
//  Publisher.swift
//  Publisher
//
//  Created by Nomula, Manikanta on 2/24/20.
//  Copyright © 2020 mindyourownbusiness. All rights reserved.
//

import Foundation
import Protocols

public class Publisher: Observable {
    public var protocolVersionString: String { Protocols.protocolFrameworkVersion }
    public var center: NotificationCenter
    public var queue: NotificationQueue
    
    private var dispatchTask: DispatchWorkItem?
    private var timer: Timer?
    
    var isRunning: Bool { timer != nil }
    
    public init() {
        center = NotificationCenter()
        queue = NotificationQueue(notificationCenter: center)
    }
    
    public func start() {
        if #available(OSX 10.12, *) {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (_) in
                switch Int.random(in: 1...4) {
                    case 1:
                        print("sending 1")
                        self.queue.enqueue(Notification(name: .ObservableEventOne,
                                                        object: nil,
                                                        userInfo: [Events.OneFields.name.rawValue: Notification.Name.ObservableEventOne.rawValue]),
                                           postingStyle: .asap)
                    case 2:
                        print("sending 2")
                        self.queue.enqueue(Notification(name: .ObservableEventTwo,
                                                        object: nil,
                                                        userInfo: [Events.TwoFields.name.rawValue: Notification.Name.ObservableEventTwo.rawValue]),
                                           postingStyle: .asap)
                    case 3:
                        print("sending 3")
                        self.queue.enqueue(Notification(name: .ObservableEventThree,
                                                        object: nil,
                                                        userInfo: [Events.ThreeFields.name.rawValue: Notification.Name.ObservableEventThree.rawValue]),
                                           postingStyle: .asap)
                    case 4:
                        print("sending 4")
                        self.queue.enqueue(Notification(name: .ObservableEventFour,
                                                        object: nil,
                                                        userInfo: [Events.FourFields.name.rawValue: Notification.Name.ObservableEventFour.rawValue]),
                                           postingStyle: .asap)
                    default: assertionFailure("Should never get here!")
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    public func stop() {
        timer?.invalidate()
        timer = nil
    }
}

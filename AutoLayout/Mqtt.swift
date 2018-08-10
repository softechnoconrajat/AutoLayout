//
//  Mqtt.swift
//  AutoLayout
//
//  Created by Raja Sinha on 8/7/18.
//  Copyright © 2018 Softechnocon. All rights reserved.
//

import UIKit
import Moscapsule

class Mqtt: UIViewController {
    
    
    //MQTT Implementation
    
    func mqttCall(){
        
        
        let clientID = "CocoaMQTT-" + String(ProcessInfo().processIdentifier)
        let hostID = "13.126.194.18"
        
        let mqttConfig = MQTTConfig(clientId: clientID, host: hostID, port: 1883, keepAlive: 60)
        
        // create new MQTT Connection
        //       let mqttClient = MQTT.newConnection(mqttConfig)
        //
        
        
        let mqttClient = MQTT.newConnection(mqttConfig, connectImmediately: false)
        mqttClient.connectTo(host: hostID, port: 1883, keepAlive: 2){
            result in
            if result == MosqResult.mosq_success {
                
    
            }
            else {
                // error handling for connection failure
                print("Not sucessfully Connected!")
            }
            
            
        }
        
        mqttClient.subscribe("world", qos: 2) { (messageId, grantedQos) in
            NSLog("subscribed (mid=\(messageId),grantedQos=\(grantedQos))")
        }
        
        
        
        
        mqttClient.disconnect {  result in
            if result == MosqResult.mosq_success{
                // successful disconnection you requested
                print("Subscribing Again")
                self.mqttCall()
            }
            else{
                // other cases such as unexpected disconnection.
                print("Abruptly Disconnected!")
                self.mqttCall()
            }
        } // end of disconnect
    }//End of MQTT Function


}



//
//  ViewController.swift
//  AutoLayout
//
//  Created by Rajat Sinha on 7/25/18.
//  Copyright © 2018 Softechnocon. All rights reserved.
//


import UIKit
import Moscapsule




class ViewController: UIViewController{

    
    var screenWidth : CGFloat = 0.0
    var screenHeight : CGFloat = 0.0
    
    var vT = VechileCurrentTime()

    
    // {} is referred to as closure, or anon. function
   
    
    
    
    
    func restNameGet(){
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "dropDownBtn") as! dropDownBtn
        selectionVC.selectionDelegate = self
    }
    
    
    // Logo for the Herfy app
    
    let logo : UIImageView = {
        let logo = UIImageView()
        
        logo.image = UIImage(named: "h_logo")
        logo.isHighlighted = true
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleAspectFit
        
        
        return logo
        
    }()
    
    
    
    
    // Label for day and Time Display
    
    var dayTimeLabel : UILabel = {
        var label = UILabel()
        
        //this enables autolayout for headLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    
    //Label for herfy title
    
//    let headLabel : UILabel = {
//        let label = UILabel()
//
//        //this enables autolayout for headLabel
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "HERFY"
//        label.contentMode = .scaleAspectFit
//        return label
//    }()
//
    
    // label for Order Queue Title
    var orderLabel : UILabel = {
    var label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.contentMode = .scaleAspectFit
    label.text = "Order Queue"
    return label
    }()
    
    
    // label for Delivery Queue Title
    var deliveryLabel : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "Delivery Queue"
        return label
    }()
    
    // label for Delivered Title
    var deliveredLabel : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "Delivered"
        return label
    }()
    
    // label for Order Queue Data
    var orderData : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "0"
        //label.font = UIFont(name: "Helveticaneue_Bold", size: 32.0)
        return label
    }()
    
    // label for Delivery Queue Data
    var deliveryData : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "0"
        return label
    }()
    
    
    // Timer1 for delivery Data
    
    var deliveryTimer1: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
      //  label.backgroundColor = UIColor.red
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    
    
    // Timer2 for delivery Data
    
    var deliveryTimer2: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
      //  label.backgroundColor = UIColor.blue
         label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    
    
    // Timer3 for delivery Data
    
    var deliveryTimer3: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
      //  label.backgroundColor = UIColor.green
         label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    
    // Timer4 for delivery Data
    
    var deliveryTimer4: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
       // label.backgroundColor = UIColor.yellow
         label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    
    
    //Order Timer 1

    var orderTimer1: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
       // label.backgroundColor = UIColor.magenta
         label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    
    // label for Delivered Data
    var deliveredData : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "0"
        return label
    }()
    
    
    // Label to display average delivery Time
    
    var averageDel : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "0"
        return label
    }()
    
    var averageDetTitle : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "0"
        return label
    }()

    
    let button : dropDownBtn = {
        
        //let button = UIButton(type: .system)
        let button = dropDownBtn()
        button.setTitle("Restaurants", for: .normal)
        //button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
      //  button.addTarget(self, action: #selector(dropDownPressed), for: .touchUpInside)
        button.backgroundColor = UIColor.black
        return button
    }()
    
   
    
   
   
    
    
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
               // self.pressNow(ddOption: <#T##String#>)
            
                
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

    // Variable Declaration for Expected Time eT, Maximum Interval, and Order Queue
    
    var a : [Int] = []
    var b : [Int] = []
    var c : [String] = []
    
    var rest_Id : Int = Int()
    var dropDownOption : [String] = Array()
    var rest_name : String = String()
    
    var restDetails = [String: Int]()
    
    
  //Function to ghet the expected time for delivery and populating the array
    func expectedTime()->(a:Array<Int>, b:Array<Int>, c:Array<String>, restDetails:[String : Int]){
        
        
        let url = URL(string: "http://13.126.194.18:4200/api/expTime")
        
        do{
            let data =  try Data(contentsOf: url!)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            if let array = json as? [Any] {
                
                for x in array{
                    if let dataStatus = x as? [String:Any] {
                        
                        if  let eT = dataStatus["max_interval"]  as? Int  {
                            
                            a += [eT]
                            
                        }
                        
                        if let mI = dataStatus["expected_interval"] as? Int{
                            b += [mI]
                        }
                        
                        if let qN = dataStatus["queue_name"] as? String{
                            c += [qN]
                        }
                    }//end of dataStatus loop
                } // end of for array loop
                
                for (index, value) in array.enumerated() {
                    if(index > 2){
                        //guard let rest_details = value as? String else {return}
                        
                        if let rest_details = value as? [String: Any]{
                            
                            if let id = rest_details["id"] as? Int {
                                rest_Id = id
                            }
                            
                            if let restName = rest_details["name"] as? String {
                                rest_name = restName
                                dropDownOption += [restName]
                            }
                            
                             button.dropView.dropDownOptions = dropDownOption
                            
                            
                        }
                        
                        restDetails[rest_name] = rest_Id
                        
                    }
                    
                    
                }
                
                
                
                
                
            }//end of Array Loop
           
        }//end of Do Array Loop
           
        catch {
            print(error)
        }
        return (a,b,c, restDetails )
    }//End of function to calculate expected Time
    //
    
    //
//    func abc () {
//
//        // var x = expectedTime()
//
//        let (x, y, z) = expectedTime()
//        print(x)
//        print(y)
//        print(z)
//
//    }
    //
    
    
    
   
       
        

    
// Function press now
    @objc func pressNow() {
        
        print("printin")
        
        var orderQueueArr : Array<Int> = Array()
        var deliveryQueueArr : Array<Int> = Array()
//        var deliveredQueueArr : Array<Int> = Array()
        
        var deliveredQueueData : Int = Int()
        
        var secondsInOrder1 : Int = Int()
        var secondsInOrder2 : Int = Int()
        
        let restId_ : Int = 1
        
        
        let parameters = ["resID": restId_]
        
        
        guard let url = URL(string : "http://13.126.194.18:4200/api/log") else {return}
        
        
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            else{return}
        
        request.httpBody = httpBody
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
                
            }
            if let data = data{
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options:.mutableContainers)
                    
                    if let array = json as? [String:Any] {
                    if let code = array["log"] as? [Any]{
                    var x = 0
                    var y = 0
                    var z = 0
                    let date = Date()
                    let dateFormatter = DateFormatter()
                    var stringToDate : Date
                        
                
                    for user in code{
                        
                        if let userDict = user as? [String:Any] {
                            
                            if let status = userDict["status"] as? Int {
                                if status == 1 {
                               
                                if let orderQueData = userDict["passage_queue"] as? String {
                                
                                    //Calculate current Saudi Time
                                    
                                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000'Z'"
                                    dateFormatter.timeZone = TimeZone.init(identifier: "Asia/Riyadh")

                            
                                    //Differenece in Time
                                    
                                     stringToDate = dateFormatter.date(from: orderQueData)!
                                     var secondsInOrder = date.seconds(from: stringToDate) // return Seconds In Order Queue return Type Int
                                    
                                    orderQueueArr += [secondsInOrder]
                                    
                        }//End of Order Queue Loop
                            
                            x = x+1
                            print(x)
                    
                        } // End of Status == 1 Loop
                                    
                        else if status == 2 {
                                    
                            if let deliveryQueData = userDict["order_queue"] as? String {
            
                                //calculate Current saudi Time
                                
                                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000'Z'"
                                dateFormatter.timeZone = TimeZone.init(identifier: "Asia/Riyadh")

                                
                                
                                //difference in Time
                                
                                stringToDate = dateFormatter.date(from: deliveryQueData)!
                                let secondsInDelivery = date.seconds(from: stringToDate) // return Seconds In Delivery Queue return Type Int
                                
                               
                               // self.updateVechileTimer(sec: secondsInDelivery, stat: status)
                                
                                deliveryQueueArr += [secondsInDelivery]
                                
                                
                                
                                    }//End of delivery Queue Data
                                    
                            y = y + 1
                                    
                                    
                        } // End of Status == 2 Loop
                                    
                        else if status == 3 {
                                    
                                    
                                    if let deliveredQueData = userDict["delivery_queue"] as? String {
                                     
                                        //Calculate current Saudi Time
                                        
                                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000'Z'"
                                        dateFormatter.timeZone = TimeZone.init(identifier: "Asia/Riyadh")
                                        
                                        
                                        //Differenece in Time
                                        
                                        stringToDate = dateFormatter.date(from: deliveredQueData)!
                                        var secondsInOrder = date.seconds(from: stringToDate) // return Seconds In Order Queue return Type Int
                                        
                                        //deliveredQueueArr += [secondsInOrder]
                                      secondsInOrder1 = secondsInOrder
                                      
                                        
                                    }//End of Order Queue Loop
                                    
                                    if let orderQueData = userDict["passage_queue"] as? String {
                                        
                                        //Calculate current Saudi Time
                                        
                                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000'Z'"
                                        dateFormatter.timeZone = TimeZone.init(identifier: "Asia/Riyadh")
                                        
                                        
                                        //Differenece in Time
                                        
                                        stringToDate = dateFormatter.date(from: orderQueData)!
                                        var secondsInOrder = date.seconds(from: stringToDate) // return Seconds In Order Queue return Type Int
                                        
                                        secondsInOrder2 = secondsInOrder
                                        
                                       // orderQueueArr += [secondsInOrder]
                                    
                                    }//End of PassageQueue Data
                                    
                                  deliveredQueueData += secondsInOrder2 - secondsInOrder1
                                 
                                    
                                z = z + 1
                            
                        }//end of status == 3 Loop
                                
                    } //end of for user Loop
                    }//End of Status Loop
                    } //End of UserDict Loop
                   
                        
                        DispatchQueue.main.async {
                            
                        self.orderData.text = String(x)
                        self.deliveryData.text = String(y)
                        self.deliveredData.text = String(z)
                            
                            
                        
                    }
//                        print("Array Order Queue:", orderQueueArr)
//                        print("Array Delivery Queue:", deliveryQueueArr)
                        
                        self.orderqueue(orderQueue: orderQueueArr)
                        self.deliveryQueue(deliveryQueue: deliveryQueueArr)
                        self.averagePerformance(time: deliveredQueueData, count: z)
                        
                    
                } //end of do
                }//End of "Code" Loop
                }//End of "Array" Loop
                    
                catch{
                    print(error)
                } //end of catch
            }// end of data task
            }.resume()//end of seesion.datatask
        
       
    }

    
    
    
    
    
    // To calculate the average delivery time
    
    func averagePerformance(time: Int, count: Int){
        let time : Int = time
        let count : Int = count
        
        let aver : Int
        
        var a : Int = 0
        var b : Int = 0
        
        if count > 0 {
        aver = time/count
        
        a = aver % 60 //Seconds
        b = aver / 60 //Minutes
        }
        if b > 59 {
            b = 0
        }
        
        DispatchQueue.main.async {
            
            self.averageDel.text = "\(b) : \(a)"
            
        }
        
    
}//End of average Performance
    
    
    
    func orderqueue(orderQueue: Array<Int>)  {
        
        let oQ : Array<Int>
        oQ = orderQueue
    
        if oQ.isEmpty == false{
            vT.updateTime(label: orderTimer1, time: oQ[0], status: 1)
        }
        else{
            
            vT.hide(label: orderTimer1)
        }
      
    }//End of OrderQueurArray
    
    func deliveryQueue (deliveryQueue: Array<Int>) {
        let dQ : Array<Int>
        dQ = deliveryQueue
        
        if dQ.isEmpty == false{
            if dQ.count == 1 {
                
            vT.updateTime(label: deliveryTimer1, time: dQ[0], status: 2)
            vT.hide(label: deliveryTimer2)
            vT.hide(label: deliveryTimer3)
            vT.hide(label: deliveryTimer4)
                
            }
            else if dQ.count == 2 {
                vT.updateTime(label: deliveryTimer1, time: dQ[0], status: 2)
                vT.updateTime(label: deliveryTimer2, time: dQ[1], status: 2)
                vT.hide(label: deliveryTimer3)
                vT.hide(label: deliveryTimer4)
                
            }
            else if dQ.count == 3 {
                vT.updateTime(label: deliveryTimer1, time: dQ[0], status: 2)
                vT.updateTime(label: deliveryTimer2, time: dQ[1], status: 2)
                vT.updateTime(label: deliveryTimer3, time: dQ[2], status: 2)
               vT.hide(label: deliveryTimer4)
                
            }
            else {
                  vT.updateTime(label: deliveryTimer1, time: dQ[0], status: 2)
                  vT.updateTime(label: deliveryTimer2, time: dQ[1], status: 2)
                  vT.updateTime(label: deliveryTimer3, time: dQ[2], status: 2)
                  vT.updateTime(label: deliveryTimer3, time: dQ[3], status: 2)
            }
        }
        else{
            vT.hide(label: deliveryTimer1)
            vT.hide(label: deliveryTimer2)
            vT.hide(label: deliveryTimer3)
            vT.hide(label: deliveryTimer2)
        }
        
    
    } // End of delivery queue function
    
    


    

    
    
    
// function to update time
    
   @objc func updateSaudiTime(){


          let date = Date()
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
          dateFormatter.timeZone = TimeZone.init(identifier: "Asia/Riyadh")

          let str = dateFormatter.string(from : date)


          self.dayTimeLabel.text = str

    } //End of function updateTime.

    
    
   

    
// Main View Did Load Function
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screenSize : CGRect = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        //mqttCall()
        
            
        self.expectedTime()
        
    
        setupLayout()
        
    
        
    
        
      //  button.dropView.dropDownOptions = ["Rajat", "Gaurav", "Akash", "Abhinav"]
   
        
      
    
        
        Timer.scheduledTimer(timeInterval: 0.10, target: self, selector: #selector(ViewController.updateSaudiTime), userInfo: nil, repeats: true)
       
        
    
        
        
        
    }
    
    
    
    // Layout of the views
    
    func setupLayout(){
        
    
        view.backgroundColor = UIColor.black
        
        //Container for header view
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.black
        view.addSubview(headerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12).isActive = true
        
        
        
        
         headerView.addSubview(logo)
        
         logo.topAnchor.constraint(equalTo: headerView.topAnchor, constant:11).isActive = true
         logo.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 0).isActive = true
         logo.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -290).isActive = true
         logo.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.90).isActive = true
        
          headerView.bringSubviewToFront(logo)
        
        
        
        // Contenet of header conatainer
//        headerView.addSubview(headLabel)
//
//        headLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 25).isActive = true
//        headLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 5).isActive = true
//        headLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -300).isActive = true
//        headLabel.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.5).isActive = true
//        headLabel.textAlignment = .center
//        headLabel.font = UIFont(name: "Helveticaneue_Bold", size: 16.0)
//        headLabel.textColor = UIColor.white
//        headLabel.backgroundColor = UIColor.yellow
//
        
        
       // Day Time Label
        
         headerView.addSubview(dayTimeLabel)
//
        dayTimeLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10).isActive = true
        dayTimeLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 85).isActive = true
        dayTimeLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -105).isActive = true
       
        dayTimeLabel.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.9).isActive = true
        dayTimeLabel.textAlignment = .center
        dayTimeLabel.font = UIFont(name: "Aerial", size: 12.0)
        dayTimeLabel.textColor = UIColor.white
        
//       // label.font = UIFont.boldSystemFontOfSize(16.0)
        
        dayTimeLabel.font = UIFont.boldSystemFont(ofSize: 14.5)
        
//        dayTimeLabel.shadowOffset = CGSize(width: 2, height: 4)
//        dayTimeLabel.shadowColor = UIColor.red
////
        
        
        
        // Button "Press Here" inside header container
        
//        headerView.addSubview(pressHere)
//        pressHere.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 25).isActive = true
//        pressHere.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 280).isActive = true
//        pressHere.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -2).isActive = true
//        pressHere.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.5).isActive = true
//
        
        
        
       // button.layer.zPosition = 1
        
        
    
        
        
        //Container for order view
        let orderView = UIView()
        orderView.backgroundColor = UIColor.subViewContainerColor
        view.addSubview(orderView)
    
        orderView.translatesAutoresizingMaskIntoConstraints = false
        orderView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 2).isActive = true
        orderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant : 3.5).isActive = true
        orderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant : -3.5).isActive = true
        orderView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.29).isActive = true
        
        
        
        
       
        
        
        //Image View For Container
        
//        orderView.addSubview(imageView)
//
//        imageView.centerXAnchor.constraint(equalTo: orderView.centerXAnchor).isActive = true
//        imageView.centerYAnchor.constraint(equalTo: orderView.centerYAnchor).isActive = true
////        imageView.topAnchor.constraint(equalTo: orderView.topAnchor, constant: 20).isActive = true
////        imageView.leadingAnchor.constraint(equalTo: orderView.leadingAnchor).isActive = true
////        imageView.trailingAnchor.constraint(equalTo: orderView.trailingAnchor, constant :-100).isActive = true
//        imageView.heightAnchor.constraint(equalTo: orderView.heightAnchor, multiplier: 1.00 ).isActive = true
//
        
        
        
        
        // Contenet of Order View conatainer
        
        // order Title
        orderView.addSubview(orderLabel)
        orderLabel.centerXAnchor.constraint(equalTo: orderView.centerXAnchor, constant:-100).isActive = true
        //orderLabel.centerYAnchor.constraint(equalTo: orderView.centerYAnchor).isActive = true
        
        orderLabel.centerYAnchor.constraint(equalTo: orderView.centerYAnchor, constant: -80).isActive = true
        
        orderLabel.heightAnchor.constraint(equalTo:  orderView.heightAnchor, multiplier: 0.2).isActive = true
        orderLabel.textAlignment = .center
        orderLabel.font = UIFont(name: "Arial", size: 20.0)
        orderLabel.textColor = UIColor.black
        
        orderLabel.shadowOffset = CGSize(width: 2, height: 4)
        orderLabel.shadowColor = UIColor.white
        


        // order Data
        
        orderView.addSubview(orderData)
        orderData.topAnchor.constraint(equalTo: orderLabel.bottomAnchor, constant: 0).isActive = true
        orderData.leadingAnchor.constraint(equalTo: orderView.leadingAnchor, constant: 10).isActive = true
        orderData.trailingAnchor.constraint(equalTo: orderView.trailingAnchor, constant: -220).isActive = true
        orderData.heightAnchor.constraint(equalTo: orderView.heightAnchor, multiplier: 0.78).isActive = true
        
        
        orderData.backgroundColor = UIColor.orderBGColor
        orderData.textAlignment = .center
        
       
        orderData.font = UIFont(name: "Arial", size: 70)
        
        orderData.textColor = .white
        orderData.shadowOffset = CGSize(width: 8, height: 4)
        orderData.shadowColor = UIColor.black
    

        
        // Order Queue Timer1
        
        orderView.addSubview(orderTimer1)
        
        orderTimer1.topAnchor.constraint(equalTo: orderLabel.bottomAnchor, constant: 80).isActive = true
        orderTimer1.leadingAnchor.constraint(equalTo: orderData.trailingAnchor, constant: 10).isActive = true
        orderTimer1.trailingAnchor.constraint(equalTo: orderView.trailingAnchor, constant: -120).isActive = true
        orderTimer1.heightAnchor.constraint(equalTo: orderView.heightAnchor, multiplier: 0.35).isActive = true
        
        
        orderTimer1.isHidden = true
        
        // Resturenet Select Button
        
        orderView.addSubview(button)
        
        //        view.bringSubviewToFront(view)
        
        button.setTitle("Resturents", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.topAnchor.constraint(equalTo: orderView.topAnchor, constant: 0).isActive = true
        button.leadingAnchor.constraint(equalTo: orderView.leadingAnchor, constant: 240).isActive = true
        button.trailingAnchor.constraint(equalTo: orderView.trailingAnchor, constant: -5).isActive = true
        button.heightAnchor.constraint(equalTo: orderView.heightAnchor, multiplier: 0.2).isActive = true
        
        
    
        //Container for delivery view
        
        let deliveryView = UIView()
        deliveryView.backgroundColor = UIColor.subViewContainerColor
        view.addSubview(deliveryView)
        
        deliveryView.translatesAutoresizingMaskIntoConstraints = false
        deliveryView.topAnchor.constraint(equalTo: orderView.bottomAnchor, constant: 2).isActive = true
        deliveryView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant : 3.5).isActive = true
        deliveryView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant : -3.5).isActive = true
        deliveryView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.29).isActive = true
        
        
        //Delivery Title

        
        deliveryView.addSubview(deliveryLabel)
        deliveryLabel.centerXAnchor.constraint(equalTo: deliveryView.centerXAnchor, constant:-100).isActive = true
//        deliveryLabel.centerYAnchor.constraint(equalTo: deliveryView.centerYAnchor).isActive = true
        deliveryLabel.centerYAnchor.constraint(equalTo: deliveryView.centerYAnchor, constant: -80).isActive = true
        deliveryLabel.heightAnchor.constraint(equalTo:  deliveryView.heightAnchor, multiplier: 0.2).isActive = true
        deliveryLabel.textAlignment = .center
        deliveryLabel.font = UIFont(name: "Arial", size: 20.0)
        deliveryLabel.textColor = UIColor.black
        
        deliveryLabel.shadowOffset = CGSize(width: 2, height: 4)
        deliveryLabel.shadowColor = UIColor.white
        
        //delivery Data
        deliveryView.addSubview(deliveryData)
        
        deliveryData.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 0).isActive = true
        deliveryData.leadingAnchor.constraint(equalTo: deliveryView.leadingAnchor, constant: 10).isActive = true
        deliveryData.trailingAnchor.constraint(equalTo: deliveryView.trailingAnchor, constant: -220).isActive = true
        deliveryData.heightAnchor.constraint(equalTo: deliveryView.heightAnchor, multiplier: 0.78 ).isActive = true
        
        deliveryData.backgroundColor = UIColor.deliveryBGColor
        deliveryData.textAlignment = .center
        deliveryData.font = UIFont(name: "Arial", size: 70.0)
        
        
        deliveryData.textColor = .white
        deliveryData.shadowOffset = CGSize(width: 8, height: 4)
        deliveryData.shadowColor = UIColor.black
        
        
        
        //Delivery Timer1
    
        deliveryView.addSubview(deliveryTimer1)
        
       deliveryTimer1.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 80).isActive = true
       deliveryTimer1.leadingAnchor.constraint(equalTo: deliveryData.trailingAnchor, constant: 10).isActive = true
       deliveryTimer1.trailingAnchor.constraint(equalTo: deliveryView.trailingAnchor, constant: -120).isActive = true
       deliveryTimer1.heightAnchor.constraint(equalTo: deliveryView.heightAnchor, multiplier: 0.35).isActive = true
        
        deliveryTimer1.isHidden = true
    
        //Delivery Timer2

        deliveryView.addSubview(deliveryTimer2)

        deliveryTimer2.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 80).isActive = true
        deliveryTimer2.leadingAnchor.constraint(equalTo: deliveryTimer1.trailingAnchor, constant: 10).isActive = true
        deliveryTimer2.trailingAnchor.constraint(equalTo: deliveryView.trailingAnchor, constant: -20).isActive = true
        deliveryTimer2.heightAnchor.constraint(equalTo: deliveryView.heightAnchor, multiplier: 0.35).isActive = true

        deliveryTimer2.isHidden = true
        
        //Delivery Timer3

        deliveryView.addSubview(deliveryTimer3)

        deliveryTimer3.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant:0).isActive = true
        deliveryTimer3.leadingAnchor.constraint(equalTo: deliveryData.trailingAnchor, constant: 10).isActive = true
        deliveryTimer3.trailingAnchor.constraint(equalTo: deliveryView.trailingAnchor, constant:-120).isActive = true
        deliveryTimer3.heightAnchor.constraint(equalTo: deliveryView.heightAnchor, multiplier: 0.35).isActive = true

        deliveryTimer3.isHidden = true
        
        //Delivery Timer4

        deliveryView.addSubview(deliveryTimer4)

        deliveryTimer4.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant:0).isActive = true
        deliveryTimer4.leadingAnchor.constraint(equalTo: deliveryTimer3.trailingAnchor, constant: 10).isActive = true
        deliveryTimer4.trailingAnchor.constraint(equalTo: deliveryView.trailingAnchor, constant: -20).isActive = true
        deliveryTimer4.heightAnchor.constraint(equalTo: deliveryView.heightAnchor, multiplier: 0.35).isActive = true

        deliveryTimer4.isHidden = true
        
        
        
        //Container for delivered view
        
        let deliveredView = UIView()
        deliveredView .backgroundColor = UIColor.subViewContainerColor
        view.addSubview(deliveredView )
        
        deliveredView .translatesAutoresizingMaskIntoConstraints = false
        deliveredView .topAnchor.constraint(equalTo: deliveryView.bottomAnchor, constant: 2).isActive = true
        deliveredView .leadingAnchor.constraint(equalTo: view.leadingAnchor, constant : 3.5).isActive = true
        deliveredView .trailingAnchor.constraint(equalTo: view.trailingAnchor, constant : -3.5).isActive = true
        deliveredView .heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.29).isActive = true
        
        
        // Contenet of delivered View conatainer
        
         deliveredView.addSubview( deliveredLabel)
         deliveredLabel.centerXAnchor.constraint(equalTo: deliveredView.centerXAnchor, constant:-100).isActive = true
//         deliveredLabel.centerYAnchor.constraint(equalTo: deliveredView.centerYAnchor).isActive = true
         deliveredLabel.centerYAnchor.constraint(equalTo: deliveredView.centerYAnchor, constant: -80).isActive = true
         deliveredLabel.heightAnchor.constraint(equalTo:  deliveredView.heightAnchor, multiplier: 0.2).isActive = true
         deliveredLabel.textAlignment = .center
         deliveredLabel.font = UIFont(name: "Arial", size: 20.0)
         deliveredLabel.textColor = UIColor.black
        
        deliveredLabel.shadowOffset = CGSize(width: 2, height: 4)
        deliveredLabel.shadowColor = UIColor.white
        
        
        //delivered Data
        
        deliveredView.addSubview(deliveredData)
        
        deliveredData.topAnchor.constraint(equalTo: deliveredLabel.bottomAnchor, constant: 0).isActive = true
        deliveredData.leadingAnchor.constraint(equalTo: deliveredView.leadingAnchor, constant: 10).isActive = true
        deliveredData.trailingAnchor.constraint(equalTo: deliveredView.trailingAnchor, constant: -220).isActive = true
        deliveredData.heightAnchor.constraint(equalTo: deliveredView.heightAnchor, multiplier: 0.78).isActive = true
        
        deliveredData.backgroundColor = UIColor.deliveredBGColor
        deliveredData.textAlignment = .center
        deliveredData.font = UIFont(name: "Arial", size: 70.0)
        
        deliveredData.textColor = .white
        deliveredData.shadowOffset = CGSize(width: 8, height: 4)
        deliveredData.shadowColor = UIColor.black
        
        
        deliveredView.addSubview(averageDel)
        
        averageDel.topAnchor.constraint(equalTo: deliveredView.topAnchor, constant: 65).isActive = true
        averageDel.leadingAnchor.constraint(equalTo: deliveredView.leadingAnchor, constant: 160).isActive = true
        averageDel.trailingAnchor.constraint(equalTo: deliveredView.trailingAnchor, constant: -10).isActive = true
        averageDel.heightAnchor.constraint(equalTo: deliveredView.heightAnchor, multiplier: 0.60).isActive = true
        averageDel.font = UIFont(name: "Arial", size: 38.0)
        
        averageDel.backgroundColor = UIColor.black
        averageDel.textColor = UIColor.red
        
        averageDel.textAlignment = NSTextAlignment.center
        
        
        
        // Title for delivery average
        
        deliveredView.addSubview(averageDetTitle)
        
        averageDetTitle.topAnchor.constraint(equalTo: deliveredView.topAnchor, constant: 33).isActive = true
        averageDetTitle.leadingAnchor.constraint(equalTo: deliveredView.leadingAnchor, constant: 160).isActive = true
        averageDetTitle.trailingAnchor.constraint(equalTo: deliveredView.trailingAnchor, constant: -10).isActive = true
        averageDetTitle.heightAnchor.constraint(equalTo: deliveredView.heightAnchor, multiplier: 0.25).isActive = true
        averageDetTitle.font = UIFont(name: "Arial", size: 20.0)
        
        averageDetTitle.backgroundColor = UIColor.black
        averageDetTitle.textColor = UIColor.white
        averageDetTitle.text = "Overall Average"
        
       
        
        averageDetTitle.textAlignment = NSTextAlignment.center
        
    }//End of setupLayout function
  
    
}// End of main class


// Function to change backGround Colour from the hexa Deciamal Codes

extension UIColor {
    
    func colorFromHex(_ hex:String) -> UIColor {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
      
        if hexString.hasPrefix("#"){
            hexString.remove(at: hexString.startIndex)
        }
        if hexString.count != 6{
            return UIColor.black
        }
        
        var rgb:UInt32 = 0
        
        Scanner(string: hexString).scanHexInt32(&rgb)
        
        return UIColor.init(red: CGFloat((rgb & 0xFF0000)>>16)/255.0,
            green: CGFloat((rgb & 0x00FF00)>>8)/255.0,
            blue : CGFloat(rgb & 0x0000FF)/255.0, alpha:1.0)
        
      
        
  } // End of colorFromHex
    
     static let orderBGColor = UIColor().colorFromHex("#5271C2")
     static let deliveryBGColor = UIColor().colorFromHex("#35a541")
     static let deliveredBGColor = UIColor().colorFromHex("#bdb235")
     static let  titleBGColor = UIColor().colorFromHex("#666666")
     static let  subViewContainerColor = UIColor().colorFromHex( "#e5e5e5")
   
}//End of UIColor


extension Date {
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
}// End of Extension Date


extension ViewController : restNameDelegate{
    func restName(name: String) {
        print(name)
    }
    
}





















/*
 

 //Variable decleration
 
 var timer = Timer()
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 timeStart()
 
 setupLayout()
 
 }
 
 func timeStart(){
 timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: (#selector(ViewController.updateTime)), userInfo: nil, repeats: true)
 }
 
 */

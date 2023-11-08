
import UIKit

import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        func generateNumber() -> Int {
            Int.random(in: 20..<50)
        }
        
        func calculateFactorial() -> Double {
            let number = generateNumber()
            var result: Double = 1
            for i in 1...number {
                result *= Double(i)
            }
            return result
        }
        
        let someObject = NSObject()
        
        let firstThread = Thread {
            
            objc_sync_enter(someObject)
            
            print(calculateFactorial())
            print("პირველმა მოიგო")
        }
        
        let secondThread = Thread {
            
            objc_sync_enter(someObject)
            
            print(calculateFactorial())
            print("მეორემ მოიგო")
        }
        
        firstThread.start()
        secondThread.start()
        
    }

}


//
//  ConnectionHandler.swift
//  Albums
//
//  Created by 703177808 on 24/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import UIKit

class ConnectionHandler: NSObject, URLSessionDataDelegate, URLSessionDelegate {
    var responseData: Data?
    static let shared: ConnectionHandler = {
        let instance = ConnectionHandler()
        return instance
    }()

    private override init() {
        super.init()
    }
    var connectionHandlerDelegate: ConnectionHandlerProtocol?

    func  processRequest() {
        self.cancelRequest()
        guard NetworkManager.isNetworkAvailable() else {
            let theErrorMessage = NSLocalizedString("NetworkNotAvailable", comment: "") as NSString
            let userInfo: [AnyHashable: Any] =
                [
                    NSLocalizedDescriptionKey: theErrorMessage
            ]
            let theError =  NSError(domain: "", code: 200, userInfo: (userInfo as! [String : Any]))
            connectionHandlerDelegate?.didRecieveError(inResponseError: theError)
            return
        }

        let url = URL(string: "https://itunes.apple.com/search?term=all")!
        let request = URLRequest(url:url )
        let theConfig = URLSessionConfiguration.default
        let theSession = URLSession(configuration: theConfig, delegate: self, delegateQueue: OperationQueue.main)
        let task = theSession.dataTask(with: request)
        responseData = Data()
        task.resume()

//           do {
//              //create json object from data
//              if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
//                 print(json)
//              }
//           } catch let error {
//             print(error.localizedDescription)
//           }
//        })


//        guard NetworkManager.isNetworkAvailable() else {
//            let theErrorMessage = NSLocalizedString("NetworkNotAvailable", comment: "") as NSString
//            let userInfo: [AnyHashable: Any] =
//                [
//                    NSLocalizedDescriptionKey: theErrorMessage
//            ]
//            let theError =  NSError(domain: "", code: 200, userInfo: (userInfo as! [String : Any]))
//            mConnectionHandleDelegate?.didRecieveError(inResponseError: theError)
//            return
//        }
//        let theConfig = URLSessionConfiguration.default
//        let theSession = URLSession(configuration: theConfig, delegate: self, delegateQueue: OperationQueue.main)
////        mDataTask = theSession.dataTask(with: inRequest)
//        mResponseData = Data()
//        mDataTask?.resume()

    }

    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
            responseData?.append(data)
    }


    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        let theJsonData = try? JSONSerialization.jsonObject(with: responseData!, options: [])
        if theJsonData != nil {
//            print(theJsonData!)
            connectionHandlerDelegate?.didFinishRecievingData(inResponseData: theJsonData as! NSDictionary)
        }
        if error != nil {
            connectionHandlerDelegate?.didRecieveError(inResponseError:error! as NSError)
        }

    }

    func cancelRequest() {
        responseData = nil
    }

}

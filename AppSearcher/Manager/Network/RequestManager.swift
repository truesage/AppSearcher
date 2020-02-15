//
// Created by JinSung Lee on 2020/02/14.
// Copyright (c) 2020 JinSung Lee. All rights reserved.
//

import Foundation

protocol RequestDelegate {
    func onNetworkSuccess(request: URLRequest, response: HTTPURLResponse, data: Data?)
    func onNetworkFail(request: URLRequest, error: Error)
}

class RequestManager: NSObject, URLSessionDelegate {
    static let shared = RequestManager()

    private override init() {
    }

    // MARK: - Public Functions
    func requestSearch(keyword: String, delegate: RequestDelegate?) -> Bool {

        let URLParams = [
            "term": keyword,
            "country": "kr",
            "media": "software",
        ]
        return sendRequest(urlString: ServerURL.search, params: URLParams, httpMethod: .GET, delegate: delegate)
    }

    // MARK: - Private Functions
    private func sendRequest(urlString: String, params: Dictionary<String, String>, httpMethod: HTTPMethod, delegate: RequestDelegate?) -> Bool {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)

        guard var URL = URL(string: urlString) else {
            return false
        }
        var request: URLRequest
        if (httpMethod == .GET) {
            URL = URL.appendingQueryParameters(params)
            request = URLRequest(url: URL)
        } else {
            request = URLRequest(url: URL)
            let bodyString = params.queryParameters
            request.httpBody = bodyString.data(using: .utf8, allowLossyConversion: true)
        }
        request.httpMethod = httpMethod.rawValue

        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    print("URL Session Task Succeeded: HTTP \(statusCode)")
                }
                if let delegate = delegate, let response = response as? HTTPURLResponse {
                    delegate.onNetworkSuccess(request: request, response: response, data: data)
                }
            } else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
                if (delegate != nil) {
                    delegate!.onNetworkFail(request: request, error: error!)
                }
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()

        return true
    }

    // MARK: - URLSessionDelegate
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> ()) {
        if (challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust) {
            if (ServerURL.base.contains(challenge.protectionSpace.host)) {
                if let serverTrust = challenge.protectionSpace.serverTrust {
                    completionHandler(Foundation.URLSession.AuthChallengeDisposition.useCredential, URLCredential(trust: serverTrust))
                }
            }
        }
    }
}

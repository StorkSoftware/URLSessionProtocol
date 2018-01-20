import Foundation

public typealias DataTaskHandler = (Data?, URLResponse?, Error?) -> Void

public protocol URLSessionProtocol {

    func dataTask(with url: URL) -> URLSessionDataTaskProtocol
    func dataTask(with url: URL, completionHandler: @escaping DataTaskHandler) -> URLSessionDataTaskProtocol
    func dataTask(with request: URLRequest) -> URLSessionDataTaskProtocol
    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskHandler) -> URLSessionDataTaskProtocol
}

public protocol URLSessionDataTaskProtocol {

    func resume()
    func cancel()
}

extension URLSession: URLSessionProtocol {

    public func dataTask(with url: URL) -> URLSessionDataTaskProtocol {
        return ((dataTask(with: url) as URLSessionDataTask) as URLSessionDataTaskProtocol)
    }

    public func dataTask(with url: URL, completionHandler: @escaping DataTaskHandler) -> URLSessionDataTaskProtocol {
        return ((dataTask(with: url, completionHandler: completionHandler) as URLSessionDataTask) as URLSessionDataTaskProtocol)
    }

    public func dataTask(with request: URLRequest) -> URLSessionDataTaskProtocol {
        return ((dataTask(with: request) as URLSessionDataTask) as URLSessionDataTaskProtocol)
    }

    public func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskHandler) -> URLSessionDataTaskProtocol {
        return ((dataTask(with: request, completionHandler: completionHandler) as URLSessionDataTask) as URLSessionDataTaskProtocol)
    }
}

extension URLSessionDataTask: URLSessionDataTaskProtocol { }

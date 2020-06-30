import Foundation
import Alamofire
import Logging

extension DataRequest {
    
    public func log(logger: Logger?) -> DataRequest {
        if let logger = logger {
            return response { $0.log(to: logger) }
        }
        return self
    }
}

extension DataResponse {
    
    func log(to logger: Logger) {
        switch result {
        case .success:
            if let request = request {
                logger.info("\(request.httpMethod!) \(request)")
                let requestBody = request.httpBody.map { String(decoding: $0, as: UTF8.self) } ?? (request.httpBodyStream != nil ? "Body is stream" : "")
                logger.debug("\(requestBody)", metadata: request.headers.dictionary.mapValues({ .string($0) }))
            }
            let responseBody = data.map { String(decoding: $0, as: Unicode.ASCII.self) } ?? "None"
            if let response = response {
                logger.info("Response: \(response.statusCode)")
                logger.debug("\(responseBody)", metadata: response.headers.dictionary.mapValues({ .string($0) }))
            } else {
                logger.debug("\(responseBody)")
            }
        case .failure(let error):
            logger.error("\(error.localizedDescription)")
        }
    }
}

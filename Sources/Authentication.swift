// Since the OpenAPI generator doesn't support the security object in OpenAPI out of the
// box we just add an middleware interceptor that adds the X-API-Token header for the
// request. If you are using the JWT token from the service this should be rewritten
// accordingly.

import OpenAPIRuntime
import Foundation
import HTTPTypes

/// A client middleware that injects a value into the `X-API-Token` header field of the request.
package struct AuthenticationMiddleware {
    
    /// The value for the `Authorization` header field.
    private let value: String
    
    /// Creates a new middleware.
    /// - Parameter value: The value for the `Authorization` header field.
    package init(apiTokenValue value: String) { self.value = value }
}

extension AuthenticationMiddleware: ClientMiddleware {
    package func intercept(
        _ request: HTTPRequest,
        body: HTTPBody?,
        baseURL: URL,
        operationID: String,
        next: (HTTPRequest, HTTPBody?, URL) async throws -> (HTTPResponse, HTTPBody?)
    ) async throws -> (HTTPResponse, HTTPBody?) {
        var request = request
        let field = HTTPField.Name("X-API-Token")!
        request.headerFields[field] = value
        return try await next(request, body, baseURL)
    }
}

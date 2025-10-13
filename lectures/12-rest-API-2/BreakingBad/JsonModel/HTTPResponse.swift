//
//  HTTPResponse.swift
//  BreakingBad
//
//  Created by Stig Orla Sørli Højklint on 08/10/2025.
//

// ⚠️ 2xx Series – Successful Responses
// 200 OK: The request was successful, and the server returned the expected content
// 201 Created: Indicating that a new resource has been successfully created on the server
// 202 Accepted: The request has been accepted but is not yet processed
// 204 No Content: The request was successful, but there’s no content in the response
// 206 Partial Content: Used for downloads that support partial requests

// ⚠️ 3xx Series – Redirection Responses 
// 300 Multiple Choices: Multiple resources and the client must select one
// 301 Moved Permanently: The resource has been permanently moved to a new URL
// 302 Found: The resource is temporarily located at a different URL
// 303 See Other: Used after a POST request to redirect the client to a different URL
// 304 Not Modified: Used with caching indicates the client can use its cached version
// 307 Temporary Redirect: The HTTP method must remain the same
// 308 Permanent Redirect: The HTTP method must also remain the same

// ⚠️ 4xx Series – Client Errors
// 400 Bad Request. The server couldn’t understand the request due to invalid syntax
// 401 Unauthorized. Authentication is required
// 403 Forbidden. The server understands the request but refuses to fulfill it
// 404 Not Found. The server couldn’t find the requested resource
// 405 Method Not Allowed. The HTTP method isn’t allowed for the requested resource
// 408 Request Timeout. The server timed out waiting for the client’s request

// ⚠️ 5xx Series – Server Errors
// 500 Internal Server Error. A general error occurs when something went wrong on the server
// 501 Not Implemented. The server doesn’t support the functionality
// 502 Bad Gateway. The server received an invalid response from another server
// 503 Service Unavailable: The server is currently unavailable, usually due to overload
// 504 Gateway Timeout. The server waited too long for a response from another server
// 505 HTTP Version Not Supported. The server doesn’t support the HTTP version used in the request


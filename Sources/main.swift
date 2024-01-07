// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import ArgumentParser
import OpenAPIRuntime;
import OpenAPIURLSession;

struct Parameters : ParsableArguments {
    @Option(help: "API token from https://span.lab5e.com")
    var apiToken : String = "";
};

let opts = Parameters.parseOrExit();

let client = Client(
    serverURL: try Servers.server1(),
    transport: URLSessionTransport(),
    middlewares: [AuthenticationMiddleware(apiTokenValue: opts.apiToken)]
)

let res = try await client.ListCollections()
print("Done request")
let body = try res.ok.body

print("Body: \(body)")

let collections  = try body.json.collections

for coll in collections! {
    print("\(coll.collectionId!) \(coll.tags!.additionalProperties["name"]!)")
}

# A Span API client sample in Swift

Build the sample with `swift build`.

To run it, create a new API token in the [Span dashboard](https://span.lab5e.com) and 
run 

```shell
swift run span-sample --api-token=[API token]
```

## Generating the client

Rather than using a prebuilt client the OpenAPI generator is a plugin in the 
project as described in [this tutorial from Apple](https://swiftpackageindex.com/apple/swift-openapi-generator/1.1.0/tutorials/swift-openapi-generator/clientswiftpm). 

You'll have to add the openapi.yaml file from the service but it's relatively 
easy to update the yaml file as part of your build process.

The two YAML files in the Sources is used by the OpenAPI generator plugin to
build the client. The `Packages.swift` file contains the required dependencies.

## Getting the OpenAPI spec

The OpenAPI spec is available in several other repositories; you can download it with `wget` before building. This
will download the latest version of the specification:

```shell 
cd Sources
rm -f openapi.yaml
wget https://raw.githubusercontent.com/lab5e/go-spanapi/main/api/openapi.yaml
```


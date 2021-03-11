# GraphQLRxSwift

GraphQLRxSwift is a small Swift GraphQL/Graphiti subscription driver that allows usage of [RxSwift](https://github.com/ReactiveX/RxSwift) observables
as subscription event streams.

[![Swift][swift-badge]][swift-url]
[![License][mit-badge]][mit-url]

Looking for help? Find resources [from the community](http://graphql.org/community/).


## Getting Started

Before using, it is best to familiarize yourself with the Swift [GraphQL](https://github.com/GraphQLSwift/GraphQL) and 
[Graphiti](https://github.com/GraphQLSwift/Graphiti) packages.

## Usage

Add GraphQLRxSwift to your `Package.swift`

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "https://github.com/GraphQLSwift/GraphQLRxSwift.git", .upToNextMinor(from: "0.0.1")),
    ]
)
```

GraphQLRxSwift provides an `ObservableEventStream` wrapper class that can be used with an RxSwift `Observable` to satisfy
`EventStream` requirements. A convenience method `toEventStream` is added to all Observable instances.
This class is used when defining subscription resolvers, as shown below:

```
func subscribeUser(context: HelloContext, arguments: NoArguments) -> EventStream<Any> {
    PublishSubject<Any>().toEventStream()
}
```

Also provided is a `ObservableSourceEventStream` type alias that can be used to downcast the result of a subscribe execution.
It is guaranteed that the stream returned by any subscription query whose resolver returns an `ObservableEventStream` will be a
`ObservableSourceEventStream`. For example:

```
let subscriptionResult = try graphQLApi.subscribe(
    request: request,
    context: api.context,
    on: group
).wait()
let subscription = subscriptionResult.stream as! ObservableSubscriptionEventStream? // Guaranteed
```

## License

This project is released under the MIT license. See [LICENSE](LICENSE) for details.

[swift-badge]: https://img.shields.io/badge/Swift-5.2-orange.svg?style=flat
[swift-url]: https://swift.org

[mit-badge]: https://img.shields.io/badge/License-MIT-blue.svg?style=flat
[mit-url]: https://tldrlegal.com/license/mit-license


import GraphQL
import NIO
import RxSwift

// EventStream wrapper for Observable
public class ObservableEventStream<Element> : EventStream<Element> {
    public var observable: Observable<Element>
    init(_ observable: Observable<Element>) {
        self.observable = observable
    }
    override open func map<To>(_ closure: @escaping (Element) throws -> To) -> EventStream<To> {
        return ObservableEventStream<To>(observable.map(closure))
    }
}
// Convenience types
public typealias ObservableSubscriptionEventStream = ObservableEventStream<Future<GraphQLResult>>

extension Observable {
    // Convenience method for wrapping Observables in EventStreams
    public func toEventStream() -> ObservableEventStream<Element> {
        return ObservableEventStream(self)
    }
}

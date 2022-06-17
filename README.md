# modular_flutter

A Flutter project to PoC modularisation.

## 3 Layer Architecture

![3 layer architecture](./docs/3-layer-architecture.png)

### Composition Root

* Houses the main app and the presentation layer
* All Providers are defined here
* Can depend on any layer below it

### Data

* Can also be referred to as an Infrastructure layer. This layer may handle DB / HTTP connections or device API 
    interactions, for example
* Houses implementations of abstractions that the domain layer defines (e.g., `InMemoryDriverBreakStateRepository`
    in the `data` package implements `DriverBreakStateRepository` abstraction defined in the `domain` package)
* Can only depend on the domain layer, it cannot depend on the Composition Root outside it

### Domain

* Also often referred to as a Business Logic layer
* With this reduced '3 layer architecture', this would contain not only core business-oriented objects like `Route` and
    `Drop`, but also use cases or other service-oriented classes that compose other objects to achieve some result
* 'Software in a vacuum': objects at this layer depend only on abstractions, no actual Input / Output can be
    implemented at this layer. We should be able to port this code to a web or desktop app with completely different
    IO technologies and for it to still be relevant.

## Pros

* Simpler segregation with about as few layers as possible (while still getting any benefit from physical boundaries)

## Cons

* The lack of an 'application' layer means that objects that the business should care about, like `Route` and `Drop`
    get confused with more implementation-focused objects like `DriverBreaksUseCase` that the business would have no
    concept of. This can muddy rules for core domain concepts
* The lack of a separate 'presentation' layer means that too much application / domain logic can start to be defined in
    an implied presentation space

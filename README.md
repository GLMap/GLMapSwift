# GLMap Swift Package

The official SwiftPM distribution of the native GLMap SDK. One package URL offers
independently selectable Core, Map, Search and Route products:

```text
https://github.com/GLMap/GLMapSwift.git
```

## Products and modules

- **GLMapCore** supplies the Core binary, the `GLMapCoreSwift` conveniences, and
  the shared resources required for initialization. It has no renderer dependency.
- **GLMap** supplies the Map binary and the `GLMapSwift` conveniences, and depends
  on Core. Existing Map applications can continue selecting this product.
- **GLSearch** supplies Search and Core, without Map or Route.
- **GLRoute** supplies Route and Core, without Map or Search.

The resource target also retains the default style so existing callers of
`GLMapManager.shared.resourcesBundle` continue to find it. Sharing data resources
is not a dependency on the renderer framework.

This source tree prepares the modular release. The release workflow selects the
binary versions/checksums before tagging; use the generated local package for
unpublished native SDK changes rather than mixing drafts with an older release.

## Existing Map applications

The package URL and the products `GLMap`, `GLSearch`, and `GLRoute` are preserved.
The traditional imports continue to work:

```swift
import GLMap
import GLMapCore
import GLMapSwift

GLMapManager.activate(apiKey: apiKey)
```

`GLMapSwift` re-exports `GLMapCoreSwift`. The Core geometry, activation, track and
notification extensions remain visible to source clients using the old import.
Marker and animation conveniences stay in `GLMapSwift`.

The native repository's non-SPM `GLMapSwift.framework` target compiles both Swift
source files together, preserving its original convenience-module layout.

## Headless services

Select `GLMapCore`, `GLSearch`, or `GLRoute` as needed, without selecting `GLMap`.
For example, a search-only application's target dependencies are:

```swift
.product(name: "GLMapCore", package: "GLMapSwift"),
.product(name: "GLSearch", package: "GLMapSwift"),
```

Initialize once before native operations:

```swift
import GLMapCore
import GLMapCoreSwift
import GLSearch

let initialized = GLMapManager.activate(apiKey: apiKey)
```

Map, Search and Route all share the same native Core manager. Do not initialize
separate managers for each feature. The empty key permits local/offline SDK use;
authenticated online services require your own key.

## Resources and compatibility boundary

Core's activation convenience selects its SwiftPM resource bundle automatically.
Use `GLMapManager.shared.resourcesBundle` or pass an explicit `resources` bundle;
do not hardcode SwiftPM's generated bundle filename.

The new generated bundle is `GLMap_GLMapCoreSwift.bundle`, not the former
`GLMap_GLMapSwift.bundle`. Normal SDK-based resource lookup remains supported;
code relying on the old internal filename must be migrated.

Moving Swift extensions to another Swift module is source-compatible through the
re-export, but it is not an ABI guarantee for precompiled code that references old
Swift symbols. Rebuild binary consumers. This change does not rename the native
Objective-C framework modules or their public classes.

## Binary-only embedding products

`GLMapBinary`, `GLSearchBinary`, and `GLRouteBinary` are advanced embedding products
containing only their native framework. They let multi-plugin hosts give the static
Swift conveniences and resource bundle exactly one owner (for example, a shared RN
Core pod). Such hosts must provide Core separately. Normal Swift applications
should use the main products above.

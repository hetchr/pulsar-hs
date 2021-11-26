pulsar-client-hs
=========

`pulsar-client-hs` is a client for Apache Pulsar made over the C API of [`pulsar-client-cpp`](https://pulsar.apache.org/docs/en/client-libraries-cpp/).

### Quick Start

See [`examples`](examples) directory.

### Regenerate `hsc` files

```
for f in `ls includes/`; c2hsc --prefix=Pulsar.Client.Internal.Foreign includes/$f
```

Be sure to have includes in this style: `#include <pulsar/c/reader.h>`

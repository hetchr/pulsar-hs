pulsar-admin
=========

`pulsar-admin` is a client for Apache Pulsar admin REST API generated via `@openapitools/openapi-generator-cli`.

### Quick Start

This library provides servant-client functions:

```haskell
*Pulsar.Admin Network.HTTP.Client Servant.API Servant.Client Data.Text> manager' <- newManager defaultManagerSettings
*Pulsar.Admin Network.HTTP.Client Servant.API Servant.Client Data.Text> runClientM (persistentGetList "public" "default") (mkClientEnv manager' (BaseUrl Http "localhost" 8080 ""))
Right ["persistent://public/default/app"]
```

### Regenerate the API

```
cd codegen
# Fetch and make sure to have unique operationIds in api.json (:'<,'>s/"operationId" : "\(.\)/"operationId" : "worker\U\1)
npm install
npx @openapitools/openapi-generator-cli generate \
        -i api.json -o api \
        --additional-properties=useKatip=false \
        --additional-properties=baseModule=Pulsar.Admin \
        --additional-properties=cabalPackage=pulsar-admin \
        --additional-properties=allowNonUniqueOperationIds=true \
        -g haskell \
        -t codegen-template
```

 * Reformat files
 * Move files

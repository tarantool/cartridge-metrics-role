[![Build Status](https://github.com/tarantool/cartridge-metrics-role/workflows/Tests/badge.svg?branch=master)](https://github.com/tarantool/cartridge-metrics-role/actions)

# Cartridge Metrics Role

`cartridge.roles.metrics` is a role for
[tarantool/cartridge](https://github.com/tarantool/cartridge).
It allows to use default metrics in a Cartridge application and manage them
via configuration.

### Usage

1. Add the `cartridge-metrics-role` package to dependencies in the `.rockspec` file.

   ```lua
   dependencies = {
       ...
       'cartridge-metrics-role == 0.1.0-1',
       ...
   }
   ```

2. Add `cartridge.roles.metrics` to the roles list in `cartridge.cfg`
   in your entry-point file (e.g. `init.lua`).
   ```lua
   local ok, err = cartridge.cfg({
       ...
       roles = {
           ...
           'cartridge.roles.metrics',
           ...
       },
   })
   ```

3. To view metrics via API endpoints, use `set_export`.
   **NOTE** that `set_export` has lower priority than clusterwide config and could be overriden by the metrics config.

   ```lua
   local metrics = require('cartridge.roles.metrics')
   metrics.set_export({
       {
           path = '/path_for_json_metrics',
           format = 'json'
       },
       {
           path = '/path_for_prometheus_metrics',
           format = 'prometheus'
       },
       {
           path = '/health',
           format = 'health'
       }
   })
   ```
   You can add several entry points of the same format by different paths,
   like this:

   ```lua
   metrics.set_export({
      {
          path = '/path_for_json_metrics',
          format = 'json'
      },
      {
          path = '/another_path_for_json_metrics',
          format = 'json'
      },
   })
   ```
   The metrics will be available on the path specified in `path` in the format
   specified in `format`.

4. After role initialization, default metrics will be enabled and the global
   label 'alias' will be set. If you need to use the functionality of any metrics
   package, you may get it as a Cartridge service and use it like a regular
   package after `require`:
   ```lua
   local cartridge = require('cartridge')
   local metrics = cartridge.service_get('metrics')
   ```

5. There is an ability in Tarantool Cartridge >= '2.4.0' to set a zone for each
   server in a cluster. If a zone was set for the server 'zone' label will be added
   for all metrics on this server.

This repository is a former part of
[metrics](https://github.com/tarantool/metrics) repository.

Metrics is a library to collect and expose [Tarantool](https://tarantool.io)-based applications metrics.
You can see related documentation [here](https://www.tarantool.io/en/doc/latest/book/monitoring/).

## Contacts

If you have questions, please ask it on [StackOverflow](https://stackoverflow.com/questions/tagged/tarantool) or contact us in Telegram:

- [Russian-speaking chat](https://t.me/tarantoolru)
- [English-speaking chat](https://t.me/tarantool)

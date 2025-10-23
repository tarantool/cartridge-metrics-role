# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

### Fixes

- Fixed CI: updated ubuntu version, use tt instead of tarantoolctl.

## [0.1.2] - 2025-10-22

### Changed

- Bump CMake version to avoid compatibility problem with CMake 4.x .

## [0.1.1] - 2023-07-14

### Added

- Function ``set_health_handler`` has been added to role ``cartridge.roles.metrics``,
  allowing you to set your own handle to check health
  (`tarantool/cartridge#2097 <https://github.com/tarantool/cartridge/issues/2097>`_).
  Main case - customizing the response format.

## [0.1.0] - 2023-05-24

### Added

- `cartridge.roles.metrics` from `metrics` repository

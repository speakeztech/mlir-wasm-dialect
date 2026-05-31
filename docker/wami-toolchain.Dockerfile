# Minimal CI-only image carrying the WAMI tools and the node executor.
#
# wasm-opt and wasm-emit link MLIR/LLVM statically, so no LLVM runtime is needed
# at all -- only the C/C++ runtime that the base image already provides. The
# binaries are built (Release) by the build-and-test job and staged, already
# stripped, into this build context; this Dockerfile only packages them.
#
# Layout matches OCaMI's WAMI_BUILD / WAMI_REPO contract: tools under
# build/bin and the node executor under toolchain/node-executor.
FROM ubuntu:24.04

COPY build/bin/wasm-opt /opt/wami/build/bin/wasm-opt
COPY build/bin/wasm-emit /opt/wami/build/bin/wasm-emit
COPY toolchain/node-executor /opt/wami/toolchain/node-executor

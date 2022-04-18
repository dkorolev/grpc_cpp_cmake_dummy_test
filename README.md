# `grpc_cpp_cmake_dummy_test`

## Objective

A relatively trivial example to:

* Build a C++ project that uses gRPC.
* By means of `cmake`, in a cross-platform way.
* Gather and `protoc`-compile all the `.proto` files.
* Build all the `*.cc` sources into the respective targets.
* Employ a `Makefile` to have the "IDE" Vi-friendly with `:mak`.
* Also, use `googletest`, from `C5T/current`, to test the above.

## Usage

From an Ubuntu shell, just `make` should do the job. Run the `Debug/test_{add,mul}` tests to confirm:

```
git clone https://github.com/dkorolev/grpc_cpp_cmake_dummy_test.git && \
(cd grpc_cpp_cmake_dummy_test; make && ./Debug/test_add && ./Debug/test_mul)
```

Also, from Ubuntu, "opening" the `CMakeLists.txt` file with QT Creator should work too.

Finally, on Windows, "Open Folder" should work with the respective folder.

## Caveats

First and foremost: The first "build" is slow, as it needs to:

* Fetch ~300MB of gRPC code, and
* Build this very gRPC code.

After this stage is done, the further builds (one-line changes) are quick.

## Further Work

* A Docker Container to build the above code.
* With a pre-fetched, and perhaps pre-built `gRPC`.
* Integrated with this repo via a GitHub action.
* Use gRPC asychronously.
* Performance test.
* And maybe compare performance of gRPC services across languages (C++ vs. JVM vs. Go).

## Credits

* **[@abakay](https://github.com/abakay)**, for making me use `cmake` (although he doesn't endorse me running it via `make` from my `vi`).
* **[@vladsadovsky](https://github.com/vladsadovsky)**, for the reference gRPC example, [test-grpc-cmake](https://github.com/vladsadovsky/test-grpc-cmake).

# NOTE(dkorolev): Yes, it is ugly to have a `Makefile` for a `cmake`-built project,
#                 but why not keep both "standard" solutions working out of the box?
#
# Seriously, the only goal of this `Makefile` is to have `vim` jump to errors on `:mak`.

.PHONY: debug release debug_dir release_dir indent clean

DEBUG_BUILD_DIR=$(shell echo "$${GRPC_CPP_CMAKE_DUMMY_DEBUG_BUILD_DIR:-Debug}")
RELEASE_BUILD_DIR=$(shell echo "$${GRPC_CPP_CMAKE_DUMMY_RELEASE_BUILD_DIR:-Release}")

OS=$(shell uname)
ifeq ($(OS), "Darwin")
  CORES=$(shell sysctl -n hw.physicalcpu)
else
  CORES=$(shell nproc)
endif

CLANG_FORMAT=$(shell echo "$${CLANG_FORMAT:-clang-format-10}")

debug: debug_dir
	MAKEFLAGS=--no-print-directory cmake --build "${DEBUG_BUILD_DIR}" -j ${CORES}

debug_dir: ${DEBUG_BUILD_DIR}

${DEBUG_BUILD_DIR}: CMakeLists.txt
	cmake -B "${DEBUG_BUILD_DIR}" .

release: release_dir
	MAKEFLAGS=--no-print-directory cmake --build "${RELEASE_BUILD_DIR}" -j ${CORES}

release_dir:	${RELEASE_BUILD_DIR}

${RELEASE_BUILD_DIR}: CMakeLists.txt
	cmake -DCMAKE_BUILD_TYPE=Release -B "${RELEASE_BUILD_DIR}" .

indent:
	${CLANG_FORMAT} -i *.cc *.proto

clean:
	rm -rf "${DEBUG_BUILD_DIR}" "${RELEASE_BUILD_DIR}"

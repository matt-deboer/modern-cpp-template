test:
	cd build && ctest -V

test-release:
	cd build && ctest -V -C release

build: gen-debug PHONY
	cd Build && cmake --build .

release: gen-release PHONY
	cd Build && cmake --build . --config Release

gen-release:
	cmake -H. -DCMAKE_BUILD_TYPE=Release

gen-debug:
	cmake -H. -BBuild -DCMAKE_BUILD_TYPE=Debug -WDev
	
init:
	@ git submodule update --init --recursive

gen-architecture:
	cmake -H. -BBuild -Ax64

git-dependency:
	@ ([ -z "${URL}" ] && echo "'URL' is required" && exit 1) || true
	@ ([ -z "${COMMIT}" ] && echo "'COMMIT' is required" && exit 1) || true

	$(eval SUBMOD_PATH := third_party/$(basename $(notdir ${URL})))

	@ echo "adding ${URL} at ${SUBMOD_PATH}..."
	@ [ ! -d ${SUBMOD_PATH} ] && git submodule add ${URL} ${SUBMOD_PATH};
	
	@ cd ${SUBMOD_PATH} \
		&& git checkout ${COMMIT} \
		&& cd ${PWD} \
		&& git add ${SUBMOD_PATH} \
		&& git commit -m "added dependency ${SUBMOD_PATH} at ${COMMIT}"

rm-git-dependency:
	@ ([ -z "${NAME}" ] && echo "'NAME' is required" && exit 1) || true

	$(eval SUBMOD_PATH := third_party/${NAME})

	@ (git rm --cached ${SUBMOD_PATH} || true) \
		&& (rm -rf .git/modules/${SUBMOD_PATH} || true) \
		&& (rm -rf ${SUBMOD_PATH} || true)

clean:
	rm -rf Build

.PHONY: PHONY
PONY:
	@ true
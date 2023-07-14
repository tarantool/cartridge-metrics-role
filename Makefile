TTCTL := tt
ifeq (,$(shell which tt 2>/dev/null))
	TTCTL := tarantoolctl
endif

.rocks: cartridge-metrics-role-scm-1.rockspec
	$(TTCTL) rocks install luatest # master newer than 0.5.7 required
	$(TTCTL) rocks install luacov 0.13.0
	$(TTCTL) rocks install luacheck 0.26.0
	$(TTCTL) rocks install cartridge $(CARTRIDGE_VERSION); \
	$(TTCTL) rocks install metrics $(METRICS_VERSION);
	$(TTCTL) rocks make

.PHONY: lint
lint: .rocks
	.rocks/bin/luacheck .

.PHONY: test
test: .rocks
	.rocks/bin/luatest -v -c

.PHONY: test_with_coverage_report
test_with_coverage_report: .rocks
	rm -f tmp/luacov.*.out*
	.rocks/bin/luatest --coverage -v -c --shuffle group --repeat 3
	.rocks/bin/luacov .
	echo
	grep -A999 '^Summary' tmp/luacov.report.out

.PHONY: clean
clean:
	rm -rf .rocks

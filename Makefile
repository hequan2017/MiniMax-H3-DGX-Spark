.PHONY: audit build down logs preflight profile-test provenance ref2va-profile-test security-test smoke status test up verify

preflight:
	./scripts/preflight.sh

build: preflight
	docker compose build

up: preflight
	docker compose up -d

logs:
	docker compose logs -f --tail=100

status:
	./scripts/status.sh

smoke:
	./scripts/smoke-t2va.sh

verify:
	./scripts/verify-output.sh output/smoke-t2va.mp4

test:
	./scripts/test-patch.sh

provenance:
	./scripts/runtime-provenance.sh

profile-test:
	./tests/test-profile-validation.sh

ref2va-profile-test:
	bash ./tests/test-ref2va-balanced-profile.sh

security-test:
	./tests/test-network-security.sh

audit:
	./scripts/public-audit.sh

down:
	docker compose down

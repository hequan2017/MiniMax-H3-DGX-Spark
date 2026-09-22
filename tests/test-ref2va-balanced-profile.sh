#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

rendered="$(docker compose -f compose.ref2va.yaml -f compose.ref2va.balanced.yaml config)"

grep -Fq 'H3_CACHE_BACKEND: cache_dit' <<<"$rendered"
grep -Fq '"residual_diff_threshold":0.10' <<<"$rendered"
grep -Fq 'H3_EXECUTION_MODE: compile' <<<"$rendered"
grep -Fq 'H3_DIFFUSION_ATTENTION_BACKEND: CUDNN_ATTN' <<<"$rendered"

printf 'ref2va balanced profile: PASS\n'

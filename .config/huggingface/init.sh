#!/bin/sh

HF_TOKEN=$(sed -e 's/[[:space:]]//g' "$HOME/.cache/huggingface/token")
export HF_TOKEN
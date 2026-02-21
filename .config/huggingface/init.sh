#!/bin/sh

export HF_TOKEN=$(sed -e 's/[[:space:]]//g' "$HOME/.cache/huggingface/token")
#!/bin/zsh

lms-claude() {
 # Define preferred default model
  local DEFAULT_MODEL="zai-org/glm-4.6v-flash"
  
  local ARGS=("$@")

  # If the user didn't provide a --model flag, prepend the default one
  if [[ ! " ${ARGS[*]} " =~ " --model " ]]; then
    # Prepend the default model argument to the ARGS array
    ARGS=("--model" "$DEFAULT_MODEL" "${ARGS[@]}")
  fi

  # Execute with scoped environment variables
  # Any user-provided --model in ${ARGS[@]} will now be the one used
  ANTHROPIC_BASE_URL=http://localhost:1234 \
  ANTHROPIC_AUTH_TOKEN=lmstudio \
  claude "${ARGS[@]}"
}

export PATH="$PATH:/Users/tensor/.lmstudio/bin"
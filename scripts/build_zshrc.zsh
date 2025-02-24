#!/usr/bin/env zsh
set -euo pipefail

files=("${@}")

echo "export __ZSHRC_SOURCE_DIR=${SOURCE_DIR}\n"

for ((i=0; i<${#files[@]}; i++)); do
    file="${files[i+1]}"
    [[ "$(cat "${file}" | grep -v '^# Description:' | wc -l | tr -d ' ')" -eq 0 ]] && continue
    description="$(grep '^# Description:' "${file}" | sed 's/# Description: //' || true)"
    if [[ "$i" -ne 0 ]]; then
        # add a newline between files
        echo
    fi
    echo "##### ${file} #####"
    if [[ -n "${description}" ]]; then
        echo "# ${description}"
    else
        echo "#"
    fi
    echo "#\n"
    cat "${file}" | grep -v '^# Description:'
done

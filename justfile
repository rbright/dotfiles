# Use bash with strict error checking
set shell := ["bash", "-euo", "pipefail", "-c"]

# Allow passing arguments to recipes
set positional-arguments

hosts_dir := ".stow/hosts"

# Show available recipes with their descriptions
default:
    @just --list

# Install dotfiles for one host.
# Known hosts: lambda, omega
# Example: STOW_FLAGS="-nv" just install lambda
install host:
    @case "{{host}}" in lambda|omega) ;; *) echo "Unknown host: {{host}}" >&2; echo "Known hosts: lambda, omega" >&2; exit 1 ;; esac; \
    host_file="{{hosts_dir}}/{{host}}.packages"; \
    if [ ! -f "$host_file" ]; then echo "Host file missing: $host_file" >&2; exit 1; fi; \
    mapfile -t packages < <(sed -E 's/[[:space:]]*#.*$//; s/^[[:space:]]+//; s/[[:space:]]+$//; /^[[:space:]]*$/d' "$host_file"); \
    if [ "${#packages[@]}" -eq 0 ]; then echo "Host {{host}} has no packages: $host_file" >&2; exit 1; fi; \
    for pkg in "${packages[@]}"; do if [ ! -d "$pkg" ]; then echo "Unknown package in $host_file: $pkg" >&2; exit 1; fi; done; \
    echo "Installing host '{{host}}' from $host_file"; \
    stow ${STOW_FLAGS:-} "${packages[@]}"

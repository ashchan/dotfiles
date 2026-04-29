#!/bin/sh

set -eu

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
backup_dir="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

info() {
  printf '%s\n' "$*"
}

die() {
  printf 'error: %s\n' "$*" >&2
  exit 1
}

link_file() {
  source_path=$1
  target_path=$HOME/$(basename -- "$source_path")

  if [ -L "$target_path" ]; then
    current_target=$(readlink "$target_path")
    if [ "$current_target" = "$source_path" ]; then
      info "ok: $target_path -> $source_path"
      return
    fi
    rm "$target_path"
  elif [ -e "$target_path" ]; then
    mkdir -p "$backup_dir"
    mv "$target_path" "$backup_dir/"
    info "backed up: $target_path -> $backup_dir/"
  fi

  ln -s "$source_path" "$target_path"
  info "linked: $target_path -> $source_path"
}

command -v git >/dev/null 2>&1 || die "git is required"

cd "$repo_dir"

git ls-files |
while IFS= read -r path; do
  case "$path" in
    README.md|install.sh)
      continue
      ;;
    .*/*|*/*)
      continue
      ;;
    .*)
      link_file "$repo_dir/$path"
      ;;
  esac
done

if [ -d "$backup_dir" ]; then
  info "backups saved in: $backup_dir"
fi

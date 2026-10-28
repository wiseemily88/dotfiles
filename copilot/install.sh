#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"
COPILOT_ROOT="${COPILOT_HOME:-$HOME/.copilot}"
SKILLS_ROOT="$COPILOT_ROOT/skills"

mkdir -p "$SKILLS_ROOT"

for source_dir in skills/*
do
  [ -d "$source_dir" ] || continue

  skill_name=$(basename "$source_dir")
  target_dir="$SKILLS_ROOT/$skill_name"
  mkdir -p "$target_dir"
  cp "$source_dir/SKILL.md" "$target_dir/SKILL.md"
done

history_dir="$COPILOT_ROOT/state/ai-daily-training"
mkdir -p "$history_dir"
if ! [ -f "$history_dir/history.json" ]
then
  printf '{"lessons":[]}\n' > "$history_dir/history.json"
fi

if ! [ -f "$history_dir/practice-prompts.md" ]
then
  printf '# AI Daily Training Practice Prompts\n' > "$history_dir/practice-prompts.md"
fi

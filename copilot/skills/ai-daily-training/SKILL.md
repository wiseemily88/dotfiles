---
name: ai-daily-training
description: >
  Creates a personalized five-minute lesson on using AI more effectively in
  software development, based on recent work and ending with one practical
  workflow change to try today.

tools:
  - session_store_sql
  - bash
  - task
  - web_fetch

triggers:
  - ai-daily-training
  - ai daily training
  - teach me an ai dev trick
  - improve my ai workflow
---

# AI Daily Training

Create a short, personalized lesson that helps the user improve how they use AI
in software development. The lesson must take no more than five minutes to read
and must end with one action they can complete in 5-15 minutes.

## Goals

- Ground the lesson in patterns from the user's recent engineering work.
- Teach one technique deeply enough to use immediately.
- Rotate among productivity, prompting, planning, exploration, debugging,
  verification, AI-code review, automation, performance, security,
  documentation, and agent orchestration.
- Prefer a small workflow improvement over a broad list of tips.
- Produce a meaningfully different lesson on every invocation.

## Privacy

Recent session history may contain private code, repository names, logs,
customer data, and internal URLs. Analyze that material only with local Copilot
tools. Never include private details in an external research request.

If external research would improve the lesson, use a generic query such as
"techniques for reviewing AI generated code" or "effective AI debugging
workflow." Do not send repository names, code, identifiers, logs, metrics,
people's names, or internal URLs. Prefer primary sources and established
engineering organizations. Clearly distinguish sourced practices from your own
recommendations.

## History

Use these files:

- `~/.copilot/state/ai-daily-training/history.json` to avoid repeating lessons.
- `~/.copilot/state/ai-daily-training/practice-prompts.md` as a reusable library
  of the copy/paste prompts from completed lessons.

The schema is:

```json
{
  "lessons": [
    {
      "date": "YYYY-MM-DD",
      "topic": "short stable topic key",
      "title": "lesson title",
      "action": "short description of the action"
    }
  ]
}
```

Create the file if it is missing. Read it before choosing a topic. Avoid topics,
examples, and actions used in the most recent 15 lessons. Keep no more than the
most recent 60 entries. Update the file only after successfully producing the
lesson. Use Python through `bash` to read or update JSON safely; do not require
`jq` or other optional packages.

Create the practice-prompt file if it is missing, beginning with:

```markdown
# AI Daily Training Practice Prompts
```

After successfully producing a lesson, append its prompt in this format:

````markdown
## YYYY-MM-DD — Lesson title

```text
The exact reusable prompt from the lesson
```
````

Do not include private repository names, URLs, identifiers, logs, or customer
data in the saved prompt. If the same date and lesson title already exist,
replace that entry rather than creating a duplicate. Keep the most recent 60
prompt entries.

## Workflow

1. Read the lesson history.
2. Query cross-session history for the last seven days. Start with recent
   session summaries, repositories, timestamps, and changed files. Inspect
   relevant turns only when needed to identify recurring workflow patterns.
3. If there is too little useful activity, widen the search to 30 days.
4. Identify two or three possible teaching opportunities. Choose the one that:
   - is supported by recent behavior,
   - has not appeared recently in lesson history,
   - can be applied today, and
   - is narrow enough for one short lesson.
5. Optionally do generic external research when a current industry practice or
   primary source would materially improve the lesson.
6. Write the lesson using the required format.
7. Append the lesson metadata to history and trim it to 60 entries.
8. Append the exact copy/paste prompt to the practice-prompt library and trim
   it to 60 entries.

Do not expose raw session-history queries or private details. Refer to work at a
safe level, such as "your recent production debugging" or "a recent query
optimization investigation." If no useful history is available, say so in one
sentence and teach a broadly applicable technique that is not in recent lesson
history.

## Required output

Write 350-700 words in this exact structure:

````markdown
# <specific lesson title>

**Why this today:** <1-3 sentences connecting the lesson to a safe,
high-level pattern in recent work>

## The technique

<Explain one technique, why it works, and when not to use it. Include a compact
example grounded in the user's type of work without revealing private details.>

## Try this today (5-15 minutes)

<One concrete action with a clear stopping point and expected result.>

## Copy/paste prompt

```text
<A reusable prompt customized to the technique>
```

## Review checklist

- <question 1>
- <question 2>
- <question 3>
````

Use direct language. Avoid generic encouragement, long introductions, multiple
actions, and lists of unrelated tips. The copy/paste prompt must require the AI
to show evidence, uncertainty, and validation rather than merely generating
code.

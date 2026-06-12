#!/usr/bin/env python3
"""Email labeler script: fetch unprocessed emails, apply labels.

PROVIDER-AGNOSTIC STUB. Wire the three TODO sections to your provider
(Gmail API, Microsoft Graph, JMAP) before first use. Everything else
(CLI, JSON contract, batching) is done.

Usage:
    python label.py fetch --max 50          # prints JSON array of emails
    python label.py apply --input labels.json   # applies {id: label} mapping

Credentials come from environment variables. Reference them by NAME in
chat, never paste values.
"""

import argparse
import json
import os
import sys

LABELS = ["action-required", "waiting-on", "reference", "newsletter-ish"]


def get_client():
    """Return an authenticated client for your email provider.

    TODO(provider-auth): implement for your provider. Examples:
      - Gmail: google-api-python-client + OAuth token file; run the
        one-time consent flow separately and store token.json next to
        this script (gitignore it).
      - Microsoft Graph: msal device-code flow, scope Mail.ReadWrite.
      - Fastmail/JMAP: bearer token from env var FASTMAIL_TOKEN.
    Read secrets from env vars, e.g. os.environ["GMAIL_TOKEN_PATH"].
    """
    raise NotImplementedError("Wire get_client() to your email provider")


def fetch(max_count: int) -> list[dict]:
    """Return up to max_count unprocessed emails as dicts.

    Contract: [{"id": str, "sender": str, "subject": str, "snippet": str}]
    'Unprocessed' = no label from LABELS applied yet.

    TODO(provider-fetch): implement. Gmail example: users.messages.list
    with q="-label:action-required -label:waiting-on -label:reference
    -label:newsletter-ish in:inbox", then users.messages.get for headers
    and snippet.
    """
    client = get_client()
    raise NotImplementedError("Wire fetch() to your email provider")


def apply_labels(mapping: dict[str, str]) -> dict:
    """Apply labels per {email_id: label}. Returns counts per label.

    Must be additive: apply labels only, never archive or delete.

    TODO(provider-apply): implement. Gmail example: ensure the four
    labels exist via users.labels.list/create, then
    users.messages.modify with addLabelIds. Batch where the API allows.
    """
    client = get_client()
    raise NotImplementedError("Wire apply_labels() to your email provider")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="cmd", required=True)

    p_fetch = sub.add_parser("fetch")
    p_fetch.add_argument("--max", type=int, default=50)

    p_apply = sub.add_parser("apply")
    p_apply.add_argument("--input", required=True, help="JSON file: {id: label}")

    args = parser.parse_args()

    try:
        if args.cmd == "fetch":
            print(json.dumps(fetch(args.max), indent=2))
        elif args.cmd == "apply":
            with open(args.input) as f:
                mapping = json.load(f)
            bad = {i: l for i, l in mapping.items() if l not in LABELS}
            if bad:
                print(f"Unknown labels: {bad}", file=sys.stderr)
                return 1
            print(json.dumps(apply_labels(mapping), indent=2))
    except NotImplementedError as e:
        print(f"Not wired yet: {e}", file=sys.stderr)
        print("See the TODO(provider-*) markers in this file.", file=sys.stderr)
        return 2
    return 0


if __name__ == "__main__":
    sys.exit(main())

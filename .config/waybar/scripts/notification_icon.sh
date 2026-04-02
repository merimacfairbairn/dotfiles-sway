#!/usr/bin/env bash

DND_STATUS=$(swaync-client --get-dnd 2>/dev/null)
UNREAD_COUNT=$(swaync-client --count 2>/dev/null)

if [ "$DND_STATUS" = "true" ]; then
    echo "󰂛"
elif [ "${UNREAD_COUNT:-0}" -gt 0 ]; then
    echo "󱅫"
else
    echo "󰂚"
fi

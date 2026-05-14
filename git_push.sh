#!/bin/bash

# Verifica se è stato fornito un messaggio di commit come argomento
if [ -z "$1" ]; then
    echo "Errore: Inserisci un messaggio di commit."
    echo "Utilizzo: ./git_push.sh \"messaggio del commit\""
    exit 1
fi

COMMIT_MSG=$1

echo "--- Aggiunta file ---"
git add .

echo "--- Commit delle modifiche ---"
git commit -m "$COMMIT_MSG"

echo "--- Invio al repository (Push) ---"
git push origin main

if [ $? -eq 0 ]; then
    echo "--- Successo! ---"
    echo "Modifiche inviate a GitHub con il messaggio: $COMMIT_MSG"
else
    echo "--- Errore durante il push ---"
    exit 1
fi

#!/usr/bin/env bash

echo "Initializing project..."

if [ ! -f .env ]; then
    echo "Creating .env from .env.example..."
    cp .env.example .env
else
    echo ".env already exists, skipping."
fi

echo "Initialization complete!"

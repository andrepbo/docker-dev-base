#!/bin/bash
source /root/.nvm/nvm.sh
echo "Node.js version: $(node -v)"
exec "$@"
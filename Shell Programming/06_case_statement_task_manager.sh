#!/bin/bash
# Demonstrates case statement with patterns

# Validate input
if [ $# -eq 0 ]; then
    echo "Usage: $0 <command>"
    echo "Commands: start, stop, restart, status"
    exit 1
fi

COMMAND="$1"

case "$COMMAND" in
    # OR condition
    start | run)
        echo "✅ Service started"
        ;;
    
    # Wildcard patterns
    s*p | h*t | end)
        echo "🛑 Service stopped"
        ;;
        
    # Prefix match
    status*)
        echo "📊 Checking service status"
        ;;
    
    # Fall-through example
    reload)
        echo "🔄 Reloading configuration"
        ;&
        
    restart)
        echo "🔄 Restarting service"
        ;;
        
    *)
        echo "❌ Unknown command: $COMMAND"
        exit 2
        ;;
esac

echo "Task completed"

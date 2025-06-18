#!/bin/bash

echo "🔑 Update OpenAI API Key for Marketing Swarm"
echo "=========================================="
echo ""
echo "Your current API key is invalid and causing 401 errors."
echo ""
echo "To get a new API key:"
echo "1. Go to https://platform.openai.com/api-keys"
echo "2. Create a new API key"
echo "3. Copy the key (it starts with 'sk-')"
echo ""
read -p "Enter your OpenAI API key: " api_key

# Validate key format
if [[ ! "$api_key" =~ ^sk- ]]; then
    echo "❌ Error: API key should start with 'sk-'"
    exit 1
fi

# Update .env file
if grep -q "^OPENAI_API_KEY=" .env; then
    # Use a different delimiter for sed to handle special characters in API key
    sed -i.bak "s|^OPENAI_API_KEY=.*|OPENAI_API_KEY=$api_key|" .env
    echo "✅ API key updated in .env file"
    echo "📄 Backup saved as .env.bak"
else
    echo "❌ Error: OPENAI_API_KEY not found in .env file"
    exit 1
fi

echo ""
echo "🚀 Next steps:"
echo "1. Restart the backend: cd backend && python main_simple.py"
echo "2. Test with: python test_ai_conversation.py"
echo ""
echo "✅ API key update complete!"
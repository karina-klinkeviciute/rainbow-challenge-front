#!/bin/bash
# release.sh - Create a new release

# Get current version from pubspec.yaml
CURRENT_VERSION=$(grep 'version:' pubspec.yaml | sed 's/version: //g' | cut -d'+' -f1)
echo "Current version: $CURRENT_VERSION"

# Parse version parts
MAJOR=$(echo $CURRENT_VERSION | cut -d'.' -f1)
MINOR=$(echo $CURRENT_VERSION | cut -d'.' -f2)
PATCH=$(echo $CURRENT_VERSION | cut -d'.' -f3)

# Auto-increment patch version
NEW_PATCH=$((PATCH + 1))
NEW_VERSION="$MAJOR.$MINOR.$NEW_PATCH"

echo "New version will be: $NEW_VERSION"
read -p "Create tag v$NEW_VERSION and trigger release? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Update pubspec.yaml (keep the +BUILD format, it will be updated by CI)
    BUILD_NUMBER=$(grep 'version:' pubspec.yaml | cut -d'+' -f2)
    sed -i '' "s/version: $CURRENT_VERSION+$BUILD_NUMBER/version: $NEW_VERSION+$BUILD_NUMBER/" pubspec.yaml
    
    # Commit version bump
    git add pubspec.yaml
    git commit -m "Bump version to $NEW_VERSION"
    
    # Create and push tag
    git tag "v$NEW_VERSION"
    git push origin main
    git push origin "v$NEW_VERSION"
    
    echo "✅ Released v$NEW_VERSION - Codemagic will build and deploy to TestFlight"
else
    echo "❌ Cancelled"
fi
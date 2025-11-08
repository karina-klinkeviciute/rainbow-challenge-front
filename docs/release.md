# 🚀 Rainbow Challenge Release Guide for iOS

Hey there! This guide will help you create new releases of Rainbow Challenge. We've made it as simple as possible - promise! 

For now it's only for codemagic + iOS, but in the future we could include automated Android builds as well.

## Daily Development Workflow

### Working on Features

Just code and push normally! You can push to `main` as much as you want:
```bash
git add .
git commit -m "Fix login bug"
git push origin main
```

**Don't worry** - pushing to `main` won't trigger any builds or deployments. You're free to push whenever you need to. 🙂

## Creating a Release

### When You're Ready

When your changes are tested and you want to send a new version to TestFlight, it's time to create a release!

### The Easy Way

Just run this command from the project root:
`bash ./release.sh`

The script will walk you through it:

1. Shows your current version (e.g., `1.0.36`)
2. Suggests the next version (e.g., `1.0.37`)
3. Asks if you want to continue
4. Updates `pubspec.yaml` for you
5. Creates a git tag (e.g., `v1.0.37`)
6. Pushes everything to GitHub
7. Triggers the Codemagic build automatically

### Example
```bash
$ ./release.sh
Current version: 1.0.36
New version will be: 1.0.37
Create tag v1.0.37 and trigger release? (y/n) y
✅ Released v1.0.37 - Codemagic will build and deploy to TestFlight
```

That's it! ✨

## What Happens Next

### The Build Process

Once you create the release:

1. **Codemagic detects the tag** and starts building (usually within a minute)
2. **Build takes 5-10 minutes** - grab a coffee or tea! ☕
3. **App is signed** with the proper certificates automatically
4. **Uploaded to TestFlight** - no manual work needed
5. **You get an email** when it's done (success or failure)

### Version Numbers Explained

We use semantic versioning: `MAJOR.MINOR.PATCH+BUILD`

- **Version** (e.g., `1.0.37`) - You control this with the release script
- **Build number** (e.g., `+142`) - Auto-increments based on git commits

You only worry about the version number. The build number handles itself! 🎉

## Troubleshooting

### "Permission denied: ./release.sh"

Make the script executable:
```bash
chmod +x release.sh
```

### "Nothing is happening in Codemagic"

Check that:
- The tag was pushed: `git tag -l` should show your version
- You're looking at the right Codemagic app
- The tag follows the pattern `v*.*.*` (e.g., `v1.0.37`)

### "Build failed"

Check your email for the Codemagic notification - it will tell you what went wrong. Common issues:
- Syntax errors in code
- Missing dependencies
- Certificate issues   
- Or perhaps something more less expected. 

Don't panic! Read Codemagics errorlog to find the problems.   
You can always create a new release after fixing the issue.

## For Major or Minor Version Updates

The script auto-increments the **patch** version (the last number). If you need to bump the major or minor version:

**Option 1:** Manually edit `pubspec.yaml` first:
```yaml
version: 2.0.0+142  # Change to your desired version
```

Then run `./release.sh` - it will increment from there (→ `2.0.1`)

**Option 2:** Modify the release script if you need this often (ask for help!)

## Need Help?

If something's not working or you're unsure about anything, just reach out! We're here to help. 💙

Remember: You can't break anything by trying. Git keeps everything safe, and we can always roll back if needed.

---

*Happy releasing! 🌈*

*Note: Only team members with push access to `main` can create releases.*
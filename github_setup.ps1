# GitHub Setup Script for Bird Sound Classification AI
# Run this script to initialize and push your project to GitHub

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "   Bird Sound Classification AI" -ForegroundColor Cyan
Write-Host "   GitHub Setup Script" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Check if Git is installed
Write-Host "Checking Git installation..." -ForegroundColor Yellow
try {
    $gitVersion = git --version
    Write-Host "✓ Git is installed: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Git is not installed!" -ForegroundColor Red
    Write-Host "Please install Git from: https://git-scm.com/downloads" -ForegroundColor Yellow
    exit
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Step 1: Configure Git" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan

# Get user details
$userName = Read-Host "Enter your GitHub username"
$userEmail = Read-Host "Enter your email address"

git config --global user.name "$userName"
git config --global user.email "$userEmail"

Write-Host "✓ Git configured successfully!" -ForegroundColor Green

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Step 2: Initialize Repository" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan

# Initialize git repository
if (Test-Path .git) {
    Write-Host "✓ Git repository already initialized" -ForegroundColor Green
} else {
    git init
    Write-Host "✓ Git repository initialized" -ForegroundColor Green
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Step 3: Add Files" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan

# Add all files
git add .
Write-Host "✓ All files added to staging" -ForegroundColor Green

# Show status
Write-Host ""
Write-Host "Files to be committed:" -ForegroundColor Yellow
git status --short

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Step 4: Commit Changes" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan

git commit -m "Initial commit: Bird Sound Classification AI with professional UI"
Write-Host "✓ Files committed successfully" -ForegroundColor Green

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Step 5: Create GitHub Repository" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan

Write-Host ""
Write-Host "Now, create a repository on GitHub:" -ForegroundColor Yellow
Write-Host "1. Go to: https://github.com/new" -ForegroundColor White
Write-Host "2. Repository name: bird-sound-classification" -ForegroundColor White
Write-Host "3. Description: AI-powered bird species classification" -ForegroundColor White
Write-Host "4. Set as Public" -ForegroundColor White
Write-Host "5. DO NOT initialize with README" -ForegroundColor White
Write-Host "6. Click 'Create repository'" -ForegroundColor White
Write-Host ""

$confirm = Read-Host "Have you created the repository on GitHub? (yes/no)"

if ($confirm -eq "yes") {
    Write-Host ""
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host "Step 6: Push to GitHub" -ForegroundColor Cyan
    Write-Host "============================================" -ForegroundColor Cyan
    
    $repoUrl = Read-Host "Enter your GitHub repository URL (e.g., https://github.com/username/bird-sound-classification.git)"
    
    # Add remote
    git remote remove origin 2>$null
    git remote add origin $repoUrl
    Write-Host "✓ Remote repository added" -ForegroundColor Green
    
    # Rename branch to main
    git branch -M main
    Write-Host "✓ Branch renamed to main" -ForegroundColor Green
    
    # Push to GitHub
    Write-Host ""
    Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
    git push -u origin main
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "============================================" -ForegroundColor Green
        Write-Host "   SUCCESS! 🎉" -ForegroundColor Green
        Write-Host "============================================" -ForegroundColor Green
        Write-Host ""
        Write-Host "Your code has been pushed to GitHub!" -ForegroundColor Green
        Write-Host ""
        Write-Host "Next Steps:" -ForegroundColor Cyan
        Write-Host "1. Go to https://share.streamlit.io/" -ForegroundColor White
        Write-Host "2. Click 'New app'" -ForegroundColor White
        Write-Host "3. Select your repository: $repoUrl" -ForegroundColor White
        Write-Host "4. Main file: app.py" -ForegroundColor White
        Write-Host "5. Click 'Deploy!'" -ForegroundColor White
        Write-Host ""
        Write-Host "Your app will be live at: https://YOUR-APP-NAME.streamlit.app" -ForegroundColor Yellow
        Write-Host ""
    } else {
        Write-Host ""
        Write-Host "✗ Push failed!" -ForegroundColor Red
        Write-Host "You may need to authenticate with GitHub." -ForegroundColor Yellow
        Write-Host "Try running: gh auth login" -ForegroundColor Yellow
    }
} else {
    Write-Host ""
    Write-Host "Please create the repository on GitHub first, then run this script again." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "For detailed deployment instructions, see DEPLOYMENT.md" -ForegroundColor Cyan
Write-Host ""

Read-Host "Press Enter to exit"

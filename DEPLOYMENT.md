# 🚀 Deployment Guide - Bird Sound Classification AI

Complete step-by-step guide to deploy your Bird Sound Classification application to GitHub and Streamlit Cloud.

---

## 📋 Table of Contents

1. [Prerequisites](#prerequisites)
2. [GitHub Setup](#github-setup)
3. [Streamlit Cloud Deployment](#streamlit-cloud-deployment)
4. [Alternative Deployments](#alternative-deployments)
5. [Troubleshooting](#troubleshooting)

---

## 🔧 Prerequisites

### Required Tools

- [ ] **Git** installed on your computer
  - Download: https://git-scm.com/downloads
  - Verify: `git --version`

- [ ] **GitHub Account**
  - Sign up: https://github.com/join

- [ ] **Streamlit Cloud Account** (Free)
  - Sign up: https://share.streamlit.io/

### Required Files

Ensure you have these files in your project:
- ✅ `app.py` - Main Streamlit application
- ✅ `requirements.txt` - Python dependencies
- ✅ `model.h5` - Trained model file
- ✅ `prediction.json` - Label mapping
- ✅ `README.md` - Project documentation
- ✅ `.gitignore` - Git ignore file

---

## 📁 Step 1: GitHub Setup

### 1.1 Install Git (if not installed)

**Windows:**
```powershell
# Download and install from https://git-scm.com/download/win
# Or use winget:
winget install --id Git.Git -e --source winget
```

**Verify Installation:**
```powershell
git --version
```

### 1.2 Configure Git

```powershell
# Set your name and email
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### 1.3 Initialize Git Repository

```powershell
# Navigate to your project directory
cd E:\projects\kookoo_ai_new

# Initialize git repository
git init

# Check status
git status
```

### 1.4 Create .gitignore (if not exists)

The `.gitignore` file is already created. Verify it contains:

```
__pycache__/
*.pyc
venv/
.venv/
*.log
temp_*
.streamlit/
```

### 1.5 Add Files to Git

```powershell
# Add all files
git add .

# Check what will be committed
git status

# Commit with message
git commit -m "Initial commit: Bird Sound Classification AI"
```

---

## 🌐 Step 2: Create GitHub Repository

### 2.1 Create Repository on GitHub

1. Go to https://github.com/new
2. **Repository name**: `bird-sound-classification` (or your preferred name)
3. **Description**: `AI-powered bird species classification from audio using deep learning`
4. **Visibility**: Public (required for free Streamlit Cloud deployment)
5. **DO NOT** initialize with README (we already have one)
6. Click **"Create repository"**

### 2.2 Connect Local Repository to GitHub

GitHub will show you commands. Use these:

```powershell
# Add remote repository
git remote add origin https://github.com/YOUR_USERNAME/bird-sound-classification.git

# Verify remote
git remote -v

# Push to GitHub
git branch -M main
git push -u origin main
```

### 2.3 Verify Upload

1. Go to your GitHub repository: `https://github.com/YOUR_USERNAME/bird-sound-classification`
2. You should see all your files
3. README.md should be displayed on the main page

---

## ☁️ Step 3: Streamlit Cloud Deployment

### 3.1 Sign Up for Streamlit Cloud

1. Go to https://share.streamlit.io/
2. Click **"Sign up"**
3. Choose **"Continue with GitHub"**
4. Authorize Streamlit to access your GitHub account

### 3.2 Deploy Your App

1. Click **"New app"** button
2. Fill in the deployment form:

   **Repository:**
   - Select your GitHub repository: `YOUR_USERNAME/bird-sound-classification`

   **Branch:**
   - `main` (or `master` if that's your branch name)

   **Main file path:**
   - `app.py`

   **App URL (optional):**
   - Choose a custom URL like: `bird-classification-ai`
   - Final URL will be: `https://bird-classification-ai.streamlit.app`

3. Click **"Deploy!"**

### 3.3 Wait for Deployment

- Streamlit Cloud will:
  1. Clone your repository
  2. Install dependencies from `requirements.txt`
  3. Launch your app
  4. This takes 2-5 minutes

### 3.4 Access Your Deployed App

Once deployed:
- Your app will be live at: `https://YOUR-APP-NAME.streamlit.app`
- Share this URL with anyone!

---

## 🔄 Step 4: Update Your Deployed App

### 4.1 Make Changes Locally

```powershell
# Make changes to your files (e.g., edit app.py)

# Check changes
git status

# Add changes
git add .

# Commit changes
git commit -m "Description of your changes"

# Push to GitHub
git push origin main
```

### 4.2 Auto-Deploy

- Streamlit Cloud automatically redeploys when you push to GitHub
- Changes will be live in 2-3 minutes
- You can watch deployment progress in the Streamlit Cloud dashboard

---

## 🎯 Step 5: Manage Large Files (Model.h5)

### If model.h5 is too large for GitHub (>100MB):

#### Option 1: Use Git LFS (Large File Storage)

```powershell
# Install Git LFS
git lfs install

# Track large files
git lfs track "*.h5"

# Add .gitattributes
git add .gitattributes

# Add and commit the model
git add model.h5
git commit -m "Add model file with Git LFS"

# Push
git push origin main
```

#### Option 2: Use External Storage

1. Upload `model.h5` to Google Drive, Dropbox, or AWS S3
2. Update `app.py` to download the model:

```python
import gdown

@st.cache_resource
def download_model():
    url = 'YOUR_GOOGLE_DRIVE_LINK'
    output = 'model.h5'
    if not os.path.exists(output):
        gdown.download(url, output, quiet=False)
    return keras.models.load_model(output)
```

3. Add `gdown` to `requirements.txt`

---

## 🌍 Alternative Deployments

### Option A: Heroku

```powershell
# Install Heroku CLI
# Download from: https://devcenter.heroku.com/articles/heroku-cli

# Login
heroku login

# Create app
heroku create bird-classification-ai

# Deploy
git push heroku main
```

**Required files:**
- `Procfile`: `web: sh setup.sh && streamlit run app.py`
- `setup.sh`: Shell script for Streamlit configuration

### Option B: Render

1. Go to https://render.com
2. Connect GitHub repository
3. Create **"New Web Service"**
4. Build command: `pip install -r requirements.txt`
5. Start command: `streamlit run app.py`

### Option C: Hugging Face Spaces

1. Go to https://huggingface.co/spaces
2. Create new Space
3. Choose **Streamlit** as SDK
4. Upload files or connect Git repository

---

## 🐛 Troubleshooting

### Issue 1: Deployment Fails

**Check:**
- `requirements.txt` has compatible versions
- All files are committed and pushed
- No syntax errors in `app.py`

**View Logs:**
- Streamlit Cloud: Click "Manage app" → "Logs"

### Issue 2: Model Not Found

**Solution:**
```python
# Update load_model_and_dict() function
model_path = Path(__file__).parent / "model.h5"
json_path = Path(__file__).parent / "prediction.json"
```

### Issue 3: Large File Error

**Error:** `file exceeds GitHub's file size limit of 100 MB`

**Solutions:**
1. Use Git LFS (see Step 5)
2. Use external storage
3. Compress the model (if possible)

### Issue 4: Memory Limit

**Error:** `killed` or `Out of Memory`

**Solutions:**
1. Upgrade Streamlit Cloud plan (free tier: 1GB RAM)
2. Optimize model size
3. Use model quantization

### Issue 5: Dependencies Not Installing

**Solutions:**
```powershell
# Update requirements.txt with version ranges
streamlit>=1.28.0
tensorflow>=2.16.1
librosa>=0.10.1
```

---

## 📊 Monitoring Your App

### Streamlit Cloud Dashboard

Access: https://share.streamlit.io/

**Features:**
- View deployment status
- Check logs
- Monitor resource usage
- Reboot app
- Manage settings

### Analytics

Add Google Analytics:

```python
# Add to app.py
import streamlit.components.v1 as components

# Google Analytics tracking
components.html("""
<script async src="https://www.googletagmanager.com/gtag/js?id=YOUR_GA_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'YOUR_GA_ID');
</script>
""", height=0)
```

---

## 🎉 Success Checklist

- [ ] Git installed and configured
- [ ] Repository created on GitHub
- [ ] All files pushed to GitHub
- [ ] Streamlit Cloud account created
- [ ] App deployed successfully
- [ ] App URL accessible
- [ ] Model and prediction.json loading correctly
- [ ] Predictions working as expected
- [ ] README.md displays properly on GitHub

---

## 📞 Support

### Resources

- **Streamlit Docs**: https://docs.streamlit.io/streamlit-community-cloud
- **GitHub Docs**: https://docs.github.com
- **Git Tutorial**: https://git-scm.com/docs/gittutorial

### Community

- **Streamlit Forum**: https://discuss.streamlit.io/
- **GitHub Discussions**: Enable in your repository settings
- **Stack Overflow**: Tag with `streamlit` and `tensorflow`

---

## 🎓 Next Steps

1. **Custom Domain**: Configure a custom domain for your app
2. **Authentication**: Add user authentication if needed
3. **Database**: Integrate database for storing predictions
4. **API**: Create REST API endpoints
5. **Mobile App**: Build mobile version using the same model

---

**🎉 Congratulations!** Your Bird Sound Classification AI is now live and accessible worldwide!

Share your app URL:
```
https://YOUR-APP-NAME.streamlit.app
```

---

Made with ❤️ | Happy Deploying! 🚀

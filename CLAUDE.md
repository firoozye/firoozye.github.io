# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Jekyll-based GitHub Pages site for Dr. Nick Firoozye's academic and professional homepage. The site includes a blog, personal information, and academic content focused on quantitative finance, machine learning, and algorithmic trading.

## Key Architecture

### Jekyll Configuration
- **Theme**: Uses `jekyll-theme-hamilton` (remote theme)
- **Build System**: GitHub Pages with Jekyll
- **Markdown Engine**: Kramdown with MathJax support for mathematical expressions
- **Plugins**: 
  - `jekyll-feed` for RSS feeds
  - `jekyll-seo-tag` for SEO optimization
  - `jekyll-remote-theme` for theme management

### Site Structure
- `index.md` - Main homepage with detailed bio and academic information
- `blog.md` - Blog listing page using Jekyll's post collection
- `_posts/` - Blog posts in markdown format with Jekyll front matter
- `_layouts/` - Custom Jekyll layouts (currently empty, using theme defaults)
- `_includes/` - Partial templates (contains `head.html`)
- `images/` - Static assets including profile photos and figures

### Content Types
- **Academic Content**: Research interests, publications, teaching information
- **Blog Posts**: Technical posts on finance, machine learning, and algorithmic trading
- **Mathematical Content**: Uses MathJax for LaTeX math rendering in posts

## Common Development Commands

### Local Development
```bash
# Install dependencies
bundle install

# Serve locally for development
bundle exec jekyll serve

# Build the site
bundle exec jekyll build
```

### Content Management
```bash
# Create new blog post
# Posts should be named: YYYY-MM-DD-title.md in _posts/
# Include Jekyll front matter with title, date, and layout
```

### Dependencies
- Ruby gems managed via Bundler
- Uses `github-pages` gem for GitHub Pages compatibility
- Development dependencies handled through Gemfile

## Important Files

### Configuration
- `_config.yml` - Main Jekyll configuration with site metadata, theme, and build settings
- `Gemfile` - Ruby dependencies and Jekyll plugins
- `Gemfile.lock` - Locked dependency versions (auto-generated)

### Content
- `index.md` - Main homepage content with academic bio
- `blog.md` - Blog index page template
- `_posts/` - All blog posts with Jekyll front matter

### Assets
- `images/` - Profile photos and post images
- Static assets are served directly by Jekyll

## Development Notes

### MathJax Integration
- MathJax is enabled in `_config.yml` for mathematical expressions
- Kramdown is configured to work with MathJax
- Use LaTeX syntax in markdown for mathematical content

### Theme Customization
- Uses Hamilton theme via `jekyll-remote-theme`
- Custom layouts can be added to `_layouts/` to override theme defaults
- Custom includes can be added to `_includes/` directory

### GitHub Pages Deployment
- Site automatically builds and deploys via GitHub Pages
- No manual deployment needed - pushes to main branch trigger builds
- Uses GitHub Pages gem for consistent local/remote behavior

## Content Guidelines

### Blog Posts
- Place in `_posts/` directory with YYYY-MM-DD-title.md naming
- Include Jekyll front matter with title, date, and layout
- Use Kramdown markdown syntax
- Mathematical expressions supported via MathJax

### Images
- Store in `images/` directory
- Reference using relative paths in markdown
- Profile images should be optimized for web display

### Academic Content
- Main bio and academic information in `index.md`
- Keep research interests, publications, and contact info current
- Use consistent formatting for academic credentials and positions
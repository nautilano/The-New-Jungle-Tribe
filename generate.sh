#!/bin/bash
mkdir -p public/posts

# Create the main posts index page with a top navigation bar
cat << 'HTML' > public/posts/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Psychedelic Revelations - The New Jungle Tribe</title>
    <style>
        body { background-color: #1a2e23; color: #ffffff; font-family: sans-serif; padding: 40px; max-width: 800px; margin: auto; }
        nav { display: flex; justify-content: space-between; align-items: center; background: rgba(255,255,255,0.05); padding: 12px 20px; border-radius: 8px; border: 1px solid rgba(255,255,255,0.1); margin-bottom: 30px; }
        nav a { color: #4ade80; text-decoration: none; font-weight: bold; font-size: 1rem; }
        nav a:hover { text-decoration: underline; color: #6ee7b7; }
        h1 { color: #4ade80; font-size: 2.2rem; margin-bottom: 25px; }
        ul { list-style: none; padding: 0; }
        li { margin: 12px 0; background: rgba(255,255,255,0.05); padding: 14px 20px; border-radius: 8px; border: 1px solid rgba(255,255,255,0.1); }
        .post-link { color: #4ade80; text-decoration: none; font-size: 1.1rem; display: block; font-weight: bold; }
        .post-link:hover { text-decoration: underline; color: #6ee7b7; }
    </style>
</head>
<body>
    <nav>
        <a href="/">&larr; Home</a>
        <a href="/posts/">Psychedelic Revelations</a>
    </nav>
    <h1>Psychedelic Revelations</h1>
    <ul>
HTML

# Loop through every markdown post
for f in content/posts/*.md; do
    [ -e "$f" ] || continue
    filename=$(basename "$f" .md)
    [ "$filename" = "_index" ] && continue

    # Extract title safely
    title=$(grep -i '^title:' "$f" | head -n 1 | sed 's/^[Tt]itle:[[:space:]]*//;s/"//g;s/'\''//g;s/’//g')
    if [ -z "$title" ]; then
        title=$(echo "$filename" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++)sub(/./,toupper(substr($i,1,1)),$i)}1')
    fi

    # Extract clean body content excluding frontmatter
    raw_content=$(awk '
        BEGIN { skip=0; frontmatter=0 }
        /^---/ || /^\+\+\+/ { 
            if (frontmatter == 0) { frontmatter = 1; skip = 1; next }
            else if (frontmatter == 1 && skip == 1) { skip = 0; next }
        }
        skip == 0 { print }
    ' "$f")

    # Convert images to centered, compact elements
    content=$(echo "$raw_content" | sed -E 's/!\[[^]]*\]\(([^)]*\/)?([^)]+\.(jpg|jpeg|png|gif))\)/<div style="text-align: center; margin: 30px 0;"><img src="\/images\/\2" alt="Post Image" style="max-width: 30%; height: auto; border-radius: 8px; display: inline-block;"><\/div>/g')

    # Generate individual post page with top nav menu
    mkdir -p "public/posts/$filename"
    cat << HTML > "public/posts/$filename/index.html"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$title - The New Jungle Tribe</title>
    <style>
        body { background-color: #1e3a2b; color: #ffffff; font-family: sans-serif; padding: 40px; max-width: 800px; margin: auto; line-height: 1.6; }
        nav { display: flex; justify-content: space-between; align-items: center; background: rgba(255,255,255,0.05); padding: 12px 20px; border-radius: 8px; border: 1px solid rgba(255,255,255,0.1); margin-bottom: 30px; }
        nav a { color: #4ade80; text-decoration: none; font-weight: bold; font-size: 1rem; }
        nav a:hover { text-decoration: underline; color: #6ee7b7; }
        h1 { color: #4ade80; font-size: 2.2rem; margin-bottom: 20px; text-align: center; }
        p { color: #d1d5db; font-size: 1.1rem; margin-bottom: 20px; white-space: pre-wrap; }
    </style>
</head>
<body>
    <nav>
        <a href="/">&larr; Home</a>
        <a href="../">&larr; Back to Posts</a>
    </nav>
    <h1>$title</h1>
    <div>$content</div>
</body>
</html>
HTML

    # Append link to index page
    echo "        <li><a class=\"post-link\" href=\"$filename/\">$title</a></li>" >> public/posts/index.html
done

# Close the index HTML file
cat << 'HTML' >> public/posts/index.html
    </ul>
</body>
</html>
HTML

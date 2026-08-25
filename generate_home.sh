#!/bin/bash

mkdir -p public/el-brujito
mkdir -p public/more-projects
mkdir -p public/entries
mkdir -p public/philosophy

# 1. Update Main Hub to link Philosophy card/button if desired, or keep menu
cat << 'HTML' > public/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The New Jungle Tribe</title>
    <style>
        body { 
            background-color: #1a2e23; 
            color: #ffffff; 
            font-family: sans-serif; 
            padding: 40px 20px; 
            max-width: 1200px; 
            margin: auto; 
            text-align: center;
        }
        h1 { color: #4ade80; font-size: 2.8rem; margin-bottom: 10px; }
        .subtitle { color: #d1d5db; font-size: 1.2rem; margin-bottom: 30px; }
        
        .menu { display: flex; flex-wrap: wrap; justify-content: center; gap: 15px; max-width: 800px; margin: 0 auto 40px auto; }
        
        .btn { 
            background: rgba(255,255,255,0.05); 
            color: #4ade80; 
            padding: 12px 20px; 
            border-radius: 8px; 
            border: 1px solid rgba(255,255,255,0.1); 
            text-decoration: none; 
            font-size: 1.1rem; 
            font-weight: bold;
            transition: background 0.2s;
        }
        .btn:hover { background: rgba(255,255,255,0.1); color: #6ee7b7; }

        /* Cards Grid Style (4 cards layout) */
        .cards-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 20px;
            margin-bottom: 50px;
            text-align: left;
        }
        .info-card {
            background-color: #243b2f;
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 12px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            text-decoration: none;
            transition: border-color 0.2s, background-color 0.2s;
        }
        .info-card:hover {
            background-color: #2a4536;
            border-color: rgba(74, 222, 128, 0.4);
        }
        .info-card h3 { color: #4ade80; margin-top: 0; font-size: 1.2rem; margin-bottom: 8px; }
        .info-card p { color: #d1d5db; font-size: 0.95rem; margin: 0 0 15px 0; }
        .card-link { color: #4ade80; text-decoration: none; font-size: 0.95rem; font-weight: 500; align-self: flex-start; }
        .info-card:hover .card-link { text-decoration: underline; }

        /* Video Section Styles - 3 Column Grid */
        .video-section { border-top: 1px solid rgba(255,255,255,0.1); padding-top: 50px; margin-bottom: 50px; }
        .video-section h2 { color: #4ade80; font-size: 2rem; margin-bottom: 30px; }
        .video-grid { 
            display: grid; 
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); 
            gap: 25px; 
            text-align: left;
        }
        .album-card {
            background-color: #243b2f;
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 12px;
            padding: 16px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .video-wrapper { 
            position: relative; 
            padding-bottom: 56.25%; 
            height: 0; 
            overflow: hidden; 
            border-radius: 8px; 
            background: #000;
            margin-bottom: 15px;
        }
        .video-wrapper iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
        .album-info h3 { color: #ffffff; font-size: 1.15rem; margin: 0 0 8px 0; }
        .listen-link { color: #4ade80; text-decoration: none; font-size: 0.95rem; font-weight: 500; }
        .listen-link:hover { text-decoration: underline; }

        /* Lower Info Sections (About & Resources) */
        .lower-section {
            border-top: 1px solid rgba(255,255,255,0.1);
            padding-top: 40px;
            margin-top: 40px;
            text-align: left;
            max-width: 900px;
            margin-left: auto;
            margin-right: auto;
        }
        .lower-section h2 { color: #4ade80; font-size: 1.8rem; margin-bottom: 20px; text-align: center; }
        .lower-section p { color: #d1d5db; font-size: 1.05rem; line-height: 1.6; margin-bottom: 20px; }
        .resource-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .resource-box {
            background-color: #243b2f;
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 12px;
            padding: 20px;
        }
        .resource-box h3 { color: #4ade80; margin-top: 0; font-size: 1.1rem; margin-bottom: 8px; }
        .resource-box p { font-size: 0.95rem; margin: 0; color: #d1d5db; }

        /* Custom Ayahuasca Vine Cross-Section Footer Motif */
        .pachamama-footer-motif {
            margin: 50px auto 20px auto;
            max-width: 400px;
            background-color: #243b2f;
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 12px;
            padding: 20px;
            text-align: center;
        }
        .pachamama-footer-motif svg {
            width: 64px;
            height: 64px;
            margin-bottom: 8px;
            filter: drop-shadow(0 2px 4px rgba(0,0,0,0.3));
        }
        .pachamama-footer-motif p {
            color: #d1d5db;
            font-size: 0.9rem;
            margin: 0;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        /* Footer Socials */
        .footer {
            border-top: 1px solid rgba(255,255,255,0.1);
            margin-top: 30px;
            padding-top: 30px;
            padding-bottom: 20px;
            display: flex;
            justify-content: center;
            gap: 30px;
        }
        .social-link {
            color: #4ade80;
            text-decoration: none;
            font-weight: bold;
            font-size: 1.05rem;
            transition: color 0.2s;
        }
        .social-link:hover { color: #6ee7b7; text-decoration: underline; }
    </style>
</head>
<body>
    <h1>The New Jungle Tribe</h1>
    <p class="subtitle">Wisdom, Ethnobotany & Global Consciousness</p>
    
    <div class="menu">
        <a href="/posts/" class="btn">Psychedelic Revelations</a>
        <a href="/philosophy/" class="btn">The Tribe's Philosophy</a>
        <a href="/entries/" class="btn">New Entries</a>
    </div>

    <!-- Four Cards Grid Section -->
    <div class="cards-grid">
        <a href="/el-brujito/" class="info-card">
            <div>
                <h3>El Brujito 420</h3>
                <p>Observations, ethnobotany, and plant wisdom.</p>
            </div>
            <span class="card-link">Explore →</span>
        </a>
        <div class="info-card" style="cursor: default;">
            <div>
                <h3>Casa Lothlorien</h3>
                <p>Land updates, organic apothecary, and cacao practice.</p>
            </div>
        </div>
        <div class="info-card" style="cursor: default;">
            <div>
                <h3>Yugen Sanctuary</h3>
                <p>Amazonian healing space and master plant medicine.</p>
            </div>
        </div>
        <a href="/more-projects/" class="info-card">
            <div>
                <h3>More Projects</h3>
                <p>Applying the tribe's approach across different fields and initiatives.</p>
            </div>
            <span class="card-link">Explore →</span>
        </a>
    </div>

    <!-- Embedded Videos Section -->
    <div class="video-section">
        <h2>The Ayahuasca Music Trilogy</h2>
        <div class="video-grid">
            <div class="album-card">
                <div class="video-wrapper">
                    <iframe src="https://www.youtube.com/embed/I0Y52bgQNKI" title="Album I: The Calling" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="album-info">
                    <h3>Album I: The Calling</h3>
                    <a href="https://youtu.be/I0Y52bgQNKI" target="_blank" class="listen-link">Listen on YouTube →</a>
                </div>
            </div>
            <div class="album-card">
                <div class="video-wrapper">
                    <iframe src="https://www.youtube.com/embed/9y_reivRgT4" title="Album II: The Immersion" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="album-info">
                    <h3>Album II: The Immersion</h3>
                    <a href="https://youtu.be/9y_reivRgT4" target="_blank" class="listen-link">Listen on YouTube →</a>
                </div>
            </div>
            <div class="album-card">
                <div class="video-wrapper">
                    <iframe src="https://www.youtube.com/embed/Accu3dPmQQ4" title="Album III: Integration" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="album-info">
                    <h3>Album III: Integration</h3>
                    <a href="https://youtu.be/Accu3dPmQQ4" target="_blank" class="listen-link">Listen on YouTube →</a>
                </div>
            </div>
        </div>
    </div>

    <!-- About Section -->
    <div id="about" class="lower-section">
        <h2>About The New Jungle Tribe</h2>
        <p>Rooted deep in the heart of the Amazon basin in Iquitos, Peru, The New Jungle Tribe serves as a digital and physical sanctuary bridging ancient ethnobotanical wisdom, master plant medicine, and global consciousness.</p>
    </div>

    <!-- Resources Section -->
    <div id="resources" class="lower-section">
        <h2>Resources & Field Notes</h2>
        <p style="text-align: center;">Explore our curated guides, audio publications, and reference material on ethnobotany, integration, and Amazonian plant work.</p>
        <div class="resource-row">
            <div class="resource-box">
                <h3>The Ayahuasca Music Trilogy</h3>
                <p>Immersive sonic landscapes designed for preparation, ceremony, and integration work.</p>
            </div>
            <div class="resource-box">
                <h3>Ethnobotanical Field Notes</h3>
                <p>Ongoing observations regarding Amazonian flora, sustainable stewardship, and traditional practices.</p>
            </div>
        </div>
    </div>

    <!-- Ayahuasca Vine Cross-Section Footer Motif -->
    <div class="pachamama-footer-motif">
        <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
            <path d="M100,15 C135,12 165,30 180,60 C195,90 190,130 170,160 C150,190 110,195 80,185 C50,175 25,150 15,120 C5,90 20,50 50,30 C80,10 85,18 100,15 Z" fill="#b48a58" stroke="#d4a373" stroke-width="4"/>
            <path d="M100,30 C128,28 152,43 165,68 C178,93 174,124 158,148 C142,172 108,177 82,168 C56,159 36,137 28,110 C20,83 32,54 54,39 C76,24 85,32 100,30 Z" fill="#d4a373"/>
            <path d="M100,100 Q120,65 140,75 Q160,85 135,115 Z" fill="#fefae0" opacity="0.9"/>
            <path d="M100,100 Q140,95 150,120 Q160,145 130,145 Z" fill="#fefae0" opacity="0.9"/>
            <path d="M100,100 Q130,135 110,155 Q90,175 75,145 Z" fill="#fefae0" opacity="0.9"/>
            <path d="M100,100 Q80,155 60,140 Q40,125 70,110 Z" fill="#fefae0" opacity="0.9"/>
            <path d="M100,100 Q55,115 45,90 Q35,65 65,70 Z" fill="#fefae0" opacity="0.9"/>
            <path d="M100,100 Q70,65 90,45 Q110,25 115,70 Z" fill="#fefae0" opacity="0.9"/>
            <circle cx="100" cy="100" r="14" fill="#b48a58"/>
            <circle cx="100" cy="100" r="6" fill="#432818"/>
        </svg>
        <p>Honoring Pachamama • The Amazon Basin</p>
    </div>

    <!-- Footer Socials -->
    <div class="footer">
        <a href="https://discord.gg/YOUR_INVITE" target="_blank" class="social-link">Discord</a>
        <a href="https://youtube.com/@YOUR_CHANNEL" target="_blank" class="social-link">YouTube</a>
        <a href="https://instagram.com/YOUR_HANDLE" target="_blank" class="social-link">Instagram</a>
    </div>

</body>
</html>
HTML

# 2. Create More Projects page (Warm Beige / Desert Sand)
cat << 'HTML' > public/more-projects/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>More Projects — The New Jungle Tribe</title>
    <style>
        body { 
            background-color: #f4f1ea; 
            color: #2c241d; 
            font-family: sans-serif; 
            padding: 40px 20px; 
            max-width: 900px; 
            margin: auto; 
            text-align: center;
            display: flex;
            flex-direction: column;
            min-height: 90vh;
            justify-content: space-between;
        }
        .content-wrap {
            margin: auto;
            padding: 40px 20px;
        }
        h1 { color: #b45309; font-size: 3rem; margin-bottom: 10px; }
        .subtitle { color: #78716c; font-size: 1.3rem; margin-bottom: 30px; }
        
        .coming-soon-box {
            background-color: #e7e2d5; 
            border: 1px solid rgba(180, 83, 9, 0.2);
            border-radius: 16px;
            padding: 40px 30px;
            margin-bottom: 40px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
        }
        .coming-soon-box h2 {
            color: #b45309;
            font-size: 2rem;
            margin-top: 0;
            margin-bottom: 15px;
        }
        .coming-soon-box p {
            color: #44403c;
            font-size: 1.1rem;
            line-height: 1.6;
            margin: 0;
        }

        .btn { 
            background: rgba(180, 83, 9, 0.08); 
            color: #b45309; 
            padding: 12px 24px; 
            border-radius: 8px; 
            border: 1px solid rgba(180, 83, 9, 0.25); 
            text-decoration: none; 
            font-size: 1.1rem; 
            font-weight: bold;
            transition: background 0.2s, color 0.2s;
            display: inline-block;
        }
        .btn:hover { background: rgba(180, 83, 9, 0.15); color: #92400e; }

        .pachamama-footer-motif {
            margin: 40px auto 20px auto;
            max-width: 380px;
            background-color: #e7e2d5;
            border: 1px solid rgba(180, 83, 9, 0.15);
            border-radius: 12px;
            padding: 20px;
            text-align: center;
        }
        .pachamama-footer-motif svg {
            width: 56px;
            height: 56px;
            margin-bottom: 8px;
            filter: drop-shadow(0 2px 4px rgba(0,0,0,0.1));
        }
        .pachamama-footer-motif p {
            color: #57534e;
            font-size: 0.85rem;
            margin: 0;
            letter-spacing: 1px;
            text-transform: uppercase;
        }
    </style>
</head>
<body>
    <div class="content-wrap">
        <h1>More Projects</h1>
        <p class="subtitle">Applying the tribe's approach across different initiatives</p>
        
        <div class="coming-soon-box">
            <h2>Coming Soon</h2>
            <p>This space is dedicated to showcasing auxiliary initiatives, collaborative community efforts, and creative experiments rooted in the tribe's approach.</p>
        </div>

        <a href="/" class="btn">← Back to Main Hub</a>
    </div>

    <div class="pachamama-footer-motif">
        <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
            <path d="M100,15 C135,12 165,30 180,60 C195,90 190,130 170,160 C150,190 110,195 80,185 C50,175 25,150 15,120 C5,90 20,50 50,30 C80,10 85,18 100,15 Z" fill="#d97706" stroke="#b45309" stroke-width="4"/>
            <path d="M100,30 C128,28 152,43 165,68 C178,93 174,124 158,148 C142,172 108,177 82,168 C56,159 36,137 28,110 C20,83 32,54 54,39 C76,24 85,32 100,30 Z" fill="#b48a58"/>
            <path d="M100,100 Q120,65 140,75 Q160,85 135,115 Z" fill="#f4f1ea" opacity="0.9"/>
            <path d="M100,100 Q140,95 150,120 Q160,145 130,145 Z" fill="#f4f1ea" opacity="0.9"/>
            <path d="M100,100 Q130,135 110,155 Q90,175 75,145 Z" fill="#f4f1ea" opacity="0.9"/>
            <path d="M100,100 Q80,155 60,140 Q40,125 70,110 Z" fill="#f4f1ea" opacity="0.9"/>
            <path d="M100,100 Q55,115 45,90 Q35,65 65,70 Z" fill="#f4f1ea" opacity="0.9"/>
            <path d="M100,100 Q70,65 90,45 Q110,25 115,70 Z" fill="#f4f1ea" opacity="0.9"/>
            <circle cx="100" cy="100" r="14" fill="#d97706"/>
            <circle cx="100" cy="100" r="6" fill="#f4f1ea"/>
        </svg>
        <p>Initiatives & Collaborations</p>
    </div>
</body>
</html>
HTML

# 3. Create New Entries page (Clean Off-White / Paper)
cat << 'HTML' > public/entries/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Entries — The New Jungle Tribe</title>
    <style>
        body { 
            background-color: #fbf9f5; 
            color: #1f2937; 
            font-family: sans-serif; 
            padding: 40px 20px; 
            max-width: 800px; 
            margin: auto; 
            text-align: center;
            display: flex;
            flex-direction: column;
            min-height: 90vh;
            justify-content: space-between;
        }
        .content-wrap {
            margin: auto;
            padding: 40px 20px;
            width: 100%;
            box-sizing: border-box;
        }
        h1 { color: #111827; font-size: 3rem; margin-bottom: 10px; }
        .subtitle { color: #4b5563; font-size: 1.25rem; margin-bottom: 40px; }
        
        .blog-feed {
            text-align: left;
            display: flex;
            flex-direction: column;
            gap: 20px;
            margin-bottom: 40px;
        }
        .post-card {
            background-color: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.02);
            transition: border-color 0.2s, box-shadow 0.2s;
        }
        .post-card:hover {
            border-color: #d1d5db;
            box-shadow: 0 4px 12px rgba(0,0,0,0.04);
        }
        .post-date {
            font-size: 0.85rem;
            color: #6b7280;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 6px;
        }
        .post-card h3 {
            color: #1f2937;
            font-size: 1.4rem;
            margin-top: 0;
            margin-bottom: 10px;
        }
        .post-card p {
            color: #4b5563;
            font-size: 1.05rem;
            line-height: 1.5;
            margin: 0 0 15px 0;
        }
        .post-link {
            color: #059669;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.95rem;
        }
        .post-link:hover { text-decoration: underline; }

        .btn { 
            background: #f3f4f6; 
            color: #374151; 
            padding: 12px 24px; 
            border-radius: 8px; 
            border: 1px solid #d1d5db; 
            text-decoration: none; 
            font-size: 1.05rem; 
            font-weight: bold;
            transition: background 0.2s;
            display: inline-block;
        }
        .btn:hover { background: #e5e7eb; color: #111827; }

        .pachamama-footer-motif {
            margin: 40px auto 20px auto;
            max-width: 380px;
            background-color: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 20px;
            text-align: center;
        }
        .pachamama-footer-motif svg {
            width: 52px;
            height: 52px;
            margin-bottom: 8px;
            filter: drop-shadow(0 2px 3px rgba(0,0,0,0.05));
        }
        .pachamama-footer-motif p {
            color: #4b5563;
            font-size: 0.85rem;
            margin: 0;
            letter-spacing: 1px;
            text-transform: uppercase;
        }
    </style>
</head>
<body>
    <div class="content-wrap">
        <h1>New Entries</h1>
        <p class="subtitle">Field notes, updates, ideas and journal logs from members of the tribe</p>
        
        <div class="blog-feed">
            <div class="post-card">
                <div class="post-date">August 2026</div>
                <h3>Cultivating Space & Mindful Integration</h3>
                <p>Reflections on balancing physical stewardship of the land with internal somatic alignment and daily practice.</p>
                <a href="#" class="post-link">Read Entry →</a>
            </div>
            <div class="post-card">
                <div class="post-date">July 2026</div>
                <h3>Ethnobotanical Notes: Germination & Growth</h3>
                <p>Tracking early root development timelines and exploring sustainable soil mixes for our growing plant spaces.</p>
                <a href="#" class="post-link">Read Entry →</a>
            </div>
        </div>

        <a href="/" class="btn">← Back to Main Hub</a>
    </div>

    <div class="pachamama-footer-motif">
        <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
            <path d="M100,15 C135,12 165,30 180,60 C195,90 190,130 170,160 C150,190 110,195 80,185 C50,175 25,150 15,120 C5,90 20,50 50,30 C80,10 85,18 100,15 Z" fill="#059669" stroke="#047857" stroke-width="4"/>
            <path d="M100,30 C128,28 152,43 165,68 C178,93 174,124 158,148 C142,172 108,177 82,168 C56,159 36,137 28,110 C20,83 32,54 54,39 C76,24 85,32 100,30 Z" fill="#34d399"/>
            <path d="M100,100 Q120,65 140,75 Q160,85 135,115 Z" fill="#fbf9f5" opacity="0.9"/>
            <path d="M100,100 Q140,95 150,120 Q160,145 130,145 Z" fill="#fbf9f5" opacity="0.9"/>
            <path d="M100,100 Q130,135 110,155 Q90,175 75,145 Z" fill="#fbf9f5" opacity="0.9"/>
            <path d="M100,100 Q80,155 60,140 Q40,125 70,110 Z" fill="#fbf9f5" opacity="0.9"/>
            <path d="M100,100 Q55,115 45,90 Q35,65 65,70 Z" fill="#fbf9f5" opacity="0.9"/>
            <path d="M100,100 Q70,65 90,45 Q110,25 115,70 Z" fill="#fbf9f5" opacity="0.9"/>
            <circle cx="100" cy="100" r="14" fill="#059669"/>
            <circle cx="100" cy="100" r="6" fill="#fbf9f5"/>
        </svg>
        <p>Journal & Field Notes</p>
    </div>
</body>
</html>
HTML

# 4. Create Philosophy page with Immersive Dark / Deep Core palette
cat << 'HTML' > public/philosophy/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Tribe's Philosophy — The New Jungle Tribe</title>
    <style>
        body { 
            background-color: #0b1118; /* Immersive Deep Slate / Obsidian Dark Base */
            color: #d1d5db; /* Muted Light Gray/Silver Text */
            font-family: sans-serif; 
            padding: 40px 20px; 
            max-width: 850px; 
            margin: auto; 
            text-align: center;
            display: flex;
            flex-direction: column;
            min-height: 90vh;
            justify-content: space-between;
        }
        .content-wrap {
            margin: auto;
            padding: 40px 20px;
            width: 100%;
            box-sizing: border-box;
            text-align: left;
        }
        h1 { color: #f3f4f6; font-size: 3rem; margin-bottom: 10px; text-align: center; }
        .subtitle { color: #9ca3af; font-size: 1.25rem; margin-bottom: 40px; text-align: center; }
        
        .manifesto-box {
            background-color: #151c24; /* Dark Card Surface */
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 16px;
            padding: 35px 30px;
            margin-bottom: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
        }
        .manifesto-box h2 {
            color: #34d399; /* Deep Jungle Emerald / Amber Accent */
            font-size: 1.6rem;
            margin-top: 0;
            margin-bottom: 15px;
            letter-spacing: 0.5px;
        }
        .manifesto-box p {
            color: #9ca3af;
            font-size: 1.05rem;
            line-height: 1.7;
            margin: 0 0 15px 0;
        }
        .manifesto-box p:last-child {
            margin-bottom: 0;
        }

        .nav-center {
            text-align: center;
            margin-top: 20px;
        }

        .btn { 
            background: rgba(52, 211, 153, 0.08); 
            color: #34d399; 
            padding: 12px 24px; 
            border-radius: 8px; 
            border: 1px solid rgba(52, 211, 153, 0.25); 
            text-decoration: none; 
            font-size: 1.05rem; 
            font-weight: bold;
            transition: background 0.2s, color 0.2s;
            display: inline-block;
        }
        .btn:hover { background: rgba(52, 211, 153, 0.15); color: #6ee7b7; }

        .pachamama-footer-motif {
            margin: 40px auto 20px auto;
            max-width: 380px;
            background-color: #151c24;
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 12px;
            padding: 20px;
            text-align: center;
        }
        .pachamama-footer-motif svg {
            width: 52px;
            height: 52px;
            margin-bottom: 8px;
            filter: drop-shadow(0 2px 4px rgba(0,0,0,0.4));
        }
        .pachamama-footer-motif p {
            color: #9ca3af;
            font-size: 0.85rem;
            margin: 0;
            letter-spacing: 1px;
            text-transform: uppercase;
        }
    </style>
</head>
<body>
    <div class="content-wrap">
        <h1>The Tribe's Philosophy</h1>
        <p class="subtitle">Core values, foundational principles, and the internal map</p>
        
        <div class="manifesto-box">
            <h2>I. The Internal Pressure & Sovereignty</h2>
            <p>We recognize that true clarity requires maintaining an unbroken container. By honoring physical discipline, internal restraint, and deep somatic grounding, we protect the inner pressure tank necessary for sustainable creation and focus.</p>
        </div>

        <div class="manifesto-box">
            <h2>II. Ethnobotanical Stewardship</h2>
            <p>Our path is intertwined with the intelligence of the Amazon. We approach master plant medicines and the surrounding environment not as commodities, but as ancient teachers demanding absolute reciprocity, respect, and stewardship.</p>
        </div>

        <div class="manifesto-box">
            <h2>III. Circular Harmony</h2>
            <p>Rejecting linear extraction, we build systems that mirror natural ecosystems—where waste feeds new growth, minimal footprints preserve wild spaces, and technology serves consciousness rather than fragmenting it.</p>
        </div>

        <div class="nav-center">
            <a href="/" class="btn">← Back to Main Hub</a>
        </div>
    </div>

    <div class="pachamama-footer-motif">
        <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
            <path d="M100,15 C135,12 165,30 180,60 C195,90 190,130 170,160 C150,190 110,195 80,185 C50,175 25,150 15,120 C5,90 20,50 50,30 C80,10 85,18 100,15 Z" fill="#34d399" stroke="#059669" stroke-width="4"/>
            <path d="M100,30 C128,28 152,43 165,68 C178,93 174,124 158,148 C142,172 108,177 82,168 C56,159 36,137 28,110 C20,83 32,54 54,39 C76,24 85,32 100,30 Z" fill="#059669"/>
            <path d="M100,100 Q120,65 140,75 Q160,85 135,115 Z" fill="#0b1118" opacity="0.9"/>
            <path d="M100,100 Q140,95 150,120 Q160,145 130,145 Z" fill="#0b1118" opacity="0.9"/>
            <path d="M100,100 Q130,135 110,155 Q90,175 75,145 Z" fill="#0b1118" opacity="0.9"/>
            <path d="M100,100 Q80,155 60,140 Q40,125 70,110 Z" fill="#0b1118" opacity="0.9"/>
            <path d="M100,100 Q55,115 45,90 Q35,65 65,70 Z" fill="#0b1118" opacity="0.9"/>
            <path d="M100,100 Q70,65 90,45 Q110,25 115,70 Z" fill="#0b1118" opacity="0.9"/>
            <circle cx="100" cy="100" r="14" fill="#34d399"/>
            <circle cx="100" cy="100" r="6" fill="#0b1118"/>
        </svg>
        <p>Core Values & Principles</p>
    </div>
</body>
</html>
HTML

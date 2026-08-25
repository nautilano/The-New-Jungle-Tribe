#!/bin/bash

mkdir -p public

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
        }
        .info-card h3 { color: #4ade80; margin-top: 0; font-size: 1.2rem; margin-bottom: 8px; }
        .info-card p { color: #d1d5db; font-size: 0.95rem; margin: 0 0 15px 0; }
        .card-link { color: #4ade80; text-decoration: none; font-size: 0.95rem; font-weight: 500; align-self: flex-start; }
        .card-link:hover { text-decoration: underline; }

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
        <div class="info-card">
            <div>
                <h3>El Brujito 420</h3>
                <p>Observations, ethnobotany, and plant wisdom.</p>
            </div>
        </div>
        <div class="info-card">
            <div>
                <h3>Casa Lothlorien</h3>
                <p>Land updates, organic apothecary, and cacao practice.</p>
            </div>
        </div>
        <div class="info-card">
            <div>
                <h3>Yugen Sanctuary</h3>
                <p>Amazonian healing space and master plant medicine.</p>
            </div>
        </div>
        <div class="info-card">
            <div>
                <h3>More Projects</h3>
                <p>Applying the tribe's approach across different fields and initiatives.</p>
            </div>
            <a href="/projects/" class="card-link">Explore →</a>
        </div>
    </div>

    <!-- Embedded Videos Section (The Ayahuasca Music Trilogy) -->
    <div class="video-section">
        <h2>The Ayahuasca Music Trilogy</h2>
        <div class="video-grid">
            
            <!-- Album I -->
            <div class="album-card">
                <div class="video-wrapper">
                    <iframe src="https://www.youtube.com/embed/I0Y52bgQNKI" title="Album I: The Calling" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="album-info">
                    <h3>Album I: The Calling</h3>
                    <a href="https://youtu.be/I0Y52bgQNKI" target="_blank" class="listen-link">Listen on YouTube →</a>
                </div>
            </div>

            <!-- Album II -->
            <div class="album-card">
                <div class="video-wrapper">
                    <iframe src="https://www.youtube.com/embed/9y_reivRgT4" title="Album II: The Immersion" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="album-info">
                    <h3>Album II: The Immersion</h3>
                    <a href="https://youtu.be/9y_reivRgT4" target="_blank" class="listen-link">Listen on YouTube →</a>
                </div>
            </div>

            <!-- Album III -->
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

    <!-- About Section Below Videos -->
    <div id="about" class="lower-section">
        <h2>About The New Jungle Tribe</h2>
        <p>Rooted deep in the heart of the Amazon basin in Iquitos, Peru, The New Jungle Tribe serves as a digital and physical sanctuary bridging ancient ethnobotanical wisdom, master plant medicine, and global consciousness.</p>
    </div>

    <!-- Resources Section Below Videos -->
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

    <!-- Ayahuasca Vine Cross-Section Motif Card -->
    <div class="pachamama-footer-motif">
        <!-- Custom SVG matching the multi-lobed woody cross-section pattern -->
        <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
            <!-- Outer bark layer -->
            <path d="M100,15 C135,12 165,30 180,60 C195,90 190,130 170,160 C150,190 110,195 80,185 C50,175 25,150 15,120 C5,90 20,50 50,30 C80,10 85,18 100,15 Z" fill="#b48a58" stroke="#d4a373" stroke-width="4"/>
            <!-- Inner woody ring core -->
            <path d="M100,30 C128,28 152,43 165,68 C178,93 174,124 158,148 C142,172 108,177 82,168 C56,159 36,137 28,110 C20,83 32,54 54,39 C76,24 85,32 100,30 Z" fill="#d4a373"/>
            <!-- 6 Petal-like vascular rays resembling the cross-section structure -->
            <path d="M100,100 Q120,65 140,75 Q160,85 135,115 Z" fill="#fefae0" opacity="0.9"/>
            <path d="M100,100 Q140,95 150,120 Q160,145 130,145 Z" fill="#fefae0" opacity="0.9"/>
            <path d="M100,100 Q130,135 110,155 Q90,175 75,145 Z" fill="#fefae0" opacity="0.9"/>
            <path d="M100,100 Q80,155 60,140 Q40,125 70,110 Z" fill="#fefae0" opacity="0.9"/>
            <path d="M100,100 Q55,115 45,90 Q35,65 65,70 Z" fill="#fefae0" opacity="0.9"/>
            <path d="M100,100 Q70,65 90,45 Q110,25 115,70 Z" fill="#fefae0" opacity="0.9"/>
            <!-- Center pith ring -->
            <circle cx="100" cy="100" r="14" fill="#b48a58"/>
            <circle cx="100" cy="100" r="6" fill="#432818"/>
        </svg>
        <p>Honoring Pachamama • The Amazon Basin</p>
    </div>

    <!-- Social Links Footer -->
    <div class="footer">
        <a href="https://discord.gg/YOUR_INVITE" target="_blank" class="social-link">Discord</a>
        <a href="https://youtube.com/@YOUR_CHANNEL" target="_blank" class="social-link">YouTube</a>
        <a href="https://instagram.com/YOUR_HANDLE" target="_blank" class="social-link">Instagram</a>
    </div>

</body>
</html>
HTML

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Washiez Radar</title>
  <link href="https://fonts.googleapis.com/css2?family=Syne:wght@700;800&family=Figtree:wght@300;400;500;600&display=swap" rel="stylesheet"/>
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --bg: #0c0e14;
      --card: #191d29;
      --border: rgba(255,255,255,0.07);
      --accent: #4fd1c5;
      --accent2: #38bdf8;
      --text: #e8eaf0;
      --muted: #7a7f96;
      --radius: 18px;
    }
 
    body {
      background: var(--bg);
      color: var(--text);
      font-family: 'Figtree', sans-serif;
      font-weight: 400;
      min-height: 100vh;
      overflow-x: hidden;
    }
 
    body::before {
      content: '';
      position: fixed;
      top: -200px; left: 50%;
      transform: translateX(-50%);
      width: 900px; height: 600px;
      background: radial-gradient(ellipse at center, rgba(79,209,197,0.12) 0%, transparent 70%);
      pointer-events: none;
      z-index: 0;
    }
 
    .page {
      position: relative;
      z-index: 1;
      max-width: 860px;
      margin: 0 auto;
      padding: 60px 24px 80px;
    }
 
    .badge {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      background: rgba(79,209,197,0.1);
      border: 1px solid rgba(79,209,197,0.25);
      color: var(--accent);
      font-size: 12px;
      font-weight: 600;
      letter-spacing: 0.08em;
      text-transform: uppercase;
      padding: 6px 14px;
      border-radius: 999px;
      margin-bottom: 28px;
      animation: fadeUp 0.5s ease both;
    }
    .badge-dot {
      width: 7px; height: 7px;
      background: var(--accent);
      border-radius: 50%;
      animation: pulse 2s ease infinite;
    }
 
    .hero { animation: fadeUp 0.6s ease both; }
    .hero h1 {
      font-family: 'Syne', sans-serif;
      font-size: clamp(48px, 8vw, 78px);
      font-weight: 800;
      line-height: 1;
      letter-spacing: -0.03em;
      background: linear-gradient(135deg, #ffffff 0%, var(--accent) 60%, var(--accent2) 100%);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      margin-bottom: 20px;
    }
    .hero p {
      font-size: 17px;
      color: var(--muted);
      max-width: 480px;
      line-height: 1.7;
      margin-bottom: 32px;
    }
 
    /* Copy Box */
    .copy-block {
      margin-bottom: 48px;
      animation: fadeUp 0.65s ease both;
    }
    .copy-label {
      font-size: 11px;
      font-weight: 600;
      letter-spacing: 0.1em;
      text-transform: uppercase;
      color: var(--muted);
      margin-bottom: 10px;
    }
    .copy-box {
      display: flex;
      align-items: center;
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: 14px;
      overflow: hidden;
      transition: border-color 0.2s;
    }
    .copy-box:hover { border-color: rgba(79,209,197,0.35); }
    .copy-icon {
      padding: 0 16px;
      color: var(--accent);
      opacity: 0.6;
      flex-shrink: 0;
      display: flex;
      align-items: center;
    }
    .copy-code {
      flex: 1;
      background: transparent;
      border: none;
      outline: none;
      color: var(--accent);
      font-family: 'Courier New', monospace;
      font-size: 13.5px;
      padding: 16px 0;
      cursor: text;
      min-width: 0;
    }
    .copy-btn {
      background: rgba(79,209,197,0.1);
      border: none;
      border-left: 1px solid var(--border);
      color: var(--accent);
      font-family: 'Figtree', sans-serif;
      font-size: 13px;
      font-weight: 600;
      padding: 16px 22px;
      cursor: pointer;
      display: flex;
      align-items: center;
      gap: 7px;
      transition: background 0.15s;
      white-space: nowrap;
      flex-shrink: 0;
    }
    .copy-btn:hover { background: rgba(79,209,197,0.2); }
    .copy-btn.copied { background: rgba(79,209,197,0.2); color: #fff; }
 
    .creator {
      display: inline-flex;
      align-items: center;
      gap: 12px;
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: 999px;
      padding: 10px 20px 10px 10px;
      margin-bottom: 52px;
      font-size: 14px;
      color: var(--muted);
      animation: fadeUp 0.7s ease both;
    }
    .creator-avatar {
      width: 36px; height: 36px;
      border-radius: 50%;
      background: linear-gradient(135deg, var(--accent), var(--accent2));
      display: flex; align-items: center; justify-content: center;
      font-family: 'Syne', sans-serif;
      font-weight: 800;
      font-size: 14px;
      color: #0c0e14;
    }
    .creator span b { color: var(--text); font-weight: 500; }
 
    .preview {
      width: 100%;
      aspect-ratio: 16/9;
      border-radius: var(--radius);
      background: var(--card);
      border: 1px solid var(--border);
      overflow: hidden;
      margin-bottom: 60px;
      position: relative;
      animation: fadeUp 0.75s ease both;
    }
    .preview img { width: 100%; height: 100%; object-fit: cover; display: block; }
    .preview-placeholder {
      position: absolute; inset: 0;
      display: flex; flex-direction: column;
      align-items: center; justify-content: center;
      gap: 10px; color: var(--muted); font-size: 14px;
    }
    .preview-placeholder svg { opacity: 0.3; }
 
    .section-label {
      font-family: 'Syne', sans-serif;
      font-size: 11px;
      font-weight: 700;
      letter-spacing: 0.14em;
      text-transform: uppercase;
      color: var(--accent);
      margin-bottom: 20px;
    }
 
    .features {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
      gap: 14px;
      margin-bottom: 60px;
      animation: fadeUp 0.85s ease both;
    }
    .feat {
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: var(--radius);
      padding: 22px 22px 20px;
      transition: border-color 0.2s, transform 0.2s;
    }
    .feat:hover { border-color: rgba(79,209,197,0.35); transform: translateY(-3px); }
    .feat-icon {
      width: 38px; height: 38px;
      border-radius: 10px;
      background: rgba(79,209,197,0.1);
      display: flex; align-items: center; justify-content: center;
      font-size: 18px; margin-bottom: 14px;
    }
    .feat h3 {
      font-family: 'Syne', sans-serif;
      font-size: 14px; font-weight: 700;
      margin-bottom: 6px; color: var(--text);
    }
    .feat p { font-size: 13px; color: var(--muted); line-height: 1.55; }
 
    .screenshots {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 12px;
      margin-bottom: 60px;
      animation: fadeUp 0.9s ease both;
    }
    .screenshot {
      aspect-ratio: 4/3;
      border-radius: 12px;
      background: var(--card);
      border: 1px solid var(--border);
      overflow: hidden;
    }
    .screenshot img { width: 100%; height: 100%; object-fit: cover; display: block; }
    .screenshot-ph {
      width: 100%; height: 100%;
      display: flex; align-items: center; justify-content: center;
      color: var(--muted); font-size: 12px; opacity: 0.5;
    }
 
    footer {
      margin-top: 52px;
      text-align: center;
      font-size: 12px;
      color: var(--muted);
      border-top: 1px solid var(--border);
      padding-top: 28px;
    }
    footer a { color: var(--accent); text-decoration: none; }
 
    @keyframes fadeUp {
      from { opacity: 0; transform: translateY(22px); }
      to   { opacity: 1; transform: translateY(0); }
    }
    @keyframes pulse {
      0%, 100% { opacity: 1; transform: scale(1); }
      50%       { opacity: 0.5; transform: scale(0.75); }
    }
 
    @media (max-width: 540px) {
      .screenshots { grid-template-columns: 1fr 1fr; }
      .copy-code { font-size: 12px; }
    }
  </style>
</head>
<body>
<div class="page">
 
  <div class="badge"><span class="badge-dot"></span> Roblox Script · Washiez</div>
 
  <div class="hero">
    <h1>Washiez<br>Radar</h1>
    <p>The all-in-one script for Washiez. Customize your identity, control your car, scan staff, and move anywhere — instantly.</p>
  </div>
 
  <!-- Copy Box -->
  <div class="copy-block">
    <div class="copy-label">Script · paste into your executor</div>
    <div class="copy-box">
      <div class="copy-icon">
        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/>
        </svg>
      </div>
      <input class="copy-code" id="scriptInput" type="text" value='loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/ab37388926615c1ac75531583d3b8798.lua"))()
' readonly />
      <button class="copy-btn" id="copyBtn" onclick="copyScript()">
        <svg id="copyIcon" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <rect x="9" y="9" width="13" height="13" rx="2"/><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"/>
        </svg>
        <span id="copyText">Copy</span>
      </button>
    </div>
  </div>
 
  <div class="creator">
    <div class="creator-avatar">C</div>
    <span>Created by <b>catnature</b></span>
  </div>  

  <div class="creator">
    <div class="creator-avatar">A</div>
    <span>Main developer <b>aimbotter</b></span>
  </div>
 
  <div class="preview">
    <img src="https://i.imgur.com/6cahfpj.png" alt="Washiez Radar preview"
      onerror="this.style.display='none'; document.getElementById('heroFallback').style.display='flex'">
    <div class="preview-placeholder" id="heroFallback" style="display:none">
      <svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
        <rect x="3" y="3" width="18" height="18" rx="3"/><circle cx="8.5" cy="8.5" r="1.5"/>
        <path d="M21 15l-5-5L5 21"/>
      </svg>
      <span>Main image</span>
    </div>
  </div>
 
  <div class="section-label">Features</div>
  <div class="features">
    <div class="feat">
      <div class="feat-icon">✏️</div>
      <h3>Custom Name & Rank</h3>
      <p>Change how you appear to others. Set any name and rank tag you want, instantly.</p>
    </div>
    <div class="feat">
      <div class="feat-icon">🚗</div>
      <h3>Noclip & Unfreeze</h3>
      <p>Pass through walls and unfreeze your vehicle whenever it gets stuck. No hassle.</p>
    </div>
    <div class="feat">
      <div class="feat-icon">🔍</div>
      <h3>Staff Scanner</h3>
      <p>Detect staff members in the server with one click — then hop to a fresh one if needed.</p>
    </div>
    <div class="feat">
      <div class="feat-icon">📡</div>
      <h3>Server Hop</h3>
      <p>Jump servers fast. Find the right session without manually rejoining every time.</p>
    </div>
    <div class="feat">
      <div class="feat-icon">📍</div>
      <h3>Location Teleport</h3>
      <p>Teleport to all key Washiez spots in a tap. No running, no wasting time.</p>
    </div>
    <div class="feat">
      <div class="feat-icon">⚡</div>
      <h3>Speed Boost</h3>
      <p>Crank up your car's speed far beyond the default. Adjust it to whatever you need.</p>
    </div>
  </div>
 
  <div class="section-label">Screenshots</div>
  <div class="screenshots">
    <div class="screenshot">
      <img src="https://i.imgur.com/PTdytbA.png" alt="Screenshot 1"
        onerror="this.parentElement.innerHTML='<div class=screenshot-ph>Image 1</div>'">
    </div>
    <div class="screenshot">
      <img src="https://i.imgur.com/mthvlvY.png" alt="Screenshot 2"
        onerror="this.parentElement.innerHTML='<div class=screenshot-ph>Image 2</div>'">
    </div>
    <div class="screenshot">
      <img src="https://i.imgur.com/sDYa7wi.png" alt="Screenshot 3"
        onerror="this.parentElement.innerHTML='<div class=screenshot-ph>Image 3</div>'">
    </div>
  </div>
 
  <footer>
    <p>Washiez Radar &nbsp;·&nbsp; By Catnature &nbsp;·&nbsp; For use in Washiez on Roblox</p>
  </footer>
 
</div>
 
<script>
  function copyScript() {
    const input = document.getElementById('scriptInput');
    const btn = document.getElementById('copyBtn');
    const text = document.getElementById('copyText');
    const icon = document.getElementById('copyIcon');
 
    navigator.clipboard.writeText(input.value).then(() => {
      btn.classList.add('copied');
      text.textContent = 'Copied!';
      icon.innerHTML = '<polyline points="20 6 9 17 4 12" stroke="currentColor" stroke-width="2.5" fill="none"/>';
      setTimeout(() => {
        btn.classList.remove('copied');
        text.textContent = 'Copy';
        icon.innerHTML = '<rect x="9" y="9" width="13" height="13" rx="2"/><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"/>';
      }, 2000);
    });
  }
</script>
</body>
</html>
</html>

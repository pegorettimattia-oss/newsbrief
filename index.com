<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NewsBrief Finance | Calcolatori & Utility Finanziarie Gratuite</title>
    <meta name="description" content="Pianifica i tuoi investimenti, calcola il PAC, l'Asset Allocation e gestisci il tuo budget con NewsBrief Finance.">
    <style>
        :root {
            --bg: #0f172a;
            --card: #1e293b;
            --accent: #38bdf8;
            --text: #f8fafc;
            --muted: #94a3b8;
            --green: #22c55e;
            --border: #334155;
            --gold: #f59e0b;
        }

        * { box-sizing: border-box; margin: 0; padding: 0; font-family: system-ui, -apple-system, sans-serif; }
        body { background: var(--bg); color: var(--text); padding-bottom: 40px; }
        
        header { background: var(--card); padding: 14px 20px; display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid var(--border); position: sticky; top: 0; z-index: 100; }
        .logo-main { font-size: 1.3rem; font-weight: 800; color: var(--text); }
        .logo-sub { font-size: 0.75rem; color: var(--accent); font-weight: 600; text-transform: uppercase; letter-spacing: 1px; }
        
        .btn-pro-nav { background: linear-gradient(135deg, #f59e0b, #d97706); color: #000; font-weight: 800; font-size: 0.75rem; padding: 8px 16px; border-radius: 20px; border: none; cursor: pointer; text-decoration: none; display: inline-flex; align-items: center; gap: 4px; }

        .container { max-width: 800px; margin: 0 auto; padding: 16px; }

        /* HERO HEADER */
        .hero-box { text-align: center; padding: 25px 15px; margin-bottom: 10px; border-bottom: 1px solid var(--border); }
        .hero-title { font-size: 1.6rem; font-weight: 800; margin-bottom: 8px; background: linear-gradient(135deg, #fff, var(--accent)); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }
        .hero-sub { font-size: 0.9rem; color: var(--muted); max-width: 600px; margin: 0 auto 16px auto; }
        .badges-row { display: flex; justify-content: center; gap: 15px; flex-wrap: wrap; font-size: 0.75rem; color: var(--accent); font-weight: 600; }

        /* BOX PUBBLICITARI / PARTNER */
        .ad-box { background: rgba(30, 41, 59, 0.5); border: 1px dashed var(--border); padding: 16px; border-radius: 10px; text-align: center; margin: 20px 0; position: relative; }
        .ad-label { position: absolute; top: -9px; left: 15px; background: var(--bg); color: var(--muted); font-size: 0.65rem; padding: 0 8px; text-transform: uppercase; letter-spacing: 1px; border: 1px solid var(--border); border-radius: 4px; }
        .ad-content { font-size: 0.85rem; color: var(--muted); margin-bottom: 8px; }
        .btn-ad-action { display: inline-block; background: transparent; border: 1px solid var(--accent); color: var(--accent); padding: 6px 14px; border-radius: 6px; text-decoration: none; font-weight: 600; font-size: 0.8rem; cursor: pointer; }
        .btn-ad-action:hover { background: var(--accent); color: var(--bg); }

        .section-title { font-size: 1.1rem; margin: 24px 0 12px 0; color: var(--accent); font-weight: 700; display: flex; justify-content: space-between; align-items: center; }

        .tool-box { background: var(--card); border: 1px solid var(--border); padding: 20px; border-radius: 12px; margin-bottom: 20px; }
        .field-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; }
        @media (max-width: 500px) { .field-grid { grid-template-columns: 1fr; } }
        
        .field { margin-bottom: 12px; }
        .field label { display: block; font-size: 0.8rem; color: var(--muted); margin-bottom: 5px; }
        .field input, .field select { width: 100%; padding: 10px; background: #0f172a; border: 1px solid var(--border); color: #fff; border-radius: 6px; font-size: 0.9rem; }
        
        .btn { background: var(--accent); color: #0f172a; border: none; padding: 12px; width: 100%; border-radius: 6px; font-weight: bold; cursor: pointer; font-size: 0.9rem; margin-top: 6px; }
        .res-box { margin-top: 14px; background: #0284c715; padding: 14px; border-radius: 8px; border: 1px solid #0284c730; font-size: 0.9rem; }
        
        .tool-guide { font-size: 0.78rem; color: var(--muted); margin-top: 12px; padding-top: 10px; border-top: 1px dashed var(--border); line-height: 1.4; }

        .grid-3 { display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 8px; margin-top: 10px; }
        .stat-card { background: #0f172a; padding: 10px; border-radius: 6px; border: 1px solid var(--border); text-align: center; }
        .stat-card span { display: block; color: var(--muted); font-size: 0.7rem; margin-bottom: 4px; }
        .stat-card strong { font-size: 0.95rem; }

        .allocation-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 8px; margin-top: 10px; }
        .alloc-card { background: #0f172a; padding: 10px; border-radius: 6px; border: 1px solid var(--border); }
        .alloc-card span { display: block; color: var(--muted); font-size: 0.75rem; }
        .alloc-card strong { font-size: 1rem; color: var(--accent); }

        /* Stile Box PRO con doppio pricing */
        .pro-card { background: linear-gradient(135deg, #1e293b, #0f172a); border: 2px solid var(--gold); padding: 20px; border-radius: 12px; margin-bottom: 20px; position: relative; overflow: hidden; }
        .pro-badge { background: var(--gold); color: #000; font-size: 0.7rem; font-weight: 800; padding: 3px 8px; border-radius: 4px; text-transform: uppercase; display: inline-block; margin-bottom: 8px; }
        .pro-locked { filter: blur(4px); pointer-events: none; user-select: none; transition: 0.3s; }
        
        .pricing-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; margin-top: 14px; text-align: left; }
        @media (max-width: 550px) { .pricing-grid { grid-template-columns: 1fr; } }
        
        .price-box { background: #0f172a; border: 1px solid var(--border); padding: 14px; border-radius: 8px; display: flex; flex-direction: column; justify-content: space-between; position: relative; }
        .price-box.featured { border-color: var(--gold); background: #1e293b; }
        .featured-tag { position: absolute; top: -10px; right: 10px; background: var(--gold); color: #000; font-size: 0.65rem; font-weight: bold; padding: 2px 6px; border-radius: 4px; }
        
        .btn-unlock { background: linear-gradient(135deg, #f59e0b, #d97706); color: #000; border: none; padding: 10px; border-radius: 6px; font-weight: bold; cursor: pointer; font-size: 0.85rem; margin-top: 10px; width: 100%; text-align: center; }
        .btn-secondary { background: transparent; color: var(--text); border: 1px solid var(--border); padding: 10px; border-radius: 6px; font-weight: bold; cursor: pointer; font-size: 0.85rem; margin-top: 10px; width: 100%; text-align: center; }

        .news-item { background: var(--card); border: 1px solid var(--border); padding: 12px 14px; border-radius: 8px; margin-bottom: 10px; }
        .news-item a { color: var(--text); text-decoration: none; font-weight: 600; font-size: 0.92rem; display: block; margin-bottom: 4px; }
        .news-item a:hover { color: var(--accent); }
        .news-time { font-size: 0.72rem; color: var(--accent); }

        footer { text-align: center; padding: 30px 15px 10px 15px; font-size: 0.75rem; color: var(--muted); border-top: 1px solid var(--border); margin-top: 40px; }
    </style>
</head>
<body>

    <header>
        <div>
            <div class="logo-main">NewsBrief</div>
            <div class="logo-sub">Finance Hub</div>
        </div>
        <a href="#proSection" class="btn-pro-nav">⚡ AREA PRO</a>
    </header>

    <div class="container">
        
        <!-- HERO BANNER INTRODUTTIVO -->
        <div class="hero-box">
            <h1 class="hero-title">Utility Finanziarie & Calcolatori Strategici</h1>
            <p class="hero-sub">Pianifica i tuoi risparmi, simula l'interesse composto ed elabora il tuo budget personale in pochi secondi.</p>
            <div class="badges-row">
                <span>🔒 100% Calcolo Client-Side</span>
                <span>⚡ Calcolatori Gratuiti</span>
                <span>📊 Risultati Istantanei</span>
            </div>
        </div>

        <!-- 1. SPAZIO PUBBLICITARIO SUPERIORE (In-feed Banner) -->
        <div class="ad-box">
            <div class="ad-label">Spazio Sponsorizzato / Partner</div>
            <p class="ad-content">Vuoi far fruttare la liquidità accumulata? Scopri i migliori conti deposito e broker selezionati.</p>
            <a href="#" class="btn-ad-action" onclick="alert('Qui andrà il codice AdSense o il link affiliato del broker!')">Scopri di più</a>
        </div>

        <!-- TOOL 1: Simulatore PAC -->
        <div class="section-title">1. Simulatore Risparmio & PAC (Interesse Composto)</div>
        <div class="tool-box">
            <div class="field-grid">
                <div class="field"><label>Capitale Iniziale (€)</label><input type="number" id="cInit" value="1000"></div>
                <div class="field"><label>Versamento Mensile (€)</label><input type="number" id="cMonth" value="150"></div>
                <div class="field"><label>Anni di Investimento</label><input type="number" id="cYears" value="10"></div>
                <div class="field"><label>Rendimento Annuo Stimato (%)</label><input type="number" id="cRate" value="6"></div>
            </div>
            <button class="btn" onclick="runPacCalc()">Calcola Proiezione</button>
            <div class="res-box" id="cRes">Capitale finale stimato: <strong>€ 25.100</strong></div>
            <div class="tool-guide">
                💡 <strong>Come funziona l'Interesse Composto?</strong> I rendimenti generati ogni anno si sommano al capitale versato, generando ulteriori guadagni negli anni successivi. Più lungo è l'orizzonte temporale, maggiore sarà l'effetto leva sui tuoi risparmi.
            </div>
        </div>

        <!-- TOOL 2: Regola Budget 50/30/20 -->
        <div class="section-title">2. Pianificatore Budget Mensile (Regola 50/30/20)</div>
        <div class="tool-box">
            <div class="field">
                <label>Inserisci il tuo Stipendio Netto Mensile (€)</label>
                <input type="number" id="netIncomeInput" value="1600" oninput="calcBudget()">
            </div>
            <div class="grid-3" id="budgetRes">
                <div class="stat-card"><span>50% Bisogni</span><strong style="color:var(--accent);">€ 800</strong></div>
                <div class="stat-card"><span>30% Svaghi</span><strong style="color:var(--gold);">€ 480</strong></div>
                <div class="stat-card"><span>20% Risparmio</span><strong style="color:var(--green);">€ 320</strong></div>
            </div>
            <div class="tool-guide">
                📌 <strong>Guida rapida al Budget:</strong> La regola 50/30/20 suddivide lo stipendio netto in tre categorie principali: 50% per spese fisse e bisogni essenziali (affitto, bollette, spesa), 30% per desideri e tempo libero, e almeno il 20% destinato a risparmi o investimenti.
            </div>
        </div>

        <!-- SEZIONE PRO: Area Abbonati con Decoy Pricing -->
        <div class="section-title" id="proSection">3. Area Riservata PRO (Pianificazione Avanzata)</div>
        <div class="pro-card">
            <div class="pro-badge">Nessun Abbonamento Ricorrente</div>
            <h3 style="font-size: 1.1rem; margin-bottom: 4px;">Calcolatore di Asset Allocation Strategica</h3>
            <p style="font-size: 0.85rem; color: var(--muted); margin-bottom: 12px;">Calcola la suddivisione esatta dei tuoi risparmi tra ETF, azioni, obbligazioni e fondo emergenza.</p>
            
            <div id="proContentContainer">
                <div id="proInputs" class="pro-locked">
                    <div class="field">
                        <label>Capitale Totale da Investire (€)</label>
                        <input type="number" id="totCapital" value="15000" step="500" oninput="calcAllocation()">
                    </div>
                    <div class="field-grid">
                        <div class="field"><label>% ETF Azionari</label><input type="number" id="percEtf" value="70" oninput="calcAllocation()"></div>
                        <div class="field"><label>% Obbligazioni / Conto Deposito</label><input type="number" id="percBonds" value="20" oninput="calcAllocation()"></div>
                        <div class="field"><label>% Azioni Singole / Crypto</label><input type="number" id="percStocks" value="5" oninput="calcAllocation()"></div>
                        <div class="field"><label>% Liquidità / Emergenza</label><input type="number" id="percCash" value="5" oninput="calcAllocation()"></div>
                    </div>
                    <div class="res-box" id="allocRes" style="background:#f59e0b15; border-color:#f59e0b40;">
                        Distribuzione calcolata con successo.
                    </div>
                </div>

                <!-- Box Sblocco con Opzione 30 Giorni vs Lifetime -->
                <div id="proOverlayBox" style="text-align: center; background: rgba(15, 23, 42, 0.9); padding: 18px; border-radius: 8px; border: 1px dashed var(--gold); margin-top: 10px;">
                    <p style="font-weight: 600; font-size: 0.95rem; color: var(--gold);">🔒 Sblocca gli Strumenti Avanzati</p>
                    <p style="font-size: 0.8rem; color: var(--muted); margin-top: 4px;">Scegli la modalità che preferisci, senza alcun rinnovo automatico nascosto.</p>
                    
                    <div class="pricing-grid">
                        <div class="price-box">
                            <div>
                                <div style="font-weight:bold; font-size:0.9rem;">Pass 30 Giorni</div>
                                <div style="font-size:1.3rem; font-weight:800; margin: 4px 0; color:var(--text);">€ 4,99</div>
                                <div style="font-size:0.75rem; color:var(--muted);">Accesso completo a tutti i tool per un mese. Pagamento una tantum.</div>
                            </div>
                            <button class="btn-secondary" onclick="unlockPro('Pass 30 Giorni')">Attiva per 30 Giorni</button>
                        </div>

                        <div class="price-box featured">
                            <div class="featured-tag">PIÙ VENDUTO</div>
                            <div>
                                <div style="font-weight:bold; font-size:0.9rem; color:var(--gold);">Accesso Lifetime</div>
                                <div style="font-size:1.3rem; font-weight:800; margin: 4px 0; color:var(--gold);">€ 9,99</div>
                                <div style="font-size:0.75rem; color:var(--muted);">Accesso per sempre a vita + tutti i futuri template scaricabili.</div>
                            </div>
                            <button class="btn-unlock" onclick="unlockPro('Accesso Lifetime')">Sblocca a Vita (9,99€)</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- TOOL 4: Calcolatore Stipendio Netto -->
        <div class="section-title">4. Calcolatore Stipendio Netto da RAL</div>
        <div class="tool-box">
            <div class="field-grid">
                <div class="field">
                    <label>Stipendio Lordo Annuo (€ RAL)</label>
                    <input type="number" id="ralInput" value="30000" step="1000">
                </div>
                <div class="field">
                    <label>Numero Mensilità</label>
                    <select id="monthsInput">
                        <option value="12">12 Mensilità</option>
                        <option value="13" selected>13 Mensilità</option>
                        <option value="14">14 Mensilità</option>
                    </select>
                </div>
            </div>
            <button class="btn" onclick="calcSalary()">Calcola Stipendio Netto</button>
            <div class="res-box" id="salaryRes">
                Stipendio Netto Stimato: <strong>€ 1.620 / mese</strong>
            </div>
            <div class="tool-guide">
                📊 <strong>Nota sulle imposte:</strong> Il calcolo prende in considerazione la stima delle aliquote IRPEF nazionali e dei contributi previdenziali INPS a carico del lavoratore. 
            </div>
        </div>

        <!-- 2. SPAZIO PUBBLICITARIO INFERIORE (Sotto i Tool, prima delle News) -->
        <div class="ad-box">
            <div class="ad-label">Consigliato dai Partner</div>
            <p class="ad-content">Vuoi aprire un PAC a zero commissioni? Confronta le piattaforme di investimento raccomandate.</p>
            <a href="#" class="btn-ad-action" onclick="alert('Qui andrà il secondo banner affiliato!')">Confronta Broker</a>
        </div>

        <!-- Notizie Economia Feed -->
        <div class="section-title">
            <span>Notizie Economiche quotidiane</span>
            <button onclick="getNews()" style="background:none; border:1px solid var(--accent); color:var(--accent); padding:4px 8px; border-radius:4px; cursor:pointer; font-size:0.75rem;">Aggiorna</button>
        </div>
        <div id="newsFeed">Caricamento ultime notizie...</div>

    </div>

    <footer>
        <p>© 2026 NewsBrief Finance. Tutti i diritti riservati.</p>
        <p style="margin-top: 6px; color: #64748b; font-size: 0.70rem;">Le informazioni e gli strumenti forniti su questo sito hanno finalità esclusivamente informative ed educative. Non costituiscono in alcun modo consulenza finanziaria o sollecitazione al risparmio.</p>
    </footer>

    <script>
        function unlockPro(planName) {
            document.getElementById('proInputs').classList.remove('pro-locked');
            document.getElementById('proOverlayBox').style.display = 'none';
            calcAllocation();
            alert(`🎉 Modalità "${planName}" simulata con successo per questo test!`);
        }

        function calcAllocation() {
            const tot = parseFloat(document.getElementById('totCapital').value) || 0;
            const pEtf = parseFloat(document.getElementById('percEtf').value) || 0;
            const pBonds = parseFloat(document.getElementById('percBonds').value) || 0;
            const pStocks = parseFloat(document.getElementById('percStocks').value) || 0;
            const pCash = parseFloat(document.getElementById('percCash').value) || 0;

            const totalPerc = pEtf + pBonds + pStocks + pCash;
            const valEtf = (tot * pEtf) / 100;
            const valBonds = (tot * pBonds) / 100;
            const valStocks = (tot * pStocks) / 100;
            const valCash = (tot * pCash) / 100;

            let warning = '';
            if (totalPerc !== 100) {
                warning = `<div style="color:var(--gold); font-size:0.75rem; margin-top:6px;">⚠️ Il totale delle percentuali è ${totalPerc}% (consigliato 100%).</div>`;
            }

            document.getElementById('allocRes').innerHTML = `
                <div style="font-weight:600; margin-bottom:6px;">Distribuzione su € ${tot.toLocaleString('it-IT')} di capitale:</div>
                <div class="allocation-grid">
                    <div class="alloc-card"><span>ETF (${pEtf}%)</span><strong>€ ${Math.round(valEtf).toLocaleString('it-IT')}</strong></div>
                    <div class="alloc-card"><span>Obbligazioni (${pBonds}%)</span><strong>€ ${Math.round(valBonds).toLocaleString('it-IT')}</strong></div>
                    <div class="alloc-card"><span>Azioni/Crypto (${pStocks}%)</span><strong>€ ${Math.round(valStocks).toLocaleString('it-IT')}</strong></div>
                    <div class="alloc-card"><span>Liquidità (${pCash}%)</span><strong>€ ${Math.round(valCash).toLocaleString('it-IT')}</strong></div>
                </div>
                ${warning}
            `;
        }

        function calcSalary() {
            const ral = parseFloat(document.getElementById('ralInput').value) || 0;
            const months = parseInt(document.getElementById('monthsInput').value) || 13;
            if (ral <= 0) return;

            const inps = ral * 0.0919;
            const imponibile = ral - inps;

            let irpef = 0;
            if (imponibile <= 28000) {
                irpef = imponibile * 0.23;
            } else if (imponibile <= 50000) {
                irpef = (28000 * 0.23) + ((imponibile - 28000) * 0.35);
            } else {
                irpef = (28000 * 0.23) + (22000 * 0.35) + ((imponibile - 50000) * 0.43);
            }

            let detrazioni = 0;
            if (ral <= 15000) detrazioni = 1955;
            else if (ral <= 28000) detrazioni = 1910;
            else if (ral <= 50000) detrazioni = 1000;

            const irpefNetta = Math.max(0, irpef - detrazioni);
            const nettoAnnuo = imponibile - irpefNetta;
            const nettoMensile = nettoAnnuo / months;

            document.getElementById('salaryRes').innerHTML = `
                Stipendio Netto Stimato: <strong>€ ${Math.round(nettoMensile).toLocaleString('it-IT')} / mese</strong> 
                <span style="font-size:0.75rem; color:var(--muted); display:block; margin-top:4px;">
                    Netto annuo: € ${Math.round(nettoAnnuo).toLocaleString('it-IT')} | INPS: ~€ ${Math.round(inps).toLocaleString('it-IT')} | IRPEF: ~€ ${Math.round(irpefNetta).toLocaleString('it-IT')}
                </span>
            `;
        }

        function calcBudget() {
            const net = parseFloat(document.getElementById('netIncomeInput').value) || 0;
            const needs = Math.round(net * 0.5);
            const wants = Math.round(net * 0.3);
            const savings = Math.round(net * 0.2);

            document.getElementById('budgetRes').innerHTML = `
                <div class="stat-card"><span>50% Bisogni</span><strong style="color:var(--accent);">€ ${needs.toLocaleString('it-IT')}</strong></div>
                <div class="stat-card"><span>30% Svaghi</span><strong style="color:var(--gold);">€ ${wants.toLocaleString('it-IT')}</strong></div>
                <div class="stat-card"><span>20% Risparmio</span><strong style="color:var(--green);">€ ${savings.toLocaleString('it-IT')}</strong></div>
            `;
        }

        function runPacCalc() {
            const P = parseFloat(document.getElementById('cInit').value) || 0;
            const PMT = parseFloat(document.getElementById('cMonth').value) || 0;
            const t = parseFloat(document.getElementById('cYears').value) || 0;
            const r = (parseFloat(document.getElementById('cRate').value) || 0) / 100 / 12;
            const n = t * 12;

            let total = P * Math.pow(1 + r, n);
            for (let i = 1; i <= n; i++) total += PMT * Math.pow(1 + r, n - i);

            document.getElementById('cRes').innerHTML = `Capitale finale stimato: <strong>€ ${Math.round(total).toLocaleString('it-IT')}</strong>`;
        }

        async function getNews() {
            const feed = document.getElementById('newsFeed');
            feed.innerHTML = 'Sincronizzazione notizie...';
            try {
                const r = await fetch('https://api.rss2json.com/v1/api.json?rss_url=' + encodeURIComponent('https://www.ansa.it/sito/notizie/economia/economia_rss.xml'));
                const d = await r.json();
                if(d.items) {
                    feed.innerHTML = d.items.slice(0, 5).map(n => `
                        <div class="news-item">
                            <a href="${n.link}" target="_blank">${n.title}</a>
                            <div class="news-time">ANSA Economia • ${new Date(n.pubDate).toLocaleTimeString('it-IT', {hour:'2-digit', minute:'2-digit'})}</div>
                        </div>
                    `).join('');
                }
            } catch(e) { feed.innerHTML = 'Errore nel caricamento del feed notizie.'; }
        }

        window.onload = () => { calcSalary(); calcBudget(); calcAllocation(); runPacCalc(); getNews(); };
    </script>
</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NEXUS — Haute Tech & Design</title>
    <!-- Fonts & Icons -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --primary: #090d16;
            --accent: #3b82f6;
            --accent-gradient: linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%);
            --accent-glow: rgba(59, 130, 246, 0.25);
            --bg: #0f172a;
            --surface: rgba(30, 41, 59, 0.7);
            --surface-solid: #1e293b;
            --surface-hover: rgba(51, 65, 85, 0.8);
            --text-main: #f8fafc;
            --text-muted: #94a3b8;
            --border: rgba(255, 255, 255, 0.08);
            --border-hover: rgba(255, 255, 255, 0.2);
            --radius-sm: 8px;
            --radius-md: 16px;
            --radius-lg: 24px;
            --radius-full: 9999px;
            --shadow-subtle: 0 10px 30px -10px rgba(0, 0, 0, 0.5);
            --shadow-glow: 0 0 20px var(--accent-glow);
            --transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: 'Plus Jakarta Sans', sans-serif; background: var(--bg); color: var(--text-main); line-height: 1.6; overflow-x: hidden; min-height: 100vh; padding-bottom: 70px; }

        .ambient-glow { position: fixed; width: 600px; height: 600px; background: radial-gradient(circle, rgba(59, 130, 246, 0.08) 0%, rgba(0,0,0,0) 70%); top: -200px; left: -200px; z-index: 0; pointer-events: none; }

        /* Header */
        header { position: sticky; top: 0; z-index: 100; background: rgba(15, 23, 42, 0.75); backdrop-filter: blur(20px); border-bottom: 1px solid var(--border); }
        .nav-container { max-width: 1360px; margin: 0 auto; display: flex; align-items: center; justify-content: space-between; padding: 1.25rem 2rem; gap: 2rem; }
        .logo { font-weight: 800; font-size: 1.5rem; text-decoration: none; color: var(--text-main); letter-spacing: -0.03em; display: flex; align-items: center; gap: 0.5rem; }
        .logo-mark { width: 32px; height: 32px; background: var(--accent-gradient); border-radius: var(--radius-sm); display: grid; place-items: center; color: white; font-size: 0.9rem; box-shadow: var(--shadow-glow); }

        .search-bar { flex: 1; max-width: 520px; position: relative; }
        .search-bar input { width: 100%; padding: 0.75rem 1rem 0.75rem 2.8rem; border-radius: var(--radius-full); border: 1px solid var(--border); outline: none; background: var(--surface); color: var(--text-main); font-size: 0.9rem; transition: var(--transition); }
        .search-bar input:focus { border-color: var(--accent); background: rgba(30, 41, 59, 0.9); box-shadow: 0 0 0 4px var(--accent-glow); }
        .search-bar i { position: absolute; left: 1.1rem; top: 50%; transform: translateY(-50%); color: var(--text-muted); font-size: 0.9rem; }

        .nav-actions { display: flex; gap: 0.75rem; align-items: center; }
        .icon-btn { position: relative; background: var(--surface); border: 1px solid var(--border); font-size: 1.1rem; color: var(--text-main); cursor: pointer; width: 44px; height: 44px; border-radius: var(--radius-full); display: grid; place-items: center; transition: var(--transition); }
        .icon-btn:hover { background: var(--surface-hover); border-color: var(--border-hover); transform: translateY(-2px); }
        .badge { position: absolute; top: -2px; right: -2px; background: var(--accent); color: white; font-size: 0.7rem; font-weight: 700; border-radius: 50%; width: 20px; height: 20px; display: grid; place-items: center; box-shadow: var(--shadow-glow); }

        /* Hero */
        .hero { max-width: 1360px; margin: 2rem auto 0; padding: 0 2rem; }
        .hero-card { background: linear-gradient(135deg, rgba(30, 41, 59, 0.8) 0%, rgba(15, 23, 42, 0.9) 100%), url('https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?auto=format&fit=crop&w=1600&q=80') center/cover; border-radius: var(--radius-lg); padding: 4rem 3rem; border: 1px solid var(--border); position: relative; overflow: hidden; }
        .hero-content { max-width: 540px; z-index: 2; position: relative; }
        .hero-tag { color: var(--accent); font-weight: 700; font-size: 0.85rem; text-transform: uppercase; letter-spacing: 0.1em; margin-bottom: 0.75rem; display: block; }
        .hero-title { font-size: 2.75rem; font-weight: 800; line-height: 1.15; margin-bottom: 1rem; letter-spacing: -0.02em; }
        .hero-desc { color: var(--text-muted); margin-bottom: 2rem; font-size: 1rem; }

        /* Main Layout */
        .main-layout { max-width: 1360px; margin: 3rem auto; padding: 0 2rem; display: grid; grid-template-columns: 280px 1fr; gap: 2.5rem; position: relative; z-index: 1; }

        /* Filters */
        .filters { background: var(--surface); backdrop-filter: blur(12px); padding: 1.75rem; border-radius: var(--radius-md); border: 1px solid var(--border); height: fit-content; position: sticky; top: 100px; }
        .filters-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 1.5rem; padding-bottom: 1rem; border-bottom: 1px solid var(--border); }
        .filters h3 { font-size: 1.1rem; font-weight: 700; }
        .reset-btn { background: none; border: none; color: var(--accent); font-size: 0.85rem; font-weight: 600; cursor: pointer; }
        .filter-group { margin-bottom: 1.75rem; }
        .filter-group label { display: block; font-size: 0.85rem; font-weight: 600; color: var(--text-muted); margin-bottom: 0.75rem; text-transform: uppercase; letter-spacing: 0.05em; }
        .category-pills { display: flex; flex-direction: column; gap: 0.5rem; }
        .cat-pill { padding: 0.6rem 1rem; border-radius: var(--radius-sm); background: transparent; border: 1px solid transparent; color: var(--text-muted); font-size: 0.9rem; font-weight: 500; cursor: pointer; text-align: left; transition: var(--transition); display: flex; justify-content: space-between; align-items: center; }
        .cat-pill:hover { background: rgba(255, 255, 255, 0.03); color: var(--text-main); }
        .cat-pill.active { background: var(--surface-hover); border-color: var(--border-hover); color: var(--text-main); font-weight: 600; }
        .cat-count { font-size: 0.75rem; opacity: 0.6; background: rgba(0,0,0,0.2); padding: 2px 8px; border-radius: var(--radius-full); }
        .price-range { width: 100%; accent-color: var(--accent); cursor: pointer; }

        /* Products Grid */
        .products-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 1.75rem; }
        .product-card { background: var(--surface); backdrop-filter: blur(12px); border: 1px solid var(--border); border-radius: var(--radius-md); overflow: hidden; display: flex; flex-direction: column; transition: var(--transition); position: relative; }
        .product-card:hover { transform: translateY(-6px); border-color: var(--border-hover); box-shadow: var(--shadow-subtle); }
        .product-image-wrap { position: relative; width: 100%; height: 240px; overflow: hidden; background: #000; }
        .product-image { width: 100%; height: 100%; object-fit: cover; transition: transform 0.6s cubic-bezier(0.16, 1, 0.3, 1); opacity: 0.9; }
        .product-card:hover .product-image { transform: scale(1.08); opacity: 1; }

        /* Item Badges & Wishlist */
        .product-badge { position: absolute; top: 1rem; left: 1rem; background: var(--accent-gradient); color: white; padding: 0.25rem 0.6rem; border-radius: var(--radius-sm); font-size: 0.7rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.05em; z-index: 2; box-shadow: var(--shadow-glow); }
        .product-badge.sale { background: linear-gradient(135deg, #ef4444 0%, #b91c1c 100%); }
        .wishlist-btn { position: absolute; top: 1rem; right: 1rem; width: 34px; height: 34px; border-radius: 50%; background: rgba(15, 23, 42, 0.6); backdrop-filter: blur(8px); border: 1px solid var(--border); color: white; display: grid; place-items: center; cursor: pointer; transition: var(--transition); z-index: 2; }
        .wishlist-btn.active { color: #ef4444; background: rgba(239, 68, 68, 0.15); border-color: rgba(239, 68, 68, 0.4); }

        .quick-view-btn { position: absolute; bottom: 1rem; left: 50%; transform: translateX(-50%) translateY(20px); background: rgba(15, 23, 42, 0.85); backdrop-filter: blur(8px); color: white; border: 1px solid var(--border); padding: 0.5rem 1rem; border-radius: var(--radius-full); font-size: 0.8rem; font-weight: 600; cursor: pointer; opacity: 0; transition: var(--transition); }
        .product-card:hover .quick-view-btn { transform: translateX(-50%) translateY(0); opacity: 1; }

        .product-info { padding: 1.25rem; display: flex; flex-direction: column; flex: 1; }
        .product-category { font-size: 0.75rem; font-weight: 700; color: var(--accent); text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 0.4rem; }
        .product-title { font-size: 1.05rem; font-weight: 600; margin-bottom: 0.5rem; color: var(--text-main); }
        .product-rating { color: #f59e0b; font-size: 0.8rem; margin-bottom: 1rem; display: flex; align-items: center; gap: 0.4rem; }
        .rating-count { color: var(--text-muted); font-size: 0.75rem; }

        .product-bottom { margin-top: auto; display: flex; align-items: center; justify-content: space-between; gap: 1rem; }
        .product-price { font-weight: 800; color: var(--text-main); font-size: 1.25rem; letter-spacing: -0.02em; }
        .product-old-price { font-size: 0.85rem; color: var(--text-muted); text-decoration: line-through; margin-left: 0.4rem; font-weight: 400; }

        .add-to-cart-btn { padding: 0.65rem 1.1rem; border: none; background: var(--accent-gradient); color: white; border-radius: var(--radius-full); font-weight: 600; font-size: 0.85rem; cursor: pointer; transition: var(--transition); display: flex; align-items: center; gap: 0.5rem; box-shadow: var(--shadow-glow); }
        .add-to-cart-btn:hover { transform: scale(1.05); filter: brightness(1.1); }

        /* Overlay & Drawer */
        .overlay { position: fixed; inset: 0; background: rgba(9, 13, 22, 0.7); backdrop-filter: blur(4px); z-index: 190; opacity: 0; pointer-events: none; transition: var(--transition); }
        .overlay.active { opacity: 1; pointer-events: all; }

        .cart-drawer { position: fixed; top: 0; right: -420px; width: 420px; height: 100%; background: var(--surface-solid); border-left: 1px solid var(--border); box-shadow: var(--shadow-subtle); z-index: 200; transition: transform 0.4s cubic-bezier(0.16, 1, 0.3, 1); display: flex; flex-direction: column; }
        .cart-drawer.open { transform: translateX(-420px); }
        .cart-header { padding: 1.5rem; border-bottom: 1px solid var(--border); display: flex; justify-content: space-between; align-items: center; }
        .cart-header h3 { font-weight: 700; font-size: 1.2rem; }
        .cart-body { flex: 1; overflow-y: auto; padding: 1.5rem; display: flex; flex-direction: column; gap: 1.25rem; }

        .cart-item { display: flex; gap: 1rem; background: rgba(255,255,255,0.02); padding: 0.85rem; border-radius: var(--radius-md); border: 1px solid var(--border); align-items: center; }
        .cart-item img { width: 70px; height: 70px; object-fit: cover; border-radius: var(--radius-sm); }
        .cart-item-details { flex: 1; }
        .cart-item-title { font-weight: 600; font-size: 0.9rem; margin-bottom: 0.25rem; }
        .cart-item-price { font-weight: 700; font-size: 0.95rem; color: var(--accent); }

        .quantity-controls { display: flex; align-items: center; gap: 0.5rem; background: var(--bg); border: 1px solid var(--border); border-radius: var(--radius-full); padding: 0.2rem 0.5rem; width: fit-content; margin-top: 0.5rem; }
        .qty-btn { background: none; border: none; color: var(--text-main); cursor: pointer; font-size: 0.8rem; width: 20px; height: 20px; display: grid; place-items: center; }

        .cart-footer { padding: 1.5rem; border-top: 1px solid var(--border); background: rgba(0,0,0,0.1); }
        .checkout-btn { width: 100%; padding: 1rem; background: var(--accent-gradient); color: white; border: none; border-radius: var(--radius-full); font-weight: 700; font-size: 1rem; cursor: pointer; transition: var(--transition); box-shadow: var(--shadow-glow); }
        .checkout-btn:hover { filter: brightness(1.15); transform: translateY(-1px); }

        /* Modal & Tabs */
        .modal { position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%) scale(0.95); width: 90%; max-width: 800px; background: var(--surface-solid); border: 1px solid var(--border); border-radius: var(--radius-lg); padding: 2rem; z-index: 210; opacity: 0; pointer-events: none; transition: var(--transition); display: grid; grid-template-columns: 1fr 1fr; gap: 2rem; }
        .modal.active { opacity: 1; pointer-events: all; transform: translate(-50%, -50%) scale(1); }
        .modal-img { width: 100%; height: 320px; object-fit: cover; border-radius: var(--radius-md); }

        .modal-tabs { display: flex; gap: 1rem; border-bottom: 1px solid var(--border); margin-bottom: 1rem; }
        .tab-btn { background: none; border: none; color: var(--text-muted); font-size: 0.85rem; font-weight: 600; padding-bottom: 0.5rem; cursor: pointer; border-bottom: 2px solid transparent; transition: var(--transition); }
        .tab-btn.active { color: var(--accent); border-color: var(--accent); }
        .tab-content { display: none; font-size: 0.85rem; color: var(--text-muted); min-height: 100px; }
        .tab-content.active { display: block; }

        /* Sticky Action Bar */
        .express-bar { position: fixed; bottom: 0; left: 0; right: 0; background: rgba(15, 23, 42, 0.85); backdrop-filter: blur(16px); border-top: 1px solid var(--border); padding: 0.75rem 2rem; display: flex; justify-content: space-between; align-items: center; z-index: 90; transform: translateY(100%); transition: var(--transition); }
        .express-bar.visible { transform: translateY(0); }

        /* Toast */
        .toast-container { position: fixed; bottom: 5rem; right: 2rem; z-index: 300; display: flex; flex-direction: column; gap: 0.75rem; }
        .toast { background: rgba(30, 41, 59, 0.95); backdrop-filter: blur(12px); border: 1px solid var(--border-hover); color: white; padding: 0.85rem 1.4rem; border-radius: var(--radius-md); font-size: 0.9rem; font-weight: 500; box-shadow: var(--shadow-subtle); display: flex; align-items: center; gap: 0.75rem; animation: slideIn 0.3s cubic-bezier(0.16, 1, 0.3, 1); }
        .toast i { color: #10b981; }
        @keyframes slideIn { from { transform: translateX(100%); opacity: 0; } to { transform: translateX(0); opacity: 1; } }

        @media (max-width: 900px) {
            .main-layout { grid-template-columns: 1fr; }
            .filters { display: none; }
            .hero-title { font-size: 2rem; }
            .cart-drawer { width: 100%; right: -100%; }
            .cart-drawer.open { transform: translateX(-100%); }
            .modal { grid-template-columns: 1fr; }
            .modal-img { height: 200px; }
        }
    </style>
</head>
<body>

    <div class="ambient-glow"></div>

    <!-- Header -->
    <header>
        <div class="nav-container">
            <a href="#" class="logo">
                <div class="logo-mark"><i class="fas fa-cube"></i></div>
                NEXUS
            </a>
            
            <div class="search-bar">
                <i class="fas fa-search"></i>
                <input type="text" id="searchInput" placeholder="Search elite gadgets, gear, audio...">
            </div>

            <div class="nav-actions">
                <button class="icon-btn" id="wishlistToggleBtn" aria-label="Wishlist">
                    <i class="far fa-heart"></i>
                    <span class="badge" id="wishlistBadge">0</span>
                </button>
                <button class="icon-btn" id="cartToggleBtn" aria-label="Cart">
                    <i class="fas fa-shopping-bag"></i>
                    <span class="badge" id="cartBadge">0</span>
                </button>
            </div>
        </div>
    </header>

    <!-- Hero Showcase Banner -->
    <section class="hero">
        <div class="hero-card">
            <div class="hero-content">
                <span class="hero-tag">Flagship Release</span>
                <h1 class="hero-title">Next-Gen Audio Engineering</h1>
                <p class="hero-desc">Experience spatial immersion with lossless clarity and adaptive noise canceling technology.</p>
                <button class="add-to-cart-btn" style="padding: 0.85rem 1.75rem; font-size: 1rem;" onclick="addToCart(3)">
                    Explore Sony XM5
                </button>
            </div>
        </div>
    </section>

    <!-- Main Layout -->
    <div class="main-layout">
        <!-- Sidebar Filters -->
        <aside class="filters">
            <div class="filters-header">
                <h3>Filters</h3>
                <button class="reset-btn" onclick="resetFilters()">Reset All</button>
            </div>

            <div class="filter-group">
                <label>Category</label>
                <div class="category-pills" id="categoryPills"></div>
            </div>

            <div class="filter-group">
                <label>Max Price: <span id="priceValue" style="color:var(--text-main); font-weight:700;">$2500</span></label>
                <input type="range" id="priceRange" class="price-range" min="100" max="2500" step="50" value="2500">
            </div>
        </aside>

        <!-- Product Grid -->
        <main class="products-grid" id="productsGrid"></main>
    </div>

    <!-- Sticky Express Action Bar -->
    <div class="express-bar" id="expressBar">
        <div style="display:flex; align-items:center; gap: 1rem;">
            <span style="font-size:0.85rem; color: var(--text-muted);">Quick Checkout Active</span>
            <span id="expressTotal" style="font-weight: 800; font-size:1.1rem; color: var(--text-main);">$0.00</span>
        </div>
        <button class="checkout-btn" style="width:auto; padding: 0.6rem 1.5rem;" onclick="toggleCart(true)">View Order</button>
    </div>

    <!-- Backdrop Overlay -->
    <div class="overlay" id="overlay"></div>

    <!-- Cart Drawer -->
    <div class="cart-drawer" id="cartDrawer">
        <div class="cart-header">
            <h3>Cart (<span id="drawerCartCount">0</span>)</h3>
            <button class="icon-btn" id="cartCloseBtn"><i class="fas fa-times"></i></button>
        </div>
        <div class="cart-body" id="cartItems"></div>
        <div class="cart-footer">
            <div style="display:flex; justify-content:space-between; margin-bottom: 1.25rem;">
                <span style="color: var(--text-muted);">Subtotal</span>
                <span id="cartTotal" style="font-weight:800; font-size: 1.2rem;">$0.00</span>
            </div>
            <button class="checkout-btn" onclick="checkout()">Proceed to Checkout</button>
        </div>
    </div>

    <!-- Tabbed Quick-View Modal -->
    <div class="modal" id="quickViewModal">
        <img src="" id="modalImg" class="modal-img" alt="Product Preview">
        <div style="display:flex; flex-direction:column; justify-content:center;">
            <div id="modalCategory" class="product-category"></div>
            <h2 id="modalTitle" style="margin-bottom:0.5rem; font-size:1.3rem;"></h2>
            
            <div class="modal-tabs">
                <button class="tab-btn active" onclick="switchTab('tabOverview')">Overview</button>
                <button class="tab-btn" onclick="switchTab('tabSpecs')">Specs</button>
                <button class="tab-btn" onclick="switchTab('tabReviews')">Reviews</button>
            </div>

            <div id="tabOverview" class="tab-content active">
                <p id="modalDesc"></p>
            </div>
            <div id="tabSpecs" class="tab-content">
                <p>• Premium Titanium / Aluminum Architecture<br>• High-Efficiency Lithium Power Unit<br>• Multi-Device Bluetooth 5.3 Syncing</p>
            </div>
            <div id="tabReviews" class="tab-content">
                <p>★★★★★ "Exceptional build quality and audio clarity!" — Alex R.<br>★★★★☆ "Sleek aesthetics, fast delivery." — Maya T.</p>
            </div>

            <div id="modalPrice" class="product-price" style="font-size:1.4rem; margin: 1rem 0;"></div>
            <button id="modalAddBtn" class="add-to-cart-btn" style="width:100%; justify-content:center; padding:0.85rem;">Add to Cart</button>
        </div>
    </div>

    <div class="toast-container" id="toastContainer"></div>

    <script>
        const PRODUCTS = [
            { id: 1, title: 'iPhone 14 Pro Max', price: 1099, oldPrice: 1199, category: 'phones', rating: 4.9, reviews: 240, badge: 'Sale', img: 'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=600&q=80', desc: 'Dynamic Island, 48MP main camera, and all-day battery life encased in surgical-grade stainless steel.' },
            { id: 2, title: 'MacBook Pro 14"', price: 1999, oldPrice: null, category: 'laptops', rating: 4.8, reviews: 180, badge: 'Popular', img: 'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80', desc: 'M2 Pro chip delivers groundbreaking performance and exceptional efficiency for intense workflows.' },
            { id: 3, title: 'Sony WH-1000XM5', price: 399, oldPrice: 449, category: 'gadgets', rating: 5.0, reviews: 310, badge: 'Top Choice', img: 'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=600&q=80', desc: 'Industry-leading noise canceling with two processors and eight microphones for unprecedented sound quality.' },
            { id: 4, title: 'Apple Watch Ultra', price: 799, oldPrice: null, category: 'gadgets', rating: 4.7, reviews: 95, badge: null, img: 'https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?auto=format&fit=crop&w=600&q=80', desc: 'Rugged titanium casing, precision dual-frequency GPS, and up to 36 hours of battery life.' },
            { id: 5, title: 'Fujifilm X-T5 Camera', price: 1699, oldPrice: 1799, category: 'gadgets', rating: 4.9, reviews: 64, badge: 'Sale', img: 'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=600&q=80', desc: '40MP BSI image sensor with classic dial-based controls for modern photography enthusiasts.' }
        ];

        const CATEGORIES = [
            { id: 'all', label: 'All Products' },
            { id: 'phones', label: 'Smartphones' },
            { id: 'laptops', label: 'Laptops' },
            { id: 'gadgets', label: 'Gadgets & Gear' }
        ];

        let state = { cart: [], wishlist: [], search: '', category: 'all', maxPrice: 2500 };

        function renderCategories() {
            const container = document.getElementById('categoryPills');
            container.innerHTML = CATEGORIES.map(cat => {
                const count = cat.id === 'all' ? PRODUCTS.length : PRODUCTS.filter(p => p.category === cat.id).length;
                return `
                    <button class="cat-pill ${state.category === cat.id ? 'active' : ''}" onclick="setCategory('${cat.id}')">
                        <span>${cat.label}</span>
                        <span class="cat-count">${count}</span>
                    </button>
                `;
            }).join('');
        }

        function renderProducts() {
            const grid = document.getElementById('productsGrid');
            const filtered = PRODUCTS.filter(p => 
                (state.category === 'all' || p.category === state.category) &&
                p.price <= state.maxPrice &&
                p.title.toLowerCase().includes(state.search.toLowerCase())
            );

            if (filtered.length === 0) {
                grid.innerHTML = `<div style="grid-column: 1/-1; text-align: center; padding: 4rem; color: var(--text-muted);">
                    <i class="fas fa-search" style="font-size:2rem; margin-bottom:1rem; opacity:0.5;"></i>
                    <p>No products match your criteria.</p>
                </div>`;
                return;
            }

            grid.innerHTML = filtered.map(p => {
                const isSaved = state.wishlist.includes(p.id);
                return `
                    <div class="product-card">
                        <div class="product-image-wrap">
                            ${p.badge ? `<span class="product-badge ${p.badge === 'Sale' ? 'sale' : ''}">${p.badge}</span>` : ''}
                            <button class="wishlist-btn ${isSaved ? 'active' : ''}" onclick="toggleWishlist(${p.id})">
                                <i class="${isSaved ? 'fas' : 'far'} fa-heart"></i>
                            </button>
                            <img src="${p.img}" alt="${p.title}" class="product-image">
                            <button class="quick-view-btn" onclick="openQuickView(${p.id})">Quick View</button>
                        </div>
                        <div class="product-info">
                            <span class="product-category">${p.category}</span>
                            <h3 class="product-title">${p.title}</h3>
                            <div class="product-rating">
                                <i class="fas fa-star"></i> ${p.rating}
                                <span class="rating-count">(${p.reviews})</span>
                            </div>
                            <div class="product-bottom">
                                <div>
                                    <span class="product-price">$${p.price.toLocaleString()}</span>
                                    ${p.oldPrice ? `<span class="product-old-price">$${p.oldPrice.toLocaleString()}</span>` : ''}
                                </div>
                                <button class="add-to-cart-btn" onclick="addToCart(${p.id})">
                                    <i class="fas fa-plus"></i> Add
                                </button>
                            </div>
                        </div>
                    </div>
                `;
            }).join('');
        }

        function toggleWishlist(id) {
            if (state.wishlist.includes(id)) {
                state.wishlist = state.wishlist.filter(item => item !== id);
                showToast('Removed from wishlist');
            } else {
                state.wishlist.push(id);
                showToast('Added to wishlist');
            }
            document.getElementById('wishlistBadge').textContent = state.wishlist.length;
            renderProducts();
        }

        function addToCart(id) {
            const existing = state.cart.find(item => item.id === id);
            if (existing) { existing.qty++; } 
            else { state.cart.push({ ...PRODUCTS.find(p => p.id === id), qty: 1 }); }
            updateCartUI();
            showToast('Item added to cart');
        }

        function updateQuantity(id, delta) {
            const item = state.cart.find(i => i.id === id);
            if (!item) return;
            item.qty += delta;
            if (item.qty <= 0) state.cart = state.cart.filter(i => i.id !== id);
            updateCartUI();
        }

        function updateCartUI() {
            const totalCount = state.cart.reduce((sum, item) => sum + item.qty, 0);
            document.getElementById('cartBadge').textContent = totalCount;
            document.getElementById('drawerCartCount').textContent = totalCount;

            const container = document.getElementById('cartItems');
            if (state.cart.length === 0) {
                container.innerHTML = `<div style="text-align: center; color: var(--text-muted); padding: 3rem 0;">Your cart is empty.</div>`;
            } else {
                container.innerHTML = state.cart.map(item => `
                    <div class="cart-item">
                        <img src="${item.img}" alt="${item.title}">
                        <div class="cart-item-details">
                            <div class="cart-item-title">${item.title}</div>
                            <div class="cart-item-price">$${(item.price * item.qty).toLocaleString()}</div>
                            <div class="quantity-controls">
                                <button class="qty-btn" onclick="updateQuantity(${item.id}, -1)">-</button>
                                <span style="font-size:0.8rem; font-weight:700; width:16px; text-align:center;">${item.qty}</span>
                                <button class="qty-btn" onclick="updateQuantity(${item.id}, 1)">+</button>
                            </div>
                        </div>
                    </div>
                `).join('');
            }

            const total = state.cart.reduce((sum, item) => sum + (item.price * item.qty), 0);
            document.getElementById('cartTotal').textContent = `$${total.toLocaleString()}`;
            document.getElementById('expressTotal').textContent = `$${total.toLocaleString()}`;

            const expressBar = document.getElementById('expressBar');
            if (totalCount > 0) expressBar.classList.add('visible');
            else expressBar.classList.remove('visible');
        }

        function openQuickView(id) {
            const product = PRODUCTS.find(p => p.id === id);
            document.getElementById('modalImg').src = product.img;
            document.getElementById('modalCategory').textContent = product.category;
            document.getElementById('modalTitle').textContent = product.title;
            document.getElementById('modalDesc').textContent = product.desc;
            document.getElementById('modalPrice').textContent = `$${product.price.toLocaleString()}`;
            document.getElementById('modalAddBtn').onclick = () => { addToCart(product.id); closeQuickView(); };
            
            document.getElementById('quickViewModal').classList.add('active');
            document.getElementById('overlay').classList.add('active');
        }

        function closeQuickView() {
            document.getElementById('quickViewModal').classList.remove('active');
            if (!document.getElementById('cartDrawer').classList.contains('open')) {
                document.getElementById('overlay').classList.remove('active');
            }
        }

        function switchTab(tabId) {
            document.querySelectorAll('.tab-btn').forEach(btn => btn.classList.remove('active'));
            document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
            event.target.classList.add('active');
            document.getElementById(tabId).classList.add('active');
        }

        function setCategory(cat) { state.category = cat; renderCategories(); renderProducts(); }
        function resetFilters() {
            state.category = 'all'; state.search = ''; state.maxPrice = 2500;
            document.getElementById('searchInput').value = '';
            document.getElementById('priceRange').value = 2500;
            document.getElementById('priceValue').textContent = '$2500';
            renderCategories(); renderProducts();
        }

        function showToast(msg) {
            const container = document.getElementById('toastContainer');
            const toast = document.createElement('div');
            toast.className = 'toast';
            toast.innerHTML = `<i class="fas fa-check-circle"></i> ${msg}`;
            container.appendChild(toast);
            setTimeout(() => toast.remove(), 2500);
        }

        function checkout() {
            if(state.cart.length === 0) return showToast('Cart is empty!');
            showToast('Order processing initiated...');
            state.cart = [];
            updateCartUI();
            toggleCart(false);
        }

        function toggleCart(open) {
            const drawer = document.getElementById('cartDrawer');
            const overlay = document.getElementById('overlay');
            if (open) { drawer.classList.add('open'); overlay.classList.add('active'); } 
            else { drawer.classList.remove('open'); overlay.classList.remove('active'); }
        }

        // Event Listeners
        document.getElementById('cartToggleBtn').onclick = () => toggleCart(true);
        document.getElementById('cartCloseBtn').onclick = () => toggleCart(false);
        document.getElementById('overlay').onclick = () => { toggleCart(false); closeQuickView(); };
        document.getElementById('searchInput').oninput = (e) => { state.search = e.target.value; renderProducts(); };
        document.getElementById('priceRange').oninput = (e) => {
            state.maxPrice = Number(e.target.value);
            document.getElementById('priceValue').textContent = `$${state.maxPrice}`;
            renderProducts();
        };

        // Init
        renderCategories();
        renderProducts();
    </script>
</body>
</html>

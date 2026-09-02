<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NexusShop — Elite E-Commerce Experience</title>
    <!-- Modern Font & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --primary: #0f172a;
            --accent: #2563eb;
            --accent-hover: #1d4ed8;
            --bg: #f8fafc;
            --surface: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --border: #e2e8f0;
            --radius-md: 12px;
            --radius-full: 9999px;
            --shadow-sm: 0 1px 3px rgba(0,0,0,0.1);
            --shadow-lg: 0 10px 25px -5px rgba(0,0,0,0.1);
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: 'Plus Jakarta Sans', sans-serif; background: var(--bg); color: var(--text-main); line-height: 1.5; }

        /* Header */
        header { position: sticky; top: 0; z-index: 100; background: rgba(255, 255, 255, 0.85); backdrop-filter: blur(12px); border-bottom: 1px solid var(--border); }
        .nav-container { max-width: 1280px; margin: 0 auto; display: flex; align-items: center; justify-content: space-between; padding: 1rem 1.5rem; gap: 1.5rem; }
        .logo { font-weight: 700; font-size: 1.35rem; text-decoration: none; color: var(--primary); }
        .logo span { color: var(--accent); }

        .search-bar { flex: 1; max-width: 480px; position: relative; }
        .search-bar input { width: 100%; padding: 0.6rem 1rem 0.6rem 2.5rem; border-radius: var(--radius-full); border: 1px solid var(--border); outline: none; background: var(--bg); transition: all 0.2s; }
        .search-bar input:focus { border-color: var(--accent); background: var(--surface); box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15); }
        .search-bar i { position: absolute; left: 0.9rem; top: 50%; transform: translateY(-50%); color: var(--text-muted); }

        .nav-actions { display: flex; gap: 1rem; align-items: center; }
        .icon-btn { position: relative; background: none; border: none; font-size: 1.2rem; color: var(--text-main); cursor: pointer; padding: 0.5rem; border-radius: 50%; transition: background 0.2s; }
        .icon-btn:hover { background: var(--border); }
        .badge { position: absolute; top: 0; right: 0; background: var(--accent); color: white; font-size: 0.7rem; font-weight: 700; border-radius: 50%; width: 18px; height: 18px; display: grid; place-items: center; }

        /* Product Grid Layout */
        .main-layout { max-width: 1280px; margin: 2rem auto; padding: 0 1.5rem; display: grid; grid-template-columns: 240px 1fr; gap: 2rem; }
        .filters { background: var(--surface); padding: 1.25rem; border-radius: var(--radius-md); border: 1px solid var(--border); height: fit-content; }
        .filters h3 { font-size: 1rem; margin-bottom: 1rem; }
        .filter-group { margin-bottom: 1.25rem; }
        .filter-group label { display: block; font-size: 0.875rem; color: var(--text-muted); margin-bottom: 0.4rem; }

        .products-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(240px, 1fr)); gap: 1.5rem; }
        .product-card { background: var(--surface); border: 1px solid var(--border); border-radius: var(--radius-md); overflow: hidden; display: flex; flex-direction: column; transition: transform 0.2s, box-shadow 0.2s; position: relative; }
        .product-card:hover { transform: translateY(-4px); box-shadow: var(--shadow-lg); }
        .product-image { width: 100%; height: 200px; object-fit: cover; background: #eee; }
        .product-info { padding: 1rem; display: flex; flex-direction: column; flex: 1; }
        .product-title { font-size: 0.95rem; font-weight: 600; margin-bottom: 0.4rem; }
        .product-price { font-weight: 700; color: var(--primary); font-size: 1.1rem; }
        .add-to-cart-btn { margin-top: auto; padding: 0.6rem; border: none; background: var(--primary); color: white; border-radius: 8px; font-weight: 600; cursor: pointer; transition: background 0.2s; }
        .add-to-cart-btn:hover { background: var(--accent); }

        /* Cart Drawer */
        .cart-drawer { position: fixed; top: 0; right: -400px; width: 380px; height: 100%; background: var(--surface); box-shadow: var(--shadow-lg); z-index: 200; transition: right 0.3s ease; display: flex; flex-direction: column; }
        .cart-drawer.open { right: 0; }
        .cart-header { padding: 1.25rem; border-bottom: 1px solid var(--border); display: flex; justify-content: space-between; align-items: center; }
        .cart-body { flex: 1; overflow-y: auto; padding: 1.25rem; }
        .cart-footer { padding: 1.25rem; border-top: 1px solid var(--border); }
        .checkout-btn { width: 100%; padding: 0.8rem; background: var(--accent); color: white; border: none; border-radius: var(--radius-full); font-weight: 600; cursor: pointer; }

        /* Toast Notifications */
        .toast-container { position: fixed; bottom: 1.5rem; right: 1.5rem; z-index: 300; display: flex; flex-direction: column; gap: 0.5rem; }
        .toast { background: var(--primary); color: white; padding: 0.75rem 1.25rem; border-radius: 8px; font-size: 0.875rem; box-shadow: var(--shadow-lg); animation: slideIn 0.2s ease; }
        @keyframes slideIn { from { transform: translateX(100%); } to { transform: translateX(0); } }

        @media (max-width: 768px) {
            .main-layout { grid-template-columns: 1fr; }
            .filters { display: none; }
        }
    </style>
</head>
<body>

    <header>
        <div class="nav-container">
            <a href="#" class="logo">Nexus<span>Shop</span></a>
            <div class="search-bar">
                <i class="fas fa-search"></i>
                <input type="text" id="searchInput" placeholder="Search premium catalog...">
            </div>
            <div class="nav-actions">
                <button class="icon-btn" aria-label="Wishlist"><i class="far fa-heart"></i></button>
                <button class="icon-btn" id="cartToggleBtn" aria-label="Cart">
                    <i class="fas fa-shopping-bag"></i>
                    <span class="badge" id="cartBadge">0</span>
                </button>
            </div>
        </div>
    </header>

    <div class="main-layout">
        <aside class="filters">
            <h3>Filters</h3>
            <div class="filter-group">
                <label>Category</label>
                <select id="categoryFilter" style="width:100%; padding:0.4rem; border-radius:6px;">
                    <option value="all">All Categories</option>
                    <option value="phones">Smartphones</option>
                    <option value="laptops">Laptops</option>
                    <option value="gadgets">Gadgets</option>
                </select>
            </div>
        </aside>

        <main class="products-grid" id="productsGrid"></main>
    </div>

    <!-- Side Cart Drawer -->
    <div class="cart-drawer" id="cartDrawer">
        <div class="cart-header">
            <h3>Your Cart</h3>
            <button class="icon-btn" id="cartCloseBtn"><i class="fas fa-times"></i></button>
        </div>
        <div class="cart-body" id="cartItems"></div>
        <div class="cart-footer">
            <div style="display:flex; justify-content:space-between; margin-bottom: 1rem; font-weight:700;">
                <span>Total:</span>
                <span id="cartTotal">$0.00</span>
            </div>
            <button class="checkout-btn">Proceed to Checkout</button>
        </div>
    </div>

    <div class="toast-container" id="toastContainer"></div>

    <script>
        const PRODUCTS = [
            { id: 1, title: 'iPhone 14 Pro Max', price: 1099, category: 'phones', img: 'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=600&q=80' },
            { id: 2, title: 'MacBook Pro 14"', price: 1999, category: 'laptops', img: 'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80' },
            { id: 3, title: 'Sony WH-1000XM5', price: 399, category: 'gadgets', img: 'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=600&q=80' }
        ];

        let state = { cart: [], search: '', category: 'all' };

        function renderProducts() {
            const grid = document.getElementById('productsGrid');
            const filtered = PRODUCTS.filter(p => 
                (state.category === 'all' || p.category === state.category) &&
                p.title.toLowerCase().includes(state.search.toLowerCase())
            );

            grid.innerHTML = filtered.map(p => `
                <div class="product-card">
                    <img src="${p.img}" alt="${p.title}" class="product-image">
                    <div class="product-info">
                        <div class="product-title">${p.title}</div>
                        <div class="product-price">$${p.price.toLocaleString()}</div>
                        <button class="add-to-cart-btn" onclick="addToCart(${p.id})">Add to Cart</button>
                    </div>
                </div>
            `).join('');
        }

        function addToCart(id) {
            const product = PRODUCTS.find(p => p.id === id);
            state.cart.push(product);
            updateCartUI();
            showToast(`Added ${product.title} to cart`);
        }

        function updateCartUI() {
            document.getElementById('cartBadge').textContent = state.cart.length;
            const container = document.getElementById('cartItems');
            container.innerHTML = state.cart.map(item => `
                <div style="display:flex; justify-content:space-between; margin-bottom: 0.75rem;">
                    <div>${item.title}</div>
                    <div style="font-weight:600;">$${item.price}</div>
                </div>
            `).join('');

            const total = state.cart.reduce((sum, item) => sum + item.price, 0);
            document.getElementById('cartTotal').textContent = `$${total.toLocaleString()}`;
        }

        function showToast(message) {
            const container = document.getElementById('toastContainer');
            const toast = document.createElement('div');
            toast.className = 'toast';
            toast.textContent = message;
            container.appendChild(toast);
            setTimeout(() => toast.remove(), 2500);
        }

        // Event Listeners
        document.getElementById('cartToggleBtn').onclick = () => document.getElementById('cartDrawer').classList.add('open');
        document.getElementById('cartCloseBtn').onclick = () => document.getElementById('cartDrawer').classList.remove('open');
        document.getElementById('searchInput').oninput = (e) => { state.search = e.target.value; renderProducts(); };
        document.getElementById('categoryFilter').onchange = (e) => { state.category = e.target.value; renderProducts(); };

        renderProducts();
    </script>
</body>
</html>

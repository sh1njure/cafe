# Taste of Crimea — full PrestaShop site

This folder is a **turnkey package**: run one command and you get a real,
installed PrestaShop with this design and the café's products.

Important honesty first: PrestaShop is a PHP + MySQL **server application**, not a
folder of pages. A "finished website" only exists once it's *installed and running*.
So the deliverable here is the package that stands that site up — not a static
export you double-click. Two ways to run it:

- **Fastest (recommended): Docker** — one command, full site in ~3 minutes.
- **Any host:** install PrestaShop normally, then drop in the theme + import the CSV.

```
prestashop/
├── docker-compose.yml            # boots PrestaShop 8 + MySQL, theme mounted in
├── import/products.csv           # the 9 dishes, ready to import
├── theme/tasteofcrimea/          # the child theme (the design)
│   ├── config/theme.yml
│   ├── assets/css/custom.css
│   └── templates/
│       ├── index.tpl             # homepage: hero, why-us, featured, CTA
│       └── catalog/
│           ├── product.tpl                       # product page
│           └── _partials/miniatures/product.tpl  # product card
└── README.md
```

---

## Option 1 — Docker (fastest)

Prerequisites: Docker Desktop (or Docker Engine + compose).

```bash
cd prestashop
docker compose up -d
```

First boot auto-installs PrestaShop (give it ~2–3 min). Then:

| | URL / value |
|---|---|
| Storefront | http://localhost:8080 |
| Admin | http://localhost:8080/admincafe |
| Admin email | hello@tasteofcrimea.com |
| Admin password | PrestaShop123! |

**Finish the setup (once, in the admin):**
1. **Import products:** `Advanced Parameters → … → Import` (or `Catalog → Import`)
   → upload `import/products.csv`, entity **Products**, field separator `;`,
   then run. (Categories Mains / Desserts / Drinks are created automatically.)
2. **Activate the theme:** `Design → Theme & Logo → Use this theme` →
   "Taste of Crimea".
3. **Mark a few dishes as "featured"** so they show on the homepage:
   edit a product → tick *"Home"* / add to the **Home** category (the
   `ps_featuredproducts` module shows those).
4. **Menu links:** `Design → Link List` (ps_mainmenu) → point the top menu at
   Home / Menu (the Mains category or a "Menu" CMS page) / Contact.

That's a full, working shop: browse, add to cart, checkout, the lot.

Stop / reset:
```bash
docker compose down          # stop, keep data
docker compose down -v       # stop and wipe (fresh install next time)
```

---

## Option 2 — Existing / hosted PrestaShop

1. Install PrestaShop 1.7.6+ / 8.x (1-click on most hosts, or manual).
2. Copy `theme/tasteofcrimea/` into the site's `themes/` folder
   (or zip its **contents** and `Design → Theme & Logo → Add new theme → Import`).
   Add a `preview.png` (~570×402, a homepage screenshot) in the theme root so it
   shows in the picker.
3. `Design → Theme & Logo → Use this theme`.
4. Import `import/products.csv` and configure the menu, exactly as in steps 1–4 above.

---

## What's turnkey vs. what still needs a pass

**Turnkey now:** a running shop, all 9 products, categories, working cart &
checkout, the homepage (hero / why-us / featured / CTA), the product page and the
product cards — all in the café's styling.

**Still classic-styled (optional polish):** PrestaShop's **header and footer** come
from the classic parent and its modules (logo, top menu, footer links). The custom
CSS themes the content and custom pages; matching the header/footer *pixel-for-pixel*
to the static mockup means overriding `_partials/header.tpl` / `footer.tpl` and the
menu module — a further iteration.

**Booking form:** use the built-in `Contact` page + `contactform` module (already
in classic). A bespoke "book a table" form is a small custom module if you want the
exact fields from the mockup.

> ⚠️ I couldn't run this specific stack from here to verify it end-to-end, and
> PrestaShop templating is version-sensitive. Run it on a local/staging copy first;
> the Docker option makes that a 3-minute check. Tell me what breaks and I'll fix it.

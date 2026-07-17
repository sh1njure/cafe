# Taste of Crimea

Website for a small family café serving Crimean and Black Sea cuisine. Friendly,
warm style: a sand-and-sea palette, emoji instead of heavy photos, soft rounded
corners and "homey" copy.

## Pages

| File             | What it is                                                     |
|------------------|----------------------------------------------------------------|
| `index.html`     | Home — hero, "why us", menu highlights, booking CTA            |
| `menu.html`      | Menu — mains, desserts, drinks (several items)                |
| `product.html`   | Product page — beef cheburek, quantity picker, "often together" |
| `contacts.html`  | Contacts — address, hours, social, booking form                |
| `assets/css/style.css` | Shared theme                                             |

The site is fully static — just open `index.html` in a browser, no build step.
To serve it locally:

```bash
python3 -m http.server 8000
# then open http://localhost:8000
```

## Adapting to PrestaShop

**Short answer: yes, it's realistic. A starter child theme lives in `prestashop/theme/`,
and a full step-by-step guide is in [`prestashop/README.md`](prestashop/README.md).**

Here's the key thing about how PrestaShop works: the engine is written in PHP,
and pages are rendered not from `.html` files but from **Smarty** templates
(`.tpl`) inside the active theme. So you can't "just upload an HTML file" — but
all the markup and styles carry over almost unchanged. Only the "filling"
changes: static text is replaced with PrestaShop variables (`{$product.name}`,
`{$product.price}`, etc.).

Carries over as-is:
- **CSS** (`assets/css/style.css`) — drop it into `themes/<theme>/assets/css/`
  and enqueue it in the theme. The classes (`.product-card`, `.btn`, `.hero` …)
  work without edits.
- **HTML markup** of blocks — wrapped in the theme's Smarty blocks.

Needs adapting for PrestaShop:
| Static site                | In PrestaShop                                    |
|----------------------------|--------------------------------------------------|
| `product.html`             | `templates/catalog/product.tpl` (Smarty)         |
| `menu.html` (cards)        | category + `product-list.tpl` / products module  |
| Hard-coded dishes          | products in the admin (Catalog → Products)       |
| "Add to order" button      | PrestaShop `add-to-cart` form + cart             |
| Booking form               | contact module / custom module                   |
| Header/footer              | theme's `header.tpl` / `footer.tpl`              |

`prestashop/theme/tasteofcrimea/` is a starter **child theme** of the classic theme:
`theme.yml`, the CSS, the product page (`catalog/product.tpl`) and the product card
(`catalog/_partials/miniatures/product.tpl`), all wired to PrestaShop data.

### Migration steps
1. Create (or make a child of) a theme in `themes/`.
2. Copy `style.css` into the theme's assets and enqueue it in `_partials/`.
3. Split the header/footer into `header.tpl` / `footer.tpl`.
4. Move the product card and product page into `catalog/*.tpl`
   (the `prestashop/theme/` starter already has both).
5. Create the dishes as products, with categories "Mains / Desserts / Drinks".
6. Build the booking form as a separate module or via the contact form.

**Estimate:** integrating this static layout into a PrestaShop theme is roughly
1–2 days of work for a single developer (not counting catalog data entry). Happy
to take `prestashop/` all the way to a full theme if you'd like.

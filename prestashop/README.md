# Building the PrestaShop site with this design

Two independent halves. Do them in this order.

- **A. Get PrestaShop running and put your products in** — no coding, done in the admin panel.
- **B. Make it look like this design** — install the child theme in `theme/tasteofcrimea/`.

> Heads-up: this scaffold targets PrestaShop **1.7.6+ / 8.x** and can't be verified
> without a live install. Always try it on a staging/local copy before touching a
> real shop.

---

## A. PrestaShop + your products (no code)

1. **Install PrestaShop.**
   - Easiest: a host with 1-click PrestaShop (e.g. most cPanel hosts), or
   - Local: download from prestashop.com, or run the official Docker image, or use
     a local stack (XAMPP/MAMP). You need PHP + MySQL.
2. **Log into the admin** (`/admin` — the folder gets a random suffix during install).
3. **Create categories** that match the menu sections:
   `Catalog → Categories` → add **Mains**, **Desserts**, **Drinks**.
4. **Add your dishes as products:** `Catalog → Products → Add new product`.
   - Fill in name, price, short description, a photo, and assign a category.
   - Repeat for each dish. (Bulk option: `Catalog → Import` from a CSV.)
   - This — not any file — is what "puts the products on the site."
5. Set shop name, logo, currency and contact details in
   `Shop Parameters` and `Store Settings`.

At this point you have a working shop on the default (classic) look.

---

## B. Apply the Taste of Crimea design (the child theme)

The theme in `theme/tasteofcrimea/` is a **child of the built-in classic theme**:
it reuses all of classic's working machinery (cart, checkout, header, footer) and
only overrides the styling plus the product page and product card.

1. **Add a preview image.** Put a `preview.png` (≈ 570×402) in
   `theme/tasteofcrimea/` — a screenshot of the homepage works. PrestaShop shows
   it in the theme picker.
2. **Zip and upload:**
   - Zip the **contents** of `theme/tasteofcrimea/` so `config/theme.yml` sits at
     the root of the zip.
   - Admin → `Design → Theme & Logo → Add new theme → Import from your computer`.
   - Or copy the `tasteofcrimea/` folder straight into `themes/` on the server.
3. **Activate it:** `Design → Theme & Logo → Use this theme`.
4. **Check the result:**
   - Product pages use `catalog/product.tpl`.
   - Category / menu grids use the card in
     `catalog/_partials/miniatures/product.tpl`.
   - `assets/css/custom.css` styles everything (it's a copy of the site's CSS).

### What's included vs. what you may still want
| Included | Notes |
|----------|-------|
| `config/theme.yml` | Declares the child theme + loads `custom.css` |
| `assets/css/custom.css` | The full Taste of Crimea styling |
| `catalog/product.tpl` | Product detail page |
| `catalog/_partials/miniatures/product.tpl` | Product card for all listings |

| Not included (optional next steps) | How to do it |
|------------------------------------|--------------|
| Homepage hero / "why us" blocks | Edit `templates/index.tpl` in the child theme, or use the "Custom HTML" / image-slider modules |
| Header / footer tweaks | Override `templates/_partials/header.tpl` / `footer.tpl` |
| Booking form | The `contactform` module, or a custom module |

### If the CSS doesn't load
Some versions are picky about the `theme.yml` `assets` block. Reliable fallback —
register the stylesheet from a tiny module hooking `actionFrontControllerSetMedia`:

```php
public function hookActionFrontControllerSetMedia()
{
    $this->context->controller->registerStylesheet(
        'taste-of-crimea',
        $this->_path.'views/css/custom.css',
        ['media' => 'all', 'priority' => 200]
    );
}
```

(Place `custom.css` under the module's `views/css/` and enable the module.)

---

## TL;DR
- Products live in the **database**, entered via the admin — no file does that.
- The **look** is this child theme: install it, activate it, done.
- It's **not** "one `.tpl` and finished" — it's a CSS file + a couple of templates
  wrapped as a theme, plus your product data.

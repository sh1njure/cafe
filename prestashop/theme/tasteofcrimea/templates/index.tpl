{*
  Homepage — Taste of Crimea child theme.
  Overrides classic's index.tpl with the café hero, "why us" and a
  featured-dishes block. Renders inside the theme's header/footer.
*}
{extends file='page.tpl'}

{block name='content'}

  {* HERO *}
  <section class="hero">
    <div class="container">
      <div class="badges">
        <span class="badge">Right by the sea</span>
        <span class="badge">Homemade recipes</span>
        <span class="badge">Sand-brewed coffee</span>
      </div>
      <h1>The taste of Crimea<br>in every bite</h1>
      <p class="lead">A small family café that cooks the way grandma did back home in
        Bakhchisarai: juicy chebureki, fragrant plov and rich coffee brewed on hot sand.</p>
      <div class="hero-actions">
        <a href="{$urls.pages.category|default:$urls.base_url}" class="btn btn-primary">View the menu</a>
        <a href="{$urls.pages.contact}" class="btn btn-outline">Book a table</a>
      </div>
    </div>
  </section>

  {* WHY US *}
  <section class="section">
    <div class="container">
      <h2 class="section-title">Why it feels warm here</h2>
      <p class="section-sub">We're small — and proud of it. We know every guest by face
        and make every dish by hand.</p>
      <div class="features">
        <div class="feature"><h3>Fresh ingredients</h3><p>Vegetables and herbs from Crimean markets, meat from farmers we trust.</p></div>
        <div class="feature"><h3>Made to order</h3><p>We fold and fry the chebureki on order — served piping hot.</p></div>
        <div class="feature"><h3>Just like home</h3><p>Family recipes passed down through generations.</p></div>
        <div class="feature"><h3>Cozy atmosphere</h3><p>Warm light, live music in the evenings and a view of the promenade.</p></div>
      </div>
    </div>
  </section>

  {* FEATURED DISHES — uses the ps_featuredproducts module (bundled with classic).
     Products marked "featured" in the admin appear here, styled by our card. *}
  <section class="section" style="background:var(--sand-2)">
    <div class="container">
      <h2 class="section-title">Our favorites</h2>
      <p class="section-sub">A few dishes our guests keep coming back for.</p>
      {widget name='ps_featuredproducts'}
    </div>
  </section>

  {* CTA *}
  <section class="section cta-band">
    <div class="container">
      <h2 class="section-title">Hungry yet?</h2>
      <p class="section-sub" style="color:rgba(255,255,255,.9)">Book a table ahead or
        just drop by — we're always happy to see guests.</p>
      <div style="text-align:center">
        <a href="{$urls.pages.contact}" class="btn btn-outline">Get in touch</a>
      </div>
    </div>
  </section>

{/block}

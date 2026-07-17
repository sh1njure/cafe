{*
  Product detail page — Taste of Crimea child theme.
  Same layout as the static product.html, but data comes from PrestaShop.
  Overrides classic's templates/catalog/product.tpl.
*}
{extends file='page.tpl'}

{block name='page_content'}
<section class="section">
  <div class="container">

    <p class="breadcrumbs">
      <a href="{$urls.base_url}">Home</a> /
      <a href="{$urls.pages.category|default:'#'}">Menu</a> /
      {$product.name}
    </p>

    <div class="product-detail">

      {* Product image; monogram fallback if there's no photo *}
      <div class="product-media">
        {if $product.cover}
          <img src="{$product.cover.large.url}" alt="{$product.name|escape:'html':'UTF-8'}">
        {else}
          <span>{$product.name|truncate:10:''|escape:'html':'UTF-8'}</span>
        {/if}
      </div>

      <div class="product-info">
        {if $product.new}<span class="tag">new</span>{/if}
        <h1 style="margin-top:12px">{$product.name}</h1>

        <p style="color:var(--muted)">{$product.description_short nofilter}</p>

        <div class="price-lg">{$product.price}</div>

        {* PrestaShop add-to-cart form *}
        <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
          <input type="hidden" name="token" value="{$static_token}">
          <input type="hidden" name="id_product" value="{$product.id_product}" id="product_page_product_id">
          <input type="hidden" name="qty" value="1">

          <div class="qty">
            <button type="button" class="js-minus" aria-label="Less">&minus;</button>
            <input type="text" name="qty_display" value="1" readonly>
            <button type="button" class="js-plus" aria-label="More">+</button>
          </div>

          <button type="submit" name="add" class="btn btn-primary" style="width:100%; max-width:320px">
            Add to cart
          </button>
        </form>

        {* Specs pulled from the product's features *}
        <ul class="specs">
          {foreach from=$product.features item=feature}
            <li><span>{$feature.name}</span><span>{$feature.value}</span></li>
          {/foreach}
        </ul>
      </div>
    </div>

  </div>
</section>
{/block}

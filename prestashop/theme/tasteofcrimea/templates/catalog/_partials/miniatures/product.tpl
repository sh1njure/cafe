{*
  Product card (miniature) used in category / menu grids and blocks.
  Overrides classic's templates/catalog/_partials/miniatures/product.tpl
  so every product list uses the Taste of Crimea card design.
*}
<article class="product-card js-product-miniature" data-id-product="{$product.id_product}">

  <a href="{$product.url}" class="thumb">
    {if $product.cover}
      <img src="{$product.cover.bySize.home_default.url}" alt="{$product.name|escape:'html':'UTF-8'}">
    {else}
      <span>{$product.name|truncate:10:''|escape:'html':'UTF-8'}</span>
    {/if}
  </a>

  <div class="body">
    {if $product.new}<span class="tag">new</span>
    {elseif $product.on_sale}<span class="tag">sale</span>{/if}

    <h3 style="margin-top:10px"><a href="{$product.url}" style="color:inherit">{$product.name}</a></h3>
    <p class="desc">{$product.description_short|strip_tags:'UTF-8'|truncate:90:'…'}</p>

    <div class="row">
      <span class="price">{$product.price}</span>
      <a href="{$product.url}" class="btn btn-outline" style="padding:8px 18px">Details</a>
    </div>
  </div>

</article>

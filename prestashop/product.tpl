{*
  Пример адаптации страницы товара под PrestaShop (Smarty).
  Это тот же макет, что и в product.html, но статические данные
  заменены на переменные PrestaShop. Файл кладётся в тему:
    themes/<ваша-тема>/templates/catalog/product.tpl
  и наследует стили из assets/css/style.css.
*}
{extends file='page.tpl'}

{block name='page_content'}
<section class="section">
  <div class="container">

    <p class="breadcrumbs">
      <a href="{$urls.base_url}">Главная</a> /
      <a href="{$urls.pages.category|default:'#'}">Меню</a> /
      {$product.name}
    </p>

    <div class="product-detail">

      {* Изображение товара из PrestaShop; эмодзи-заглушка, если фото нет *}
      <div class="product-media">
        {if $product.cover}
          <img src="{$product.cover.large.url}" alt="{$product.name}">
        {else}
          🥟
        {/if}
      </div>

      <div class="product-info">
        {if $product.new}<span class="tag">новинка</span>{/if}
        <h1 style="margin-top:12px">{$product.name}</h1>

        <p style="color:var(--muted)">{$product.description_short nofilter}</p>

        <div class="price-lg">{$product.price}</div>

        {* Форма добавления в корзину PrestaShop *}
        <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
          <input type="hidden" name="token" value="{$static_token}">
          <input type="hidden" name="id_product" value="{$product.id_product}" id="product_page_product_id">
          <input type="hidden" name="qty" value="1">

          <div class="qty">
            <button type="button" class="js-minus" aria-label="Меньше">−</button>
            <input type="text" name="qty_display" value="1" readonly>
            <button type="button" class="js-plus" aria-label="Больше">+</button>
          </div>

          <button type="submit" name="add" class="btn btn-primary" style="width:100%; max-width:320px">
            Добавить в корзину 🛒
          </button>
        </form>

        {* Характеристики из атрибутов/фич товара *}
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

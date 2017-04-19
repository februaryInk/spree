Spree.ready ($) ->
  Spree.addImageHandlers = ->
    thumbnails = ($ '#product-images ul.thumbnails')
    ($ '#main-image').data 'selectedThumb', ($ '#main-image img').attr('src')
    thumbnails.find('li').eq(0).addClass 'selected'
    thumbnails.find('a').on 'click', (event) ->
      ($ '#main-image').data 'selectedThumb', ($ event.currentTarget).attr('href')
      ($ '#main-image').data 'selectedThumbId', ($ event.currentTarget).parent().attr('id')
      thumbnails.find('li').removeClass 'selected'
      ($ event.currentTarget).parent('li').addClass 'selected'
      false

    thumbnails.find('li').on 'mouseenter', (event) ->
      ($ '#main-image img').attr 'src', ($ event.currentTarget).find('a').attr('href')

    thumbnails.find('li').on 'mouseleave', (event) ->
      ($ '#main-image img').attr 'src', ($ '#main-image').data('selectedThumb')

  Spree.showVariantImages = (variantId) ->
    ($ 'li.vtmb').hide()
    ($ 'li.tmb-' + variantId).show()
    currentThumb = ($ '#' + ($ '#main-image').data('selectedThumbId'))
    if not currentThumb.hasClass('vtmb-' + variantId)
      thumb = ($ ($ '#product-images ul.thumbnails li:visible.vtmb').eq(0))
      thumb = ($ ($ '#product-images ul.thumbnails li:visible').eq(0)) unless thumb.length > 0
      newImg = thumb.find('a').attr('href')
      ($ '#product-images ul.thumbnails li').removeClass 'selected'
      thumb.addClass 'selected'
      ($ '#main-image img').attr 'src', newImg
      ($ '#main-image').data 'selectedThumb', newImg
      ($ '#main-image').data 'selectedThumbId', thumb.attr('id')
  
  Spree.updateVariant = (variantId) -> 
    ($ '#selected-variant').val(variantId)
  
  Spree.updateVariantPrice = (variantPrice) ->
    ($ '.price.selling').text(variantPrice) if variantPrice

  Spree.disableCartForm = (variant) ->
    inStock = variant.data('in-stock')
    $('#add-to-cart-button').attr('disabled', !inStock)
    
  Spree.selectVariant = (optionValueIds, productId) ->
    $.get
      data: variant:
        option_value_ids: optionValueIds,
        product_id: productId
      dataType: 'json'
      url: '/products/' + productId + '/query-variant'
      error: (response) ->
        console.log 'error'
        ### display error message ###
      success: (response) ->
        console.log 'success'
        console.log response
        ### hide error message ###
        Spree.updateVariant response.variant.id
        Spree.showVariantImages response.variant.id
        Spree.updateVariantPrice response.variant.price
  
  variantSelectors = $ '.variant-selector'
  productId = ($ '#add-to-cart').data 'product-id'
  
  if variantSelectors.length > 0
    console.log "We're goin'"
    variantSelectors.change (event) ->
      ids = []
      $.each variantSelectors, (index, value) ->
        ids.push $(value).val()
      
      ids = ids.filter (v) -> v != ''
      
      if ids.length == variantSelectors.length
        Spree.selectVariant ids, productId
  

  Spree.addImageHandlers()

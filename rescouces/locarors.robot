*** Variables ***
# Login page
${USERNAME_FIELD}    id:user-name
${PASSWORD_FIELD}    id:password
${LOGIN_BTN}         id:login-button
${ERROR_BANNER}      css:.error-message-container h3


# Products page
${PRODUCT_LIST}      css:div.inventory_list
${PRODUCT_PRICE}     css:.inventory_item_price
${SORT_DROPDOWN}     xpath=//*[@id="header_container"]/div[2]/div/span/select

# Cart
${CART_ICON}         css:a.shopping_cart_link
${CART_BADGE}        css:span.shopping_cart_badge
${CART_ITEM}         css:div.cart_item
${CHECKOUT_BTN}      css:button#checkout

# Checkout pages (step1/step2)
${FIRST_NAME}        id:first-name
${LAST_NAME}         id:last-name
${POSTAL_CODE}       id:postal-code
${CONTINUE_BTN}      id:continue
${FINISH_BTN}        id:finish
${ORDER_COMPLETE}    xpath=//*[@id="checkout_complete_container"]/h2

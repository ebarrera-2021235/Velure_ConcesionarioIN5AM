<%-- 
    Document   : Catalogo
    Created on : 21/08/2025, 23:19:00
    Author     : Roberto Catalán
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catálogo</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
        <!-- Google Fonts Montserrat -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
        <style>
            body{
                font-family: 'Poppins', sans-serif;
                margin: 0;
                background-color: #4c4d4f;
            }

            .container{
                max-width: 1400px;
                margin: auto;
            }

            .container-productos{
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 20px;
            }


            .productos-grid {
                padding: 40px 0;
            }

            .productos-grid .title {
                color: white;
                text-align: center;
            }

            .grid-productos {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
                gap: 40px;
                justify-items: center;
            }

            .card-product {
                background: #fff;
                border-radius: 16px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.08);
                padding: 24px 16px;
                width: 100%;
                max-width: 260px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                transition: transform 0.3s ease;
                text-align: center;
            }

            .card-product:hover {
                transform: scale(1.02);
                box-shadow: 0 4px 16px rgba(0,0,0,0.15);
            }

            .card-product img {
                width: 100%;
                max-width: 150px;
                height: auto;
                border-radius: 12px;
                margin-bottom: 12px;
            }

            .card-product h3 {
                font-size: 1.2em;
                margin: 8px 0 4px 0;
                color: black;
            }

            .card-product .price {
                font-size: 1.1em;
                color: black;
                font-weight: bold;
                margin-top: 8px;
            }

            .add-cart {
                margin-top: 12px;
                padding: 10px 20px;
                background-color: #053c77;
                color: #fff;
                border: none;
                border-radius: 8px;
                font-weight: bold;
                font-size: 1em;
                cursor: pointer;
                transition: background 0.3s;
            }

            .add-cart:hover {
                background-color: #007bff;
            }

            .productos-layout {
                display: flex;
                gap: 40px;
                align-items: flex-start;
            }

            .productos-grid {
                flex: 1;
            }
            
            /* Carrito lateral */
            #cart {
                position: fixed;
                top: 85px;
                right: 40px;
                width: 300px;
                max-height: 80%;
                overflow-y: auto;
                background: #fff;
                border-left: 2px solid #86a2bc;
                padding: 16px;
                display: none;
                z-index: 1000;
                border-radius: 15px;
            }

            #cart h3 {
                margin-top: 0;
                color: #053c77;
            }

            #cart ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .btn-clear {
                background: #053c77;
                color: #fff;
                padding: 8px 16px;
                border: none;
                border-radius: 8px;
                cursor: pointer;
            }

            .btn-clear:hover {
                background: #007bff;
            }

            /* Botón flotante para mostrar/ocultar carrito */
            .btn-toggle {
                position: fixed;
                top: 30px;
                right: 20px;
                padding: 12px 20px;
                background: #053c77;
                color: #fff;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                z-index: 1001;
            }

            .btn-toggle:hover {
                background: #007bff;
            }

                      
</style>
    </head>
    <body>
        <section class="container productos-layout">
        <div class="productos-grid">
            <h1 class="title">Vehículos</h1>
            <div class="grid-productos">
                <div class="card-product">
                    <img src="img/porsche_911.jpg" alt="porsche">
                    <h3>Porsche 911 Carrera</h3>
                    <p class="price">Q.699999.98</p>
                    <button class="add-cart">Agregar al carrito</button>
                </div>

                <div class="card-product">
                    <img src="img/mustang.jpg" alt="mustang">
                    <h3>Mustang Shelby GT500</h3>
                    <p class="price">Q.499999.99</p>
                    <button class="add-cart">Agregar al carrito</button>
                </div>

                <div class="card-product">
                    <img src="img/corvette.jpg" alt="corvette">
                    <h3>Corvette C8 Stingray</h3>
                    <p class="price">Q.799999.99</p>
                    <button class="add-cart">Agregar al carrito</button>
                </div>

                <div class="card-product">
                    <img src="img/R8.jpg" alt="r8">
                    <h3>R8 V10 Performance</h3>
                    <p class="price">Q.650000.00</p>
                    <button class="add-cart">Agregar al carrito</button>
                </div>
                
                <div class="card-product">
                    <img src="img/supra.jpg" alt="supra">
                    <h3>Supra GR</h3>
                    <p class="price">Q.500000.00</p>
                    <button class="add-cart">Agregar al carrito</button>
                </div>

                <div class="card-product">
                    <img src="img/huracan.jpg" alt="huracan">
                    <h3>Huracán EVO</h3>
                    <p class="price">Q.600000.00</p>
                    <button class="add-cart">Agregar al carrito</button>
                </div>

                <div class="card-product">
                    <img src="img/ferrari.jpg" alt="ferrari">
                    <h3>Ferrari F8 Tributo</h3>
                    <p class="price">Q.1500000.00</p>
                    <button class="add-cart">Agregar al carrito</button>
                </div>

                <div class="card-product">
                    <img src="img/GTR.jpg" alt="nissan">
                    <h3>Nissan GT-R Nismo</h3>
                    <p class="price">Q.300000.00</p>
                    <button class="add-cart">Agregar al carrito</button>
                </div>

                <div class="card-product">
                    <img src="img/aventador.jpg" alt="aventador">
                    <h3>Aventador SVJ</h3>
                    <p class="price">Q.1750000.00</p>
                    <button class="add-cart">Agregar al carrito</button>
                </div>

                <div class="card-product">
                    <img src="img/mac.jpg" alt="mac">
                    <h3>McLaren 720S</h3>
                    <p class="price">Q.1999999.99</p>
                    <button class="add-cart">Agregar al carrito</button>
                </div>

            </div>
        </div>
    </section>
        <!-- Carrito -->
    <div id="cart">
        <h3>Carrito</h3>
        <ul id="cart-items"></ul>
        <p>Total: Q<span id="cart-total">0.00</span></p>
        <button onclick="clearCart()" class="btn-clear">Vaciar Carrito</button>
    </div>

    <!-- Botón para mostrar/ocultar carrito -->
    <button onclick="toggleCart()" class="btn-toggle">Ver Carrito</button>


<script>
    const cart = [];
    
    // Agregar productos al carrito
    document.querySelectorAll('.add-cart').forEach((button, index) => {
        button.addEventListener('click', () => {
            const card = button.closest('.card-product');
            const name = card.querySelector('h3').innerText;
            const priceText = card.querySelector('.price').innerText.replace('Q.', '');
            const price = parseFloat(priceText);
            
            const product = {name, price};
            cart.push(product);
            updateCart();
            alert(name + ' agregado al carrito');
        });
    });

    // Actualiza la lista y total
    function updateCart() {
        const list = document.getElementById('cart-items');
        const total = document.getElementById('cart-total');
        list.innerHTML = '';
        let sum = 0;
        cart.forEach((item, i) => {
            sum += item.price;
            const li = document.createElement('li');
            li.innerHTML = `${item.name} - Q.${item.price.toFixed(2)} <button onclick="removeItem(${i})" style="background:red;color:#fff;border:none;border-radius:4px;padding:2px 6px;">X</button>`;
            list.appendChild(li);
        });
        total.innerText = sum.toFixed(2);
    }

    function removeItem(index) {
        cart.splice(index,1);
        updateCart();
    }

    function clearCart() {
        cart.length = 0;
        updateCart();
    }

    function toggleCart() {
        const cartDiv = document.getElementById('cart');
        cartDiv.style.display = cartDiv.style.display === 'none' ? 'block' : 'none';
    }
</script>

    </body>
</html>
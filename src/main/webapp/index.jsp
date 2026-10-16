<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>QuickBite | Food, delivered happily</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<header class="topbar">
  <a class="brand" href="${pageContext.request.contextPath}/">quick<span>bite</span></a>
  <nav><a href="#restaurants">Restaurants</a><a href="#how">How it works</a><button class="cart" onclick="showOrder()">Your order <b id="count">0</b></button></nav>
</header>
<main>
  <section class="hero">
    <div class="hero-copy">
      <p class="eyebrow">GOOD FOOD. GOOD MOOD.</p>
      <h1>Your next<br><em>great meal</em><br>is right here.</h1>
      <p class="sub">Discover local favourites and comforting classics, delivered to your door.</p>
      <a class="cta" href="#restaurants">Explore the menu <span>→</span></a>
      <div class="mini-note">● Demo project · Sample menu · No real orders</div>
    </div>
    <div class="hero-art">
      <div class="sun"></div><div class="plate"><div class="food">🍛</div></div>
      <div class="floating-tag tag-one">✨ Freshly made</div><div class="floating-tag tag-two">♥ Made with care</div>
    </div>
  </section>
  <section class="section" id="restaurants">
    <div class="section-head"><div><p class="eyebrow">A LITTLE SOMETHING FOR EVERYONE</p><h2>Popular picks</h2></div><span class="muted">Our demo menu</span></div>
    <div class="cards">
      <article class="food-card"><div class="food-image dosa">🥞<span>BESTSELLER</span></div><div class="food-info"><div><h3>Masala Dosa</h3><p>Crispy · South Indian</p></div><strong>₹120</strong></div><button onclick="addItem('Masala Dosa',120)">Add to order +</button></article>
      <article class="food-card"><div class="food-image biryani">🍲<span>CHEF'S PICK</span></div><div class="food-info"><div><h3>Veg Dum Biryani</h3><p>Fragrant · Indian</p></div><strong>₹180</strong></div><button onclick="addItem('Veg Dum Biryani',180)">Add to order +</button></article>
      <article class="food-card"><div class="food-image burger">🍔<span>FAN FAVOURITE</span></div><div class="food-info"><div><h3>Classic Burger</h3><p>Juicy · Continental</p></div><strong>₹150</strong></div><button onclick="addItem('Classic Burger',150)">Add to order +</button></article>
      <article class="food-card"><div class="food-image dessert">🍰<span>SWEET TREAT</span></div><div class="food-info"><div><h3>Chocolate Cake</h3><p>Rich · Dessert</p></div><strong>₹90</strong></div><button onclick="addItem('Chocolate Cake',90)">Add to order +</button></article>
    </div>
  </section>
  <section class="how" id="how"><div><p class="eyebrow">EASY AS 1, 2, 3</p><h2>Good food, less fuss.</h2></div><div class="steps"><div><b>01</b><h3>Pick a favourite</h3><p>Explore the sample menu.</p></div><div><b>02</b><h3>Add to your order</h3><p>Try the buttons — it's a demo.</p></div><div><b>03</b><h3>You're all set</h3><p>Use the app to practise CI/CD.</p></div></div></section>
</main>
<footer>QuickBite <span>• Fictional demo app for Jenkins + Tomcat practice</span></footer>
<script>
let orderCount = 0;
let total = 0;
function addItem(name, price) {
  orderCount++; total += price;
  document.getElementById('count').textContent = orderCount;
  alert(name + ' added to your demo order. Total: ₹' + total);
}
function showOrder() { alert('Demo order: ' + orderCount + ' item(s), total ₹' + total + '. No real order is placed.'); }
</script>
</body>
</html>

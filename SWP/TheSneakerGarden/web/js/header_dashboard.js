
if (window.location.href.toString().endsWith("/dashboard.jsp") || window.location.href.toString().endsWith("/")) {
    let home = document.getElementById("dashboard");
    home.className = "active"
}
if (window.location.href.toString().endsWith("/user-management.jsp")) {
    let home = document.getElementById("user-management");
    home.className = "active"
}

if (window.location.href.toString().endsWith("/item-management.jsp")) {
    let home = document.getElementById("item-management");
    home.className = "active"
}

if (window.location.href.toString().endsWith("/order-management.jsp")) {
    let home = document.getElementById("order-management");
    home.className = "active"
}

if (window.location.href.toString().endsWith("inventory-management.jsp")) {
    let home = document.getElementById("inventory-management");
    home.className = "active"
}

//Configure MySQL Connection
var mysql = require("mysql");
var inquirer = require('inquirer');

var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "",
    database: "bamazon"
});

// Make MySQL Connection
function main() {
    return new Promise(function(resolve, reject) {
        connection.connect(function (err) {
            if (err) throw err;
            console.log("connected as id " + connection.threadId);
        });
    });
};

main()
.then(displayAllItems)
.then(itemBuy)



function itemBuy() {
    inquirer
        .prompt([
            {
                type: "input",
                message: "What is the ID of the Item you'd like to purchase?",
                name: "itemId"
            },
            {
                type: "input",
                message: "How many of these would you like?",
                name: "itemQty"
            },
        ]).then(function(answers) {
            // console.log("answers",answers);
            connection.query("SELECT * FROM product where item_id = " + answers.itemId, function (err, data) {
                // console.log(data);
                if (err) throw err;
                // console.log("stock/order",data[0].stock_quantity,answers.itemQty);
                if (data[0].stock_quantity < parseInt(answers.itemQty)) {
                    console.log("\nInsufficient quantity!\n");
                } else {
                    // console.log("stock/order2",data[0].stock_quantity,answers.itemQty);
                    var remain = data[0].stock_quantity - answers.itemQty;
                    var totalCost = answers.itemQty * data[0].price;
                    var itemName = data[0].product_name;
                    connection.query("update product set stock_quantity = stock_quantity - " + answers.itemQty + " where item_id = " + answers.itemId, function (err, data) {
                        if (err) throw err;
                        console.log("\nYou have purchased " + answers.itemQty + " \"" + itemName + "\" for $" + totalCost + " there are " + remain + " left.");
                    });
                };
                connection.end();
            });
        });

}

// Display 
function displayAllItems() {
    output = '';
    connection.query("SELECT * FROM product", function (err, data) {
        if (err) throw err;
        data.forEach(function (elem) {
            output += `\n${elem.item_id}:\t${elem.product_name} - ${elem.price}`
        });
        console.log(output);
    });
}
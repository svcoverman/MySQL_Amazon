let mysql = require("mysql");
let inquirer = require("inquirer");

let connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "password",
    database: "bamazon"
});

connection.connect(function(err){
    if (err) throw err;
});

let display = function() {
    connection.query("SELECT * FROM Products", function(err, results) {
        if (err) throw err;
        console.table(results);
    })
};

let run = function() {
        connection.query("SELECT * FROM Products", function(err, results) {
        if (err) throw err;
        inquirer.prompt([
            {
                name: "product_name",
                type: "list",
                choices: function() {
                    let choiceArray = [];
                    for (let i = 0; i < results.length; i++) {
                        choiceArray.push(results[i].product_name);
                    }
                    return choiceArray;
                },
                message: "What product would you like to buy?"
            },
            {
                name: "stock_quantity",
                type: "input",
                message: "How many would you like to purchase?"
            }
        
        ]).then(function(answer) {
            let chosenProduct;
            for (let i = 0; i < results.length; i++) {
                if (results[i].product_name === answer.product_name) {
                    chosenProduct = results[i];
                }
            }
            // console.log(chosenProduct);
            if (chosenProduct.stock_quantity > parseInt(answer.stock_quantity)) {
                connection.query("UPDATE Products SET ? WHERE ?", [
                {
                stock_quantity: chosenProduct.stock_quantity - parseInt(answer.stock_quantity)
                },
                {
                    id: chosenProduct.id
                }], function(error) {
                    if (error) throw err;
                    console.log("\n\n");
                    console.log("==============================================");
                    console.log("Product purchased successfully!");
                    console.log("==============================================");
                    console.log("Purchase Summary");
                    console.log("-----------------------------");
                    console.log("Item Name: " +  chosenProduct.product_name);
                    console.log("Item Count: " + parseInt(answer.stock_quantity));
                    console.log("-----------------------------");
                    console.log("Total: " + "$" + (chosenProduct.price * parseInt(answer.stock_quantity)));
                    console.log("==============================================");
                    console.log("\n\n");
                    display();
                    run();
                })
            } else {
                console.log("==============================================");
                console.log("Insufficient stock.");
                console.log("==============================================");
                display();
                run();
            }
        });
    });
};

display();
run();
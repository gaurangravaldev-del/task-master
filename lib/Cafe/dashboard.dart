import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

enum Payments { Cash, Online }

class _DashboardScreenState extends State<DashboardScreen> {
  static var price = 0;
  var dropdown;
  final _formKey = GlobalKey<FormState>();
  Payments _site = Payments.Cash;

  bool coffee = false;
  bool tea = false;
  bool coke = false;
  bool grill_sandwich = false;
  bool veg_sandwich = false;
  bool burger = false;
  bool vadapav = false;
  bool cheese_balls = false;
  bool chocolate_browine = false;
  bool vanila_ice_cream = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Welcome Admin',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 50),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                child: DropdownButtonFormField<String>(
                  validator: (value) {
                    if (value == null) {
                      return 'Please Select Table No';
                    }
                    return null;
                  },
                  hint: dropdown == null
                      ? Text('Table No')
                      : Text('Select Table No'),
                  decoration: InputDecoration(
                    labelText: 'Select Table No',
                    hintText: 'Select Table No',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (String? value) {
                    dropdown = value;
                  },
                  items: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
                      .map((String drop) {
                        return DropdownMenuItem<String>(
                          value: drop,
                          child: Text(drop),
                        );
                      })
                      .toList(),
                ),
              ),
              CheckboxListTile(
                title: Text('Coffee', style: TextStyle(fontSize: 18)),
                subtitle: Text('Price: 100Rs', style: TextStyle(fontSize: 12)),
                value: coffee,
                onChanged: (value) {
                  setState(() {
                    this.coffee = value!;
                    if (coffee) {
                      price += 100;
                    } else {
                      price -= 100;
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Tea', style: TextStyle(fontSize: 18)),
                subtitle: Text('Price: 80Rs', style: TextStyle(fontSize: 12)),
                value: tea,
                onChanged: (value) {
                  setState(() {
                    this.tea = value!;
                    if (tea) {
                      price += 80;
                    } else {
                      price -= 80;
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Coke', style: TextStyle(fontSize: 18)),
                subtitle: Text('Price: 50Rs', style: TextStyle(fontSize: 12)),
                value: coke,
                onChanged: (value) {
                  setState(() {
                    this.coke = value!;
                    if (coke) {
                      price += 50;
                    } else {
                      price -= 50;
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Grill Sandwich', style: TextStyle(fontSize: 18)),
                subtitle: Text('Price: 100Rs', style: TextStyle(fontSize: 12)),
                value: grill_sandwich,
                onChanged: (value) {
                  setState(() {
                    this.grill_sandwich = value!;
                    if (grill_sandwich) {
                      price += 100;
                    } else {
                      price -= 100;
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Veg Sandwich', style: TextStyle(fontSize: 18)),
                subtitle: Text('Price: 80Rs', style: TextStyle(fontSize: 12)),
                value: veg_sandwich,
                onChanged: (value) {
                  setState(() {
                    this.veg_sandwich = value!;
                    if (veg_sandwich) {
                      price += 80;
                    } else {
                      price -= 80;
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Burger', style: TextStyle(fontSize: 18)),
                subtitle: Text('Price: 80Rs', style: TextStyle(fontSize: 12)),
                value: burger,
                onChanged: (value) {
                  setState(() {
                    this.burger = value!;
                    if (burger) {
                      price += 80;
                    } else {
                      price -= 80;
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Vada Pav', style: TextStyle(fontSize: 18)),
                subtitle: Text('Price: 80Rs', style: TextStyle(fontSize: 12)),
                value: vadapav,
                onChanged: (value) {
                  setState(() {
                    this.vadapav = value!;
                    if (vadapav) {
                      price += 80;
                    } else {
                      price -= 80;
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Cheese Balls', style: TextStyle(fontSize: 18)),
                subtitle: Text('Price: 180Rs', style: TextStyle(fontSize: 12)),
                value: cheese_balls,
                onChanged: (value) {
                  setState(() {
                    this.cheese_balls = value!;
                    if (cheese_balls) {
                      price += 180;
                    } else {
                      price -= 180;
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  'Chocolate Brownie',
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text('Price: 100Rs', style: TextStyle(fontSize: 12)),
                value: chocolate_browine,
                onChanged: (value) {
                  setState(() {
                    this.chocolate_browine = value!;
                    if (chocolate_browine) {
                      price += 100;
                    } else {
                      price -= 100;
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  'Vanila Ice- Cream',
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text('Price: 50Rs', style: TextStyle(fontSize: 12)),
                value: vanila_ice_cream,
                onChanged: (value) {
                  setState(() {
                    this.vanila_ice_cream = value!;
                    if (vanila_ice_cream) {
                      price += 50;
                    } else {
                      price -= 50;
                    }
                  });
                },
              ),
              SizedBox(height: 15),
              Container(
                height: 75,
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && coffee ||
                        tea ||
                        coke ||
                        grill_sandwich ||
                        veg_sandwich ||
                        burger ||
                        vadapav ||
                        cheese_balls ||
                        chocolate_browine ||
                        vanila_ice_cream) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Order Place Successfully!")),
                      );
                      showDialog(
                        context: context,
                        builder: (context) => StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              title: Text('Order History'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Table No $dropdown',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  if (coffee == true)
                                    Text(
                                      'Coffee: 100Rs',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  if (tea == true)
                                    Text(
                                      'Tea: 80Rs',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  if (coke == true)
                                    Text(
                                      'Coke: 50Rs',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  if (grill_sandwich == true)
                                    Text(
                                      'Grill Sandwich: 100Rs',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  if (veg_sandwich == true)
                                    Text(
                                      'Veg Sandwich: 80Rs',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  if (burger == true)
                                    Text(
                                      'Burger: 80 Rs',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  if (vadapav == true)
                                    Text(
                                      'Vadapav: 80Rs',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  if (cheese_balls == true)
                                    Text(
                                      'Cheese Balls: 180Rs',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  if (chocolate_browine == true)
                                    Text(
                                      'Chocolate Brownie: 100Rs',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  if (vanila_ice_cream == true)
                                    Text(
                                      'Vanila Ice Cream: 50Rs',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  SizedBox(height: 15),
                                  Text(
                                    'Total Price: $price',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  ListTile(
                                    title: const Text('Cash'),
                                    leading: Radio(
                                      value: Payments.Cash,
                                      groupValue: _site,
                                      onChanged: (value) {
                                        setState(() {
                                          _site = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: const Text('Online'),
                                    leading: Radio(
                                      value: Payments.Online,
                                      groupValue: _site,
                                      onChanged: (value) {
                                        setState(() {
                                          _site = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Something Went Wrong!")),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.teal),
                  ),
                  child: Text(
                    'Place Order',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

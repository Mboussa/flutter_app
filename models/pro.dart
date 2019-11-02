import 'employee.dart';
import 'prestation.dart';

class Pro {
  String name;
  int waiting;
  List<Prestation> prestations = [
    Prestation("Coupe", 11, 15),
    Prestation("Barbe", 7, 7),
    Prestation("Brushing", 17, 20),
  ];
  List<Employee> employees = [
    Employee('Sara', "https://images.unsplash.com/photo-1524593689594-aae2f26b75ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1900&q=80", 43),
    Employee('Axel', "https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=60", 27),
    Employee('Puppy', "https://images.unsplash.com/photo-1537815749002-de6a533c64db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", 12),
    Employee('Green', "https://images.unsplash.com/photo-1558898479-33c0057a5d12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", 6),
  ];

  Pro(String name, int waiting) {
    this.name = name;
    this.waiting = waiting;
  }
}
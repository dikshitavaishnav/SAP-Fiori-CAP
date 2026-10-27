namespace my.orders;

using { cuid, managed } from '@sap/cds/common';

entity Orders : cuid, managed {
  orderNumber : String(20);
  customer    : String(100);
  totalAmount : Decimal(10, 2);
  currency    : String(3);
  items       : Composition of many OrderItems on items.parent = $self;
}

entity OrderItems : cuid {
  parent      : Association to Orders;
  itemPosition: Integer;
  productName : String(100);
  quantity    : Integer;
  price       : Decimal(10, 2);
}

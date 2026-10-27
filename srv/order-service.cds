using my.orders as my from '../db/schema';

service OrderService {
  @odata.draft.enabled
  entity Orders as projection on my.Orders;
  
  entity OrderItems as projection on my.OrderItems;
}

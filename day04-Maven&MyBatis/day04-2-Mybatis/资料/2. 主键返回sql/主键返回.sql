
drop table if exists tb_order  ;
drop table if exists tb_order_item  ;

create table tb_order
(
    id       int       primary key auto_increment,
    payment double , -- 订单总金额
    payment_type int , -- 订单支付方式：1.微信支付 2.支付宝支付
    status int -- 订单状态：1. 未支付 2. 已支付
);

create table tb_order_item
(
    id       int       primary key auto_increment,
    goods_name varchar(20) , -- 商品名称
    goods_price double, -- 商品单价
    count varchar(32), -- 购买数量
    order_id int -- 订单id
);



insert into tb_order (payment, payment_type, status)
values (4887,1,2),(1975,1,1);

insert into tb_order_item (goods_name, goods_price, count, order_id)
values ('华为手机',3888,1,1),('华为pad',999,1,1)
,('小米手机',888,2,2),('小米手环',199,1,2);
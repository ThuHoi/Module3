use products;
alter table products drop index product_name;

-- Buoc 3:
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index Index_product on products (productCode);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create unique index product_name on products ( productName, productPrice);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index
select * from products where productCode = '1234';
explain select * from products where productCode = '1234';

select * from products where productName = 'iphone' and productPrice = '100';
explain select * from products where productName = 'iphone' and productPrice = '100';

-- Buoc 4:
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view product_views as

select  productCode, productName, productPrice, productStatus

from products;

select * from product_views;

-- Tiến hành sửa đổi view
update product_views 
set productStatus = 'moi'
where productCode = '2345';

-- Tiến hành xoá view
delete from product_views 
where productCode = '2345';


-- Buoc 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //

CREATE PROCEDURE findAllProducts()

BEGIN

  SELECT * FROM products;

END //

DELIMITER ;

call findAllProducts();

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE createProduct(in pro_id int, pr_Code int, pr_Name varchar(255),
                                pr_Price double, pr_Amount int, 
                                pr_Description varchar(255), pr_Status varchar(255))
Begin
insert into products value(pro_id,pr_Code, pr_Name , pr_Price,pr_Amount, pr_Description, pr_Status) ;
end//
DELIMITER ;
call createProduct(2, 2345,'samsung', 200, 3, 'mau den', 'moi');
drop procedure if exists createProduct;

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //

CREATE PROCEDURE editProduct(in edit_ID int, edit_Name varchar(255))

BEGIN

  update products
  set productName = edit_Name
  where id = edit_ID;

END //

DELIMITER ;
drop procedure if exists editProduct;
call editProduct(2, 'nokia');

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //

CREATE PROCEDURE deleteProduct(in delete_ID int)

BEGIN

  delete from  products
  where id = delete_ID;

END //

DELIMITER ;
drop procedure if exists deleteProduct;
call deleteProduct(2);










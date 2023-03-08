use selloldshop;

create table users(
                      usersId int primary key auto_increment,
                      usersName nvarchar(300) not null ,
                      usersPassWord text not null ,
                      userEmail text not null ,
                      userPhone int not null ,
                      userCompany text not null ,
                      billingAddress text not null,
                      shippingAdress text not null ,
                      permission int default 0 ,
                      userStatus bit default 1
);

create table catalog(
                        catalogId int primary key auto_increment,
                        catalogName nvarchar(300) not null,
                        catalogStatus bit default 1
);

create table size (
                      sizeId int primary key auto_increment,
                      sizeName nvarchar(100) not null ,
                      sizeStatus bit default 1
);
create table color(
                      colorId int primary key auto_increment,
                      colorName nvarchar(200) not null ,
                      colorStatus bit default 1
);
create table  gender(
                        genderId int primary key auto_increment,
                        genderName nvarchar(200) not null ,
                        genderStatus bit default 1
);

create table about(
                      aboutId int primary key auto_increment,
                      aboutImage text not null ,
                      aboutDescription text,
                      aboutAddress text,
                      phoneNumber int,
                      emailAbout text,
                      aboutStatus bit default 1
);
create table collection(
                           collectionId int primary key auto_increment,
                           collectionName text not null ,
                           imageCollection text not null ,
                           collectionDescription text,
                           collectionStatus bit default 1
);
create table product(
                        productId int primary key auto_increment,
                        productName text not null ,
                        catalogId int not null ,
                        foreign key (catalogId) references catalog(catalogId),
                        genderId int not null ,
                        foreign key (genderId) references gender(genderId),
                        collectionId int not null ,
                        foreign key (collectionId) references  collection(collectionId),
                        productImage text not null ,
                        productTitle text,
                        productDescription text,
                        productPrice double not null ,
                        discount double,
                        productStatus int default 0
);



create  table productDetails(
                                productDetailsId int primary key auto_increment,
                                productId int not null ,
                                foreign key (productId) references product(productId),
                                sizeId int not null ,
                                foreign key (sizeId) references size(sizeId),
                                colorId int not null ,
                                foreign key (colorId) references color(colorId),
                                priceProductDetails double not null ,
                                quantity int not null ,
                                productDetailsStatus int default 0
);

create table subImage(
                         subImageId int primary key auto_increment,
                         subImageLink text not null ,
                         productDetailsId int not null ,
                         foreign key (productDetailsId) references productDetails(productDetailsId)
);

create table  carts(
                       cartId int primary key auto_increment,
                       usersId int not null ,
                       foreign key (usersId) references users(usersId),
                       subtotal double,
                       email text,
                       fristName text,
                       lastName text not null ,
                       phone int not null ,
                       companyName text,
                       country text,
                       zipCode text,
                       houseNumber int ,
                       apartment text not null ,
                       streetName text not null ,
                       city text not null ,
                       state int default 0



);
create table cartDetails(
                            cartDetailsId int primary key auto_increment,
                            cartId int not null ,
                            foreign key (cartId) references carts(cartId),
                            productDetailsId int not null ,
                            foreign key (productDetailsId) references productDetails(productDetailsId),
                            cartDetailsPrice double,
                            cartDetailsQuantity int

);


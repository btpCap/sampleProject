@path:'/browse'
service CatalogService {

  entity Books {
    key ID : UUID;
    title  : String;
    descr  : String;
    author : Association to Authors;
  }

  entity Authors {
    key ID : UUID;
    name   : String;
    books  : Association to many Books on books.author=$self;
    birth  : Date;
    death  : Date;
  }

}
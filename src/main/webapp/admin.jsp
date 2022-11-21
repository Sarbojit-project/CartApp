<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.User"%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not loggin !!  Login first");
        response.sendRedirect("login.jsp");

        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin cannot access this page !!");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>


    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container admin">
            <div clas ="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
                
            </div>
            <div class="row mt-3">
                <!-- first col -->
                <div class="col-md-4">
                    <!-- first box -->
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon">
                            </div>
                            <h1>123</h1>
                            <h1  class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <!-- second box -->
                    <div class="card">
                        <div class="card-body text-center">


                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/add.png" alt="user_icon">
                            </div>


                            <h1>234</h1>
                            <h1 class="text-uppercase text-muted" >Categories</h1>
                        </div>
                    </div>

                </div>
                <div class="col-md-4">
                    <div class="card" >
                        <div class="card-body text-center">


                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/man.png" alt="user_icon">
                            </div>

                            <h1>455</h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>
            </div>

            <!-- second row -->
            <div class="row mt-3">

                <!-- second row  first column-->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/maths.png" alt="user_icon">
                            </div>
                            <p class="mt-3">Click here to add new Category</p>

                            <h1  class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>
                </div>
                <!-- second row second column -->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/system.png" alt="user_icon">
                            </div>
                            <p class="mt-2">Click here to add new new product</p>
                            <h1  class="text-uppercase text-muted"> Add Products</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- add category modal -->
        <!-- Button trigger modal -->
       

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory">
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter your category title"  required />
                            </div>
                            <div class="form-group">
                                <textarea style="height:350px;" class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>
                            </div>
                            <div class="container text-center">
                                <button class=" btn btn-outline-success">Add Category</button>
                                 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                     
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                                              </div>
                </div>
            </div>
        </div>
        <!-- end of category modal -->
        
        
        <!-- add product modal -->
        <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
              
              <input type="hidden" name="operation" value="addproduct" />
              <div class="form-group">
                  <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required />
                  
              </div>
              <div class="form-group">
                  <textarea style="height:150px;" class="form-control" placeholder="Enter product description" name="pDesc"></textarea>
              </div>
              <div class="form-group">
                  <input type="number" class="form-control" placeholder="Enter product price" name="pPrice" required />
                  
              </div>
              <div class="form-group">
                  <input type="number" class="form-control" placeholder="Enter product discount" name="pDiscount" required />
                  
              </div>
              <div class="form-group">
                  <input type="number" class="form-control" placeholder="Enter product quantity" name="pQuantity" required />
                  
              </div>
              <% 
              CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
              List<Category> list=cdao.getCategories();
              
              %>
              <div class="form-group">
                  <select name="catId" class="form-control" id="">
                  
                  
                      <% for(Category c:list){
                      %>
                          
                      <option value="<%= c.getCategoryId() %>"><%=c.getCategoryTitle() %></option>
                      
                      <% 
                          }
                      %>
                  </select>
              </div>
              <div class="form-group"><!--  -->
                  <label for="">Select picture of the product</label>
                  <br>
                  <input type="file" id="pPic" name="pPic" required />
              
              </div>
              <div class="container text-center">
                  <button class="btn btn-outline-success">Add product</button>
              </div>
          </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
       
      </div>
    </div>
  </div>
</div>
<!-- end of product -->
    </body>
</html>

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function confirmBuy(){
    if(confirm("Bạn cần đăng nhập để mua hàng ?")===true){
        window.location.href = "login";
    }else{
        window.location.href = "OrderManagerServlet?action=View Cart";
    };
}

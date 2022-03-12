// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require("jquery")
import"jquery"

import "bootstrap"
//= require sb-admin-2.min
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "./sb-admin-2.min"
Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "@fortawesome/fontawesome-free/css/all"

document.addEventListener("turbolinks:load", function() {
  $("#buscador_productos").keyup(function(event){
      console.log("fuera")
      let termino = $(this).val();
      console.log(termino)

      let id_modelo = $(this).data("model");
      let tipo_modelo = $(this).data("tipo");
      if(termino.length == 0) {
        console.log("if")

          $("#tabla_buscador tbody").empty();
      }
      else {
        console.log('else')
        console.log(termino)
        console.log(getRootUrl())

        const request_url = getRootUrl() + "/buscador_productos/" + termino;

        console.log(request_url)
        $.get(request_url, function(data, status){

        console.log(request_url)
        console.log(data)
        console.log(data.length)
          if(data.length > 0)  {
              $("#tabla_buscador tbody").empty();
              for(let x in data){
                console.log("hola Cristoph")
                let nombre_producto = data[x].nombre_producto;
                let existencia = data[x].existencia;
                let id_producto = data[x].id;
                console.log(nombre_producto);
                let newRowContent = `<tr>
                                    <td>${nombre_producto}</td>
                                    <td>${existencia}</td>
                                    <td><button type="button" class="btn btn-primary" onclick=" seleccionarProducto(${id_producto}, ${id_modelo}, '${tipo_modelo}')">
                                        Agregar
                                        </button>
                                    </td>
                                 </tr>`;
                $("#tabla_buscador tbody").append(newRowContent);
              }
          }
          else {
              $("#tabla_buscador tbody").empty();

            let newRowContent = `<tr>
                                    <td> No hay conincidenciaas :c pipipi </td>
                                    <td> </td>
                                    <td>
                                    </td>
                                 </tr>`;
                $("#tabla_buscador tbody").append(newRowContent);

          }
        });
      }
  });
 ////////

(function(module, exports) {
  window.seleccionarProducto = function(id_producto,id_modelo, tipo_modelo) {
      console.log("dentro de la funcion seleccionarProducto")
   switch(tipo_modelo){
     case'sales':
     agregarItemVent(id_producto,id_modelo)
     break;
     case 'warehouse':
       break;
  };
};

d
}.call(this));



 function agregarItemVent(id_producto,id_venta){
   let cantidad_inicial = $('#cantidad_producto').val();
   let request_url = getRootUrl() + "/add_item_venta";
   console.log(request_url);
   let info = { producto_id: id_producto, id: id_venta, cantidad: cantidad_inicial}
   console.log(info);

   $.ajax({  //peticion por ajax
     url: request_url,
     type: 'POST',
     data: JSON.stringify(info), // convertimosa un formato que pueda ser enviado
     contentType: 'application/json; charset=utf-8',
     success: function(result) { // respuesta
     if( result != null ) {
         console.log(JSON.stringify(info))
         $("#buscador_producto").modal('hide');
         $('body').removeClass('modal-open');
         $('.modal-backdrop').remove();
         let cantidad = result.cantidad;
         let precio = result.precio_producto;
         let importe_item = result.importe_item;
         let importe_venta = result.importe_venta;
         let nombre_prod = result.nombre_prod;
         let newRowContent = `<tr>
                                <td>${nombre_prod}</td>
                                <td>${precio}</td>
                                <td>${cantidad}</td>
                                <td>$ ${importe_item}</td>
                             </tr>`;
         $("#tabla_ventas tbody").append(newRowContent);
         $("#importe_venta_lbl").text("Importe: $" + importe_venta);
       }
     }
   });
 }
 // fin de tubolinkgs
});




function getRootUrl() {
    return window.location.origin;
}
////
////////////////////////////////////////////////////////////////
////////////////////////////////

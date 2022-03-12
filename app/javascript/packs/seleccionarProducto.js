 export default function seleccionarProducto(id_producto,id_modelo, tipo_modelo){
   console.log("dentro de la funcion seleccionarProducto")
   switch(tipo_modelo){
     case'sales':
     agregarItemVent(id_producto,id_modelo)
     break;
     case 'warehouse':
       break;
   }
 }


//Obtener del DOM todos los campos a ser validados
let nombreComercialInput = document.querySelector("#nombreComercialInput");
let marcaSelect = document.querySelector("#marcaSelect");
let tipoSelect = document.querySelector("#tipoSelect");
let cantidadDeContenidoInput = document.querySelector("#cantidadDeContenidoInput");
let unidadDeMedidaSelect = document.querySelector("#unidadDeMedidaSelect");
let categoriasCheckBoxes = document.querySelectorAll("input[name='categorias']");

let inputsToValidate = [nombreComercialInput,marcaSelect,tipoSelect,cantidadDeContenidoInput,unidadDeMedidaSelect,categoriasCheckBoxes];

//Obtener el formulario de registro
let registerForm = document.querySelector("form");
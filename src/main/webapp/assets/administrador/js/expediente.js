class Accion {
	constructor(botones, bloques) {
		this.botones = botones;
        this.bloques = bloques;
    }


    show(index) {
        const boton = this.botones[index];
        const bloque = this.bloques[index];

        // Alternar visibilidad del bloque
        bloque.classList.toggle("mostrar");

        // Cambiar el texto del botón
        if (bloque.classList.contains("mostrar")) {
          boton.textContent = "Colapsar";
        } else {
          boton.textContent = "Ver";
        }
    }
}


let botones = document.querySelectorAll(".boton");
let bloques = document.querySelectorAll(".bloque");
let accion = new Accion(botones, bloques);

for (let i = 0; i < botones.length; i++) {
	botones[i].addEventListener("click", accion.show.bind(accion,i));
}


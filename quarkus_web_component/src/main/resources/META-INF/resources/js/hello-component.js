
class HelloComponent extends HTMLElement {

    // async connectedCallback() {
    //     this.innerHTML = "Hello from Web Component!";
    // }

    async connectedCallback() {
        const response = await fetch("/hello");
        const { greeting } = await response.json();
        this.innerHTML = `<h1 style="text-align:center; margin-top: 120px;"> ${greeting} </h1> `;
    }

}

customElements.define("hello-component", HelloComponent);
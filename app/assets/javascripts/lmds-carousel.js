// Creation of the carousel with custom options : number of visible slide (1) and number of scrollable slide when we press the next/prev arrow (1)
class Carousel { 
    constructor (element, options ={}) {
        this.element = element
        this.options = Object.assign({}, {
            slideToScroll: 1,
            slideVisible: 1
        }, options)
        let children = [].slice.call(element.children) // Creation of an array that contains all the slides at this moment of the script loading
        this.currentItem = 0
        // Creation of mandatory divs to generate the carousel 
        this.root = this.createDivWithClass('carousel'); 
        this.container = this.createDivWithClass('carousel__container');
        this.root.appendChild(this.container)
        this.element.appendChild(this.root)
        this.items = children.map((child) => {
            let item = this.createDivWithClass('carousel__item')
            item.appendChild(child)
            this.container.appendChild(item)
            return item
        })
        this.setStyle()
        this.createNavigation()
    }

    setStyle () {
        let ratio = this.items.length / this.options.slideVisible
        this.container.style.width = (ratio * 100) + "%"
        this.items.forEach(item => item.style.width = ((100 / this.options.slideVisible) / ratio) + "%" )// Calculate the width of a slide so that it is 100% of the width of the container / by the number of items
    }

    createNavigation () { // Creation of the arrows
        let nextButton = this.createDivWithClass('carousel__next bi bi-arrow-right-circle')
        let prevButton = this.createDivWithClass('carousel__prev bi bi-arrow-left-circle')
        this.root.appendChild(nextButton)
        this.root.appendChild(prevButton)
        nextButton.addEventListener('click', this.next.bind(this))
        prevButton.addEventListener('click', this.prev.bind(this))
    }

    next () { // Behavior of the "next" arrow
        this.goToItem(this.currentItem + this.options.slideToScroll)
    }

    prev () { // Behavior of the "prev" arrow
        this.goToItem(this.currentItem - this.options.slideToScroll)
    }

    goToItem (index) { // Calculus of the scrolling function
        if (index < 0) {
            index = this.items.length - this.options.slideVisible
        }
        else if (index >= this.items.length) {
            index = 0
        }
        let translateX = index * -100 / this.items.length
        this.container.style.transform = 'translate3d(' + translateX + '%, 0, 0)'
        this.currentItem = index

    }

    createDivWithClass(className) { // Creation of a div with a specific class
        let div = document.createElement('div')
        div.setAttribute('class', className)
        return div
    }
}


document.addEventListener('DOMContentLoaded', function () { // We wait the total load of the DOM to start the function.

    new Carousel(document.querySelector('#carousel1'), {
        slideToScroll: 1,
        slideVisible : 1
    })

})
class Carousel {
    constructor (element, options ={}) {
        this.element = element
        this.options = Object.assign({}, {
            slideToScroll: 1,
            slideVisible: 1
        }, options)
        let children = [].slice.call(element.children)
        this.currentItem = 0
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
        this.items.forEach(item => item.style.width = ((100 / this.options.slideVisible) / ratio) + "%" )// CALCUL LA LARGEUR D'UNE SLIDE POUR QU'ELLE FASSE 100% de la largeur du container / par le nombre de d'item)
    }

    createNavigation () {
        let nextButton = this.createDivWithClass('carousel__next bi bi-arrow-right-circle')
        let prevButton = this.createDivWithClass('carousel__prev bi bi-arrow-left-circle')
        this.root.appendChild(nextButton)
        this.root.appendChild(prevButton)
        nextButton.addEventListener('click', this.next.bind(this))
        prevButton.addEventListener('click', this.prev.bind(this))
    }

    next () {
        this.goToItem(this.currentItem + this.options.slideToScroll)
    }

    prev () {
        this.goToItem(this.currentItem - this.options.slideToScroll)
    }

    goToItem (index) {
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

    createDivWithClass(className) {
        let div = document.createElement('div')
        div.setAttribute('class', className)
        return div
    }
}


document.addEventListener('DOMContentLoaded', function () { // We wait the total load of the DOM before start the function.

    new Carousel(document.querySelector('#carousel1'), {
        slideToScroll: 1,
        slideVisible : 1
    })

})
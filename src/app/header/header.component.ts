import { Component } from '@angular/core';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent {
  ngOnInit(){

  }
  // shadowSidebar(){
  //   const burgerMenu = document.querySelector( '.burger_menu');
  //   const sideBar = document.querySelector('.sidebar')
  //
  //   document.addEventListener( 'click', (e) => {
  //     const withinBoundaries = e.composedPath().includes(burgerMenu);
  //     const body = document.querySelector('body')
  //
  //     if ( ! withinBoundaries ) {
  //       // @ts-ignore
  //       sideBar.classList.remove('sidebarNg')
  //       sideBar.classList.remove('shadow')
  //       body.classList.remove('overflow')
  //     }
  //   })
  // }
  openRegistrationMenu(){
    const registrationMenu = document.querySelector('.online-registration')
    const overlay = document.querySelector('.overlay')
    // @ts-ignore
    overlay.classList.remove('hidden')
    // @ts-ignore
    registrationMenu.classList.add("show")
  }
  closeRegistrationMenu(){
    const registrationMenu = document.querySelector('.online-registration')
    const overlay = document.querySelector('.overlay')
    // @ts-ignore
    overlay.classList.add('hidden')
    // @ts-ignore
    registrationMenu.classList.remove("show")
  }


  openBurgerMenu() {
    // @ts-ignore
    const burger_menu = document.querySelector('.burger-menu')
    const overlay = document.querySelector('.overlay')

    // @ts-ignore
    overlay.classList.remove('hidden')
    // @ts-ignore
    burger_menu.classList.add("show")
  }
  closeBurgerMenu(){

    const burger_menu = document.querySelector('.burger-menu')
    const overlay = document.querySelector('.overlay')

    // @ts-ignore
    overlay.classList.add('hidden')
    //@ts-ignore
    burger_menu.classList.remove("show")

  }
}

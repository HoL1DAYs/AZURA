import { Component } from '@angular/core';

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss']
})
export class FooterComponent {

  openRegistrationMenu(){
    const registrationMenu = document.querySelector('.online-registration')
    const overlay = document.querySelector('.overlay')
    const onlineRegMain = document.querySelector('.online-registration-main')
    const body = document.querySelector('body')

    body.classList.add('overflow')
    onlineRegMain.classList.remove('hidden')
    overlay.classList.remove('hidden')
    registrationMenu.classList.add("show")
  }

}

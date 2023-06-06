import { Component } from '@angular/core';
import {RequestService} from "../request.service";
import {ActivatedRoute} from "@angular/router";

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent {
  masters: []
  services: []
  operationType:[]
  ngOnInit(){
    this.getInfo()
  }
  constructor(private reqService: RequestService, private route: ActivatedRoute) {
  }


  getInfo(){
    this.reqService.getMaster().subscribe(data=>{
      this.masters = data
    })
    this.reqService.getEntry().subscribe(data=>{
      this.services = data
    })
    this.reqService.getOperationType().subscribe(data=>{
      this.operationType = data
    })
  }
  registrAgain(){
    this.closeRegistration();
    this.openRegistrationMenu();
  }


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


  closeRegistrationMenu(){
    const registrationMenu = document.querySelector('.online-registration')
    const overlay = document.querySelector('.overlay')
    const body = document.querySelector('body')

    body.classList.remove('overflow')
    overlay.classList.add('hidden')
    registrationMenu.classList.remove("show")
  }


  openBurgerMenu() {
    const burger_menu = document.querySelector('.burger-menu')
    const overlay = document.querySelector('.overlay')
    const body = document.querySelector('body')

    body.classList.add('overflow')
    overlay.classList.remove('hidden')
    burger_menu.classList.add("show")
  }


  closeBurgerMenu(){
    const body = document.querySelector('body')
    const burger_menu = document.querySelector('.burger-menu')
    const overlay = document.querySelector('.overlay')
    const registrationMenu = document.querySelector('.online-registration')

    registrationMenu.classList.remove("show")
    body.classList.remove('overflow')
    overlay.classList.add('hidden')
    burger_menu.classList.remove("show")

  }


  openChoiceOfServicesMenu(){
    const choiceOfServicesMenu = document.querySelector('.choice-of-services')
    const totalMenu = document.querySelector('.online-registration-main-total')
    const main = document.querySelector('.online-registration-main')


    totalMenu.classList.remove('hidden')
    choiceOfServicesMenu.classList.remove('hidden')
    main.classList.add('hidden')
  }


  openChoiceOfMastersMenu(){
    const choiceOfMastersMenu = document.querySelector('.choice-of-masters')
    const choiceOfServicesMenu = document.querySelector('.choice-of-services')
    choiceOfMastersMenu.classList.remove('hidden')
    choiceOfServicesMenu.classList.add('hidden')
  }


  displayChoiceOfMastersBtn(){
    const btn = document.querySelector('.choice-of-masters-btn')

    btn.classList.remove('hidden')
  }


  openOnlineRegistration(){
    const calendar = document.querySelector('.online-registration__calendar')
    calendar.classList.remove('hidden')
  }


  openCheckPopup(){
    const popup   = document.querySelector('.confirmation-popup')
    const popupOverlay = document.querySelector('.popup-overlay')
    popup.classList.remove('hidden')
    popupOverlay.classList.remove('hidden')


  }
  closeCheckPopup(){
    const popup   = document.querySelector('.confirmation-popup')
    const popupOverlay = document.querySelector('.popup-overlay')
    popup.classList.add('hidden')
    popupOverlay.classList.add('hidden')


  }

  openForm() {
    const form = document.querySelector('.customer-info')
    const popup = document.querySelector('.confirmation-popup')
    const popupOverlay = document.querySelector('.popup-overlay')
    const calendar = document.querySelector('.online-registration__calendar')
    calendar.classList.add('hidden')
    popup.classList.add('hidden')
    popupOverlay.classList.add('hidden')
    form.classList.remove('hidden')
  }

  openSamary() {
    const choiceOfServicesMenu = document.querySelector('.choice-of-services')
    const choiceOfMastersMenu = document.querySelector('.choice-of-masters')
    const form = document.querySelector('.customer-info')
    const onlineRegistration= document.querySelector('.online-registration')
    const onlineRegMain = document.querySelector('.online-registration-main')
    const confirmationCard = document.querySelector('.confirmation-card')
    const totalMenu = document.querySelector('.online-registration-main-total')
    totalMenu.classList.add('hidden')
    choiceOfMastersMenu.classList.add('hidden')
    choiceOfServicesMenu.classList.add('hidden')
    form.classList.add('hidden')
    onlineRegMain.classList.add('hidden')
    confirmationCard.classList.remove('hidden')
    onlineRegistration.classList.add('zero-height')
  }

  closeRegistration(){
    const registrationMenu = document.querySelector('.online-registration')
    const confirmationCard = document.querySelector('.confirmation-card')
    const overlay = document.querySelector('.overlay')
    const body = document.querySelector('body')

    body.classList.remove('overflow')
    registrationMenu.classList.remove("show")
    confirmationCard.classList.add('hidden')
    overlay.classList.add('hidden')
  }

  registrFromBurgerMenu(){
    this.closeBurgerMenu()
    this.openRegistrationMenu()
  }

}

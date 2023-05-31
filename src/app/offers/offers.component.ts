import { Component } from '@angular/core';
import {RequestService} from "../request.service";

@Component({
  selector: 'app-offers',
  templateUrl: './offers.component.html',
  styleUrls: ['./offers.component.scss']
})
export class OffersComponent {

  operations: []
  operationSubTypes: []

  ngOnInit(){
    this.getOperations()
    this.getOperationsSubType()

  }
  constructor(private reqService: RequestService) {
  }

  getOperations(){
    this.reqService.getOperation().subscribe(data=>{
      this.operations = data
    })
  }
  getOperationsSubType(){
    this.reqService.getSubType().subscribe(data=>{
      this.operationSubTypes = data
      console.log(data)
    })
  }

}

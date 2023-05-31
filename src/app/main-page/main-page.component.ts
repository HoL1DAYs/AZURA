import {Component, OnInit} from '@angular/core';
import {RequestService} from "../request.service";

@Component({
  selector: 'app-main-page',
  templateUrl: './main-page.component.html',
  styleUrls: ['./main-page.component.scss']
})
export class MainPageComponent implements OnInit{

  masters: []
  operations: []
  operationTypes: []



  ngOnInit(){
    this.getInfo()
    console.log(this.operations, this.masters)
  }
  constructor(private reqService: RequestService) {
  }
  getInfo(){
    this.reqService.getMaster().subscribe(data=>{
      this.masters = data
      console.log(this.operations, this.masters)
    })
    this.reqService.getOperation().subscribe(data=>{
      this.operations = data
      console.log(this.operations, this.masters)
    })
    this.reqService.getOperationType().subscribe(data=>{
      this.operationTypes = data
      console.log(data)
    })
    this.reqService.getSubType().subscribe(data=>console.log(data))
  }

}

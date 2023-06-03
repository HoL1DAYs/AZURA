import {Injectable} from "@angular/core";
import {HttpClient} from "@angular/common/http";


@Injectable({
  providedIn: 'root'
})
export class RequestService{
  constructor(private http: HttpClient) {
  }

  getEntry(master_id?: number, status?: string){
    return this.http.get<any>('//localhost:8080/api/v1/entry')
  }

  getMaster(master_id?: number){
    return this.http.get<any>('//localhost:8080/api/v1/master')
  }

  getOperation(){
    return this.http.get<any>('//localhost:8080/api/v1/operation')
  }
  getOperationType(operation_id?: number){
    return this.http.get<any>('http://localhost:8080/api/v1/type')
  }
  getSubType(subType_id?: number){
    return this.http.get<any>('http://localhost:8080/api/v1/subtype')
  }

  postOperationType(name?: string, about?: string, thumbnail?: string){
    return this.http.post('http://localhost:8080/api/v1/type', {
      name: name,
      about: about,
      thumbnail: thumbnail
    })
  }
  putOperationType(name?: string, about?: string, thumbnail?: string){
    return this.http.put('http://localhost:8080/api/v1/type', {
      name: name,
      about: about,
      thumbnail: thumbnail
    })
  }



}

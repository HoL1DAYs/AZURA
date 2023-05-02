import {NgModule} from "@angular/core";
import {RouterModule, Routes} from "@angular/router";
import {MainPageComponent} from "./main-page/main-page.component";
import {OffersComponent} from "./offers/offers.component";

 const appRoutes: Routes = [
   {path: '', redirectTo: '/main-page', pathMatch: 'full'},
   {path: 'main-page', component: MainPageComponent},
   {path: 'services', component: OffersComponent}
 ]

@NgModule({
  imports: [RouterModule.forRoot(appRoutes, {scrollPositionRestoration: "enabled"})],
  exports: [RouterModule]
})
export class AppRoutingModule{

}

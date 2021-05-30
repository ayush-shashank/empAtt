import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeAdminComponent } from './home-admin/home-admin.component';
import { LoginAdminComponent } from './login-admin/login-admin.component';

const routes: Routes = [
  { path: '', component: LoginAdminComponent },
  { path: 'home', component: HomeAdminComponent },
  // { path: '**' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}

import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginAdminComponent } from './login-admin/login-admin.component';
import { HomeAdminComponent } from './home-admin/home-admin.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { AddEmpComponent } from './add-emp/add-emp.component';
import { EditEmpComponent } from './edit-emp/edit-emp.component';
import { ViewEmpComponent } from './view-emp/view-emp.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginAdminComponent,
    HomeAdminComponent,
    AddEmpComponent,
    EditEmpComponent,
    ViewEmpComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
  ],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}

import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { DataService } from '../data.service';

@Component({
  selector: 'app-login-admin',
  templateUrl: './login-admin.component.html',
  styleUrls: ['./login-admin.component.css'],
})
export class LoginAdminComponent implements OnInit {
  adminLogin: FormGroup;
  submitted = false;

  constructor(
    private ds: DataService,
    private fb: FormBuilder,
    private router: Router
  ) {
    this.adminLogin = fb.group({
      username: ['', Validators.required],
      password: ['', Validators.required],
    });
  }

  ngOnInit(): void {}

  get f(): any {
    return this.adminLogin.controls;
  }

  onSubmit(): void {
    console.log('form submitted');
    this.submitted = true;

    if (this.adminLogin.invalid) return;

    this.ds
      .authenticateAdmin(
        this.adminLogin.value?.username,
        this.adminLogin.value?.password
      )
      .subscribe((res: any) => {
        if (res.CODE === 1) this.router.navigate(['home']);
        else if (res.CODE === 0)
          this.adminLogin.controls?.password.setErrors({ invalid: true });
        else if (res.CODE === -1)
          this.adminLogin.controls?.username.setErrors({ invalid: true });
        else console.log('Unknown Error');
        console.log(res);
      });
  }
}

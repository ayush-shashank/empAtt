import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { DataService } from '../data.service';

@Component({
  selector: 'app-add-emp',
  templateUrl: './add-emp.component.html',
  styleUrls: ['./add-emp.component.css'],
})
export class AddEmpComponent implements OnInit {
  addEmp: FormGroup;
  submitted = false;

  constructor(private fb: FormBuilder, private ds: DataService) {
    this.addEmp = fb.group({
      name: ['', Validators.required],
      dept: ['', Validators.required],
      bio: [''],
    });
  }

  ngOnInit(): void {}

  get f(): any {
    return this.addEmp.controls;
  }

  get depts(): string[] {
    return this.ds.depts;
  }

  onSubmit(): void {
    console.log('form submitted');
    this.submitted = true;

    if (this.addEmp.invalid) return;
    const e = this.addEmp.value;
    this.ds.addEmployee(e.name, e.dept, e.bio).subscribe((res: any) => {
      console.log(res);
      alert('Employee added successfully!\nEmployeeID: ' + res?.empCode);
      this.ds.employees.push({
        empCode: res?.empCode,
        name: e.name,
        dept: e.dept,
        bio: e.bio,
        isResetPass: false,
      });
    });
  }

  onReset(): void {
    this.submitted = false;
    this.addEmp.reset();
  }
}

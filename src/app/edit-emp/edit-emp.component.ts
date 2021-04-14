import { Component, Input, OnChanges, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { DataService } from '../data.service';

@Component({
  selector: 'app-edit-emp',
  templateUrl: './edit-emp.component.html',
  styleUrls: ['./edit-emp.component.css'],
})
export class EditEmpComponent implements OnInit, OnChanges {
  @Input() emp: any;

  editEmp: FormGroup;

  constructor(private fb: FormBuilder, private ds: DataService) {
    this.editEmp = fb.group({
      dept: [Validators.required],
      bio: [],
      isResetPass: [],
    });
  }

  get depts() {
    return this.ds.depts;
  }
  ngOnInit(): void {}

  setDefault(): void {
    this.editEmp.controls.dept.setValue(this.emp?.dept, { onlySelf: true });
    this.editEmp.controls.bio.setValue(this.emp?.bio, { onlySelf: true });
    this.editEmp.controls.isResetPass.setValue(this.emp?.isResetPass, {
      onlySelf: true,
    });
  }

  ngOnChanges(): void {
    console.log(this.emp);
    this.setDefault();
  }

  get f(): any {
    return this.editEmp.controls;
  }

  onSubmit(): void {
    console.log('update submitted', this.editEmp.invalid);

    if (this.editEmp.invalid) return;

    console.log(this.emp.empCode, this.editEmp.value);
    const e = this.editEmp.value;
    this.ds
      .updateEmployee(this.emp.empCode, e.dept, e.bio, e.isResetPass)
      .subscribe((res: any) => {
        console.log(res);
        if (res?.CODE == 1) {
          const i = this.ds.employees.findIndex(
            (employee) => employee.empCode === this.emp.empCode
          );
          this.ds.employees[i].dept = e.dept;
          this.ds.employees[i].bio = e.bio;
          this.ds.employees[i].isResetPass = e.isResetPass;
          alert(
            'Employee updated successfully!\nEmployeeID: ' + this.emp.empCode
          );
        }

        this.editEmp.reset();
        this.setDefault();
      });
  }
}

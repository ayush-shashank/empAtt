import { Time } from '@angular/common';
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
      eInTime: [],
      eOutTime: [],
      startDate: [Validators.required],
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
    this.editEmp.controls.eInTime.setValue(
      this.emp?.eInTime ? this.emp?.eInTime.substr(0, 5) : null,
      {
        onlySelf: true,
      }
    );
    this.editEmp.controls.eOutTime.setValue(
      this.emp?.eOutTime ? this.emp?.eOutTime.substr(0, 5) : null,
      {
        onlySelf: true,
      }
    );
    if (this.emp?.startDate) {
      let dateParts = this.emp.startDate.split('-');
      this.editEmp.controls.startDate.setValue(
        `${dateParts[2]}-${dateParts[1]}-${dateParts[0]}`,
        {
          onlySelf: true,
        }
      );
    } else {
      this.editEmp.controls.startDate.setValue(this.emp?.startDate, {
        onlySelf: true,
      });
    }
  }

  ngOnChanges(): void {
    console.log('editEmpOnChngs', this.emp);
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
      .updateEmployee(
        this.emp.empCode,
        e.dept,
        e.bio,
        e.eInTime,
        e.eOutTime,
        e.isResetPass,
        e.startDate
      )
      .subscribe((res: any) => {
        console.log(res);
        if (res?.CODE == 1) {
          const i = this.ds.employees.findIndex(
            (employee) => employee.empCode === this.emp.empCode
          );
          this.ds.employees[i].dept = e.dept;
          this.ds.employees[i].bio = e.bio;
          this.ds.employees[i].isResetPass = e.isResetPass;
          this.ds.employees[i].eInTime = e.inTime;
          this.ds.employees[i].eOutTime = e.outTime;
          this.ds.employees[i].startDate = e.startDate;
          alert(
            'Employee updated successfully!\nEmployeeID: ' + this.emp.empCode
          );
        }

        this.editEmp.reset();
        this.setDefault();
      });
  }
}

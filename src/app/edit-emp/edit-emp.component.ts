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
  // depts = ;
  submitted = false;

  constructor(private fb: FormBuilder, private ds: DataService) {
    this.editEmp = fb.group({
      dept: ['', Validators.required],
      bio: [''],
      isResetPass: [this.emp?.isResetPass],
    });
  }

  get depts() {
    return this.ds.depts;
  }
  ngOnInit(): void {}

  ngOnChanges(): void {
    console.log(this.emp);
    const selectedDept = this.ds.depts.find((dept) => dept === this.emp?.dept);
    this.editEmp.controls?.dept.setValue(selectedDept, { onlySelf: true });
    this.editEmp.controls?.bio.setValue(this.emp?.bio, { onlySelf: true });
    this.editEmp.controls?.isResetPass.setValue(this.emp?.isResetPass, {
      onlySelf: true,
    });
  }

  get f(): any {
    return this.editEmp.controls;
  }

  onSubmit(): void {
    console.log('update submitted');
    this.submitted = true;

    if (this.editEmp.invalid) return;

    console.log(this.emp.empCode, this.editEmp.value);
    const e = this.editEmp.value;
    this.ds.updateEmployee(e.dept, e.bio, e.resetPass).subscribe((res: any) => {
      console.log(res);
      alert('Employee updated successfully!\nEmployeeID: ' + this.emp.empCode);
      this.editEmp.reset();
    });
  }
}

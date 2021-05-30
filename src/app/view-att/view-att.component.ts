import { Component, Input, OnChanges, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { DataService } from '../data.service';

@Component({
  selector: 'app-view-att',
  templateUrl: './view-att.component.html',
  styleUrls: ['./view-att.component.css'],
})
export class ViewAttComponent implements OnInit, OnChanges {
  @Input() emp: any;

  month = new Date();
  empAtt: any[] = [];
  constructor(private ds: DataService) {}

  ngOnInit(): void {}

  ngOnChanges():void{
    this.month = new Date();
    this.empAtt = [];
  }

  onChange(): void {
    let date = new Date(this.month);
    console.log('m:', date);
    console.log('year:', date.getFullYear());
    console.log('month:', date.getMonth());
    this.ds
      .getEmployeeAttendance(
        this.emp.empCode,
        (date.getMonth() + 1).toString(),
        date.getFullYear().toString()
      )
      .subscribe((res: any) => {
        console.log(res);
        this.empAtt = res;
        // if (res?.CODE == 1) {
        //   const i = this.ds.employees.findIndex(
        //     (employee) => employee.empCode === this.emp.empCode
        //   );
        //   alert(
        //     'Employee updated successfully!\nEmployeeID: ' + this.emp.empCode
        //   );
        // }
      });
  }
}

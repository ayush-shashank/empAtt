import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';
import { Employee } from '../employee';

@Component({
  selector: 'app-view-emp',
  templateUrl: './view-emp.component.html',
  styleUrls: ['./view-emp.component.css'],
})
export class ViewEmpComponent implements OnInit {
  // employees: Employee[] = [];
  editEmp: any;
  constructor(private ds: DataService) {
    // this.getEmployees();
    // this.editEmp = this.employees[0];
  }

  ngOnInit(): void {}

  get employees(): Employee[] {
    return this.ds.employees;
    // this.ds.getEmployees().subscribe((res) => {
    //   console.log(res);
    //   this.employees = res;
    // });
    // this.employees = this.ds.employees;
  }

  onClickUpdate(emp: any): void {
    this.editEmp = emp;
    console.log('update -> ', emp);
  }
}

import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';
import { Employee } from '../employee';

@Component({
  selector: 'app-view-emp',
  templateUrl: './view-emp.component.html',
  styleUrls: ['./view-emp.component.css'],
})
export class ViewEmpComponent implements OnInit {
  editEmp: Employee | undefined;
  constructor(private ds: DataService) {}

  ngOnInit(): void {}

  get employees(): Employee[] {
    return this.ds.employees;
  }

  onClickView(emp: Employee): void {
    this.ds.getEmployeeAttendance(emp.empCode).subscribe((res) => {
      console.log(res);
    });
  }

  onClickUpdate(emp: Employee): void {
    this.editEmp = emp;
  }

  onClickRemove(emp: Employee) {
    if (
      confirm('Are you sure you want to remove employee ' + emp.empCode + '?')
    )
      this.ds.deleteEmployee(emp.empCode).subscribe((res) => {
        console.log(res);
        if (res?.success === 1) {
          this.ds.employees = this.ds.employees.filter(
            (employee) => employee.empCode != emp.empCode
          );
          alert('Employee ' + emp.empCode + ' deleted');
        }
      });
  }
}

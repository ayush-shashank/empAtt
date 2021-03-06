import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, Subject } from 'rxjs';
import { Employee } from './employee';

@Injectable({
  providedIn: 'root',
})
export class DataService {
  ip = ``;
  depts = ['BT', 'CS', 'CV', 'EC', 'EE', 'IS', 'ME'];
  employees: Employee[] = [];
  employeeChange: Subject<any> = new Subject<any>();

  constructor(private http: HttpClient) {
    this.getEmployees();
    this.employeeChange.subscribe((val) => {
      this.employees = val;
    });
  }

  authenticateAdmin(username: string, password: string): Observable<any> {
    return this.http.get(`${this.ip}/adminLogin`, {
      params: { user: username, pass: password },
    });
  }

  addEmployee(name: string, department: string, bio: string): Observable<any> {
    return this.http.get(`${this.ip}/addEmployee`, {
      params: { name, dept: department, bio },
    });
  }

  getEmployees(): void {
    this.http.get(`${this.ip}/getEmployees`).subscribe((res) => {
      this.employeeChange.next(res);
    });
  }

  updateEmployee(
    empCode: string,
    department: string,
    bio: string,
    isResetPassword: boolean
  ): Observable<any> {
    console.log(empCode + department + bio + isResetPassword);
    return this.http.get(`${this.ip}/updateEmployee`, {
      params: {
        empCode,
        dept: department,
        bio,
        isResetPass: isResetPassword ? '1' : '0',
      },
    });
  }

  deleteEmployee(empCode: string): Observable<any> {
    return this.http.get(`${this.ip}/deleteEmployee`, {
      params: { empCode },
    });
  }

  getEmployeeAttendance(empCode: string, month:string, year:string): Observable<any> {
    return this.http.get(`${this.ip}/getEmployeeAttendance`, {
      params: { empCode, month, year },
    });
  }
}

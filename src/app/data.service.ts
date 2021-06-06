import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, Subject } from 'rxjs';
import { Employee } from './employee';

@Injectable({
  providedIn: 'root',
})
export class DataService {
  ip = ``;  //`http://192.168.0.105:3000`;
  depts: string[] = ['BT', 'CS', 'CV', 'EC', 'EE', 'IS', 'ME'];
  employees: Employee[] = [];
  employeeChange: Subject<any> = new Subject<any>();
  deptChange: Subject<any> = new Subject<any>();

  constructor(private http: HttpClient) {
    this.getDepartments();
    this.deptChange.subscribe((val) => {
      this.depts = val;
    });
    this.getEmployees();
    this.employeeChange.subscribe((val) => {
      this.employees = val;
    });
  }
  getDepartments() {
    this.http.get(`${this.ip}/getDepartments`).subscribe((res) => {
      this.deptChange.next(res);
    });
  }

  authenticateAdmin(username: string, password: string): Observable<any> {
    return this.http.get(`${this.ip}/adminLogin`, {
      params: { user: username, pass: password },
    });
  }

  getEmployees(): void {
    this.http.get(`${this.ip}/getEmployees`).subscribe((res) => {
      this.employeeChange.next(res);
    });
  }

  addEmployee(
    name: string,
    department: string,
    bio: string,
    expectedInTime: string,
    expectedOutTime: string,
    startDate: string
  ): Observable<any> {
    return this.http.get(`${this.ip}/addEmployee`, {
      params: {
        name,
        dept: department,
        bio,
        eInTime: expectedInTime,
        eOutTime: expectedOutTime,
        startDate,
      },
    });
  }

  updateEmployee(
    empCode: string,
    department: string,
    bio: string,
    expectedInTime: string,
    expectedOutTime: string,
    isResetPassword: boolean,
    startDate: string
  ): Observable<any> {
    console.log(empCode + department + bio + isResetPassword);
    return this.http.get(`${this.ip}/updateEmployee`, {
      params: {
        empCode,
        dept: department,
        bio,
        eInTime: expectedInTime,
        eOutTime: expectedOutTime,
        isResetPass: isResetPassword ? '1' : '0',
        startDate,
      },
    });
  }

  deleteEmployee(empCode: string): Observable<any> {
    return this.http.get(`${this.ip}/deleteEmployee`, {
      params: { empCode },
    });
  }

  getEmployeeAttendance(
    empCode: string,
    month: string,
    year: string
  ): Observable<any> {
    return this.http.get(`${this.ip}/getEmployeeAttendance`, {
      params: { empCode, month, year },
    });
  }
}

import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, Subject } from 'rxjs';
import { Employee } from './employee';

@Injectable({
  providedIn: 'root',
})
export class DataService {
  ip = `http://localhost:3000`;
  depts = ['BT', 'CS', 'CV', 'EC', 'EE', 'IS', 'ME'];
  employees: Employee[] = [];
  employeeChange: Subject<any> = new Subject<any>();

  constructor(private http: HttpClient) {
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

  getEmployees(): Observable<any> {
    this.http.get(`${this.ip}/getEmployees`).subscribe((res) => {
      this.employeeChange.next(res);
    });
    return this.employeeChange;
  }

  updateEmployee(
    department: string,
    bio: string,
    resetPassword: boolean
  ): Observable<any> {
    return this.http.get(`${this.ip}/updateEmployee`, {
      params: {
        dept: department,
        bio,
        resetPass: resetPassword ? 'true' : 'false',
      },
    });
  }

  deleteEmployee(empCode: string): Observable<any> {
    return this.http.get(`${this.ip}/deleteEmployee`, {
      params: { empCode },
    });
  }

  getEmployeeAttendance(empCode: string): Observable<any> {
    return this.http.get(`${this.ip}/getEmployeeAttendance`, {
      params: { empCode },
    });
  }
}

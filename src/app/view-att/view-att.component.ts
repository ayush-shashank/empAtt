import { Component, Input, OnChanges, OnInit } from '@angular/core';
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

  ngOnChanges(): void {
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
      });
  }
  printAtt(): void {
    let printContents: any = document.getElementById('empAtt')?.innerHTML;
    let popupWin: any = window.open('', '_blank');
    popupWin.document.open();
    popupWin.document.write(`
    <html>
      <head>
      <title>${this.emp.empCode} Attendance</title>
        <style>
            table{
              width: 85%;
              margin: 0 auto;
              border: 2px solid black;
              border-collapse: collapse;
            }
            tr, td {
              border: 2px solid black;
              padding: 2.5px 5px;
            }
        </style>
      </head>
      <body onload="window.print();">
        <table >
          ${printContents}
        </table>
      </body>
    </html>`);
    popupWin.document.close();
    popupWin.onfocus = () => {
      setTimeout(() => {
        popupWin.close();
      }, 250);
    };
  }
}

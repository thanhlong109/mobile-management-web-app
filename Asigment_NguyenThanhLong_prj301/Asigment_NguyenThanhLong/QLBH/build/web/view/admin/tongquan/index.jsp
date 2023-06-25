<%-- 
    Document   : index
    Created on : Mar 13, 2023, 9:32:07 AM
    Author     : ACER
--%>

<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .chart{
                border-radius: 24px;
                box-shadow: 0 0 15px rgba(0,0,0,0.2);
                padding: 16px;
            }
            .chart2{
                border-radius: 24px;
                box-shadow: 0 0 15px rgba(0,0,0,0.2);
                padding: 42px 42px 24px 42px;
            }
            .w-350{
                width: 400px;
            }
            .title-chart{
                margin: 16px 0;
                text-align: center;
            }
            .row{
                display: grid;
                grid-template-columns: 1fr 2fr;
                column-gap: 150px;
                
            }
            .mt-64{
                margin-top: 64px;
            }
            
        </style>
    </head>
    <body>
        <%@include file="../common/leftbar.jsp" %>
        <div class="container">
            <h3 class="title">
               Tổng Quan
            </h3>
            <div class="row">
                <div class="chart">
                    <canvas id="spchart"></canvas>
                    <h5 class="title-chart">Danh mục sản phẩm</h5>
                </div>
                <div class="chart">
                    <canvas id="hdchart"></canvas>
                    <h5 class="title-chart">Thống kê hóa đơn</h5>
                </div>
            </div>
            <div class="chart2 w-350 mt-64">
                <canvas id="sp2chart"></canvas>
                <h5 class="title-chart">Nhà cung cấp</h5>
            </div>
            
            
        </div>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <%
            Map<String,Integer> list1 = (Map<String,Integer>) request.getAttribute("dsdmsl"); 
            Map<String,Integer> list2 = (Map<String,Integer>) request.getAttribute("dsnccsl"); 
        %>
        <script>
            const ctx3 = document.getElementById('sp2chart');
            const data3 = {
                        labels: [
                            <%
                                for(String key:list2.keySet()){
                            %>
                                "<%= key %>",
                            <%
                                }
                            %>
                        ],
                        datasets: [{
                          label: 'Tổng',
                          data: [
                            <%
                                for(String key:list2.keySet()){
                            %>
                            <%= list2.get(key) %>,               
                            <%
                                }
                            %>                    
                        ],
                          backgroundColor: [
                            'rgb(255, 99, 132)',
                            'rgb(54, 162, 235)',
                            'rgb(255, 205, 86)',
                            'rgb(201, 203, 207)',
                            'rgb(75, 192, 192)',
                            '#ff00ff',
                            '#ff7f00',
                            '#ffff00',
                            '#00ff00'
                            
                          ],
                          hoverOffset: 4
                        }]
                      };
            const config3 = {
               type: 'doughnut',
               data: data3,
              };
             new Chart(ctx3,config3);
        </script>
        <script>
            const ctx2 = document.getElementById('hdchart');
            const labels2 = ['Tháng 1','Tháng 2','Tháng 3','Tháng 4','Tháng 5','Tháng 6','Tháng 7','Tháng 8','Tháng 9','Tháng 10','Tháng 11','Tháng 12'];
            const data2 = {
              labels: labels2,
              datasets: [{
                label: 'Số Lượng',
                data: [
                    <%
                        int[] sldh =(int[]) request.getAttribute("slhd");
                        for(int i:sldh){
                            
                        
                    %>
                       <%= i %>,
                    <%
                        }
                    %>       
                ],
                backgroundColor: [
                  '#3ca9ee'
                ],
                borderColor: [
                  '#2d85c5'
                ],
                borderWidth: 1
              }]
            };
            const config2 = {
                type: 'bar',
                data: data2,
                options: {
                  scales: {
                    y: {
                      beginAtZero: true
                    }
                  }
                },
              };
             new Chart(ctx2,config2);
        </script>
        <script>
            const ctx = document.getElementById('spchart');
            const data1 = {
                    labels: [
                        <%
                            for(String key:list1.keySet()){
                        %>
                            "<%= key %>",
                        <%
                            }
                        %>
                        
                    ],
                    datasets: [{
                        label: 'Tổng số',
                        data: [
                            <%
                                for(String key:list1.keySet()){
                            %>
                            <%= list1.get(key) %>,               
                            <%
                                }
                            %>                    
                        ],
                        backgroundColor: [
                        'rgb(255, 99, 132)',
                        'rgb(75, 192, 192)',
                        'rgb(255, 205, 86)',
                        'rgb(201, 203, 207)'
                        ]
                    }]
            };
            new Chart(ctx, {
                type: 'polarArea',
                data: data1,
                options: {}

            });
      </script>
    </body>
</html>

---
title: "Dashboard Design Essentials - StatsCan Labour Force Survey"
excerpt_separator: "<!--more-->"
categories:
  - Blog
tags:
  - Economics
  - Data Visualization
---

In order to gain deeper insights into the Canadian economy and labour market, I started designing a dashboard based on the famous 1410028701 table, [Labour Force Characteristics](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410028701) of Labour Force Survey from Statistics Canada, StatsCan. 

Developing a visually pleasing and effective dashboard is never an easy task. So I would like to share my process and ideas and hopefully this might help you to kickstart your dashboard journey!

# Steps to Develop an Effective Dashboard

1. **Understand your audience!** - Understanding our major customers and questions our dashboard needs to answer will provide an important road map for its design and content of the dashboards. Otherwise, all the available metrics and info can quickly become overwhelming and distracting at times. Having a map will ensure our dashboard stays relevant and rigorous!

2. **Explore the dataset** - I like playing around with the dataset a little to feel more comfortable. For Labour Force Characteristics table, I spent some time to understand metrics and their definitions.

3. **Browse reports and look for inspiration** - I then had a quick look at Ontario's Labour Report so I can quickly grasp how other users are visualizing and using the data. 

4. **Fully understand the relationship between these metrics** - Unemployment rate, employment rate and participation rate actually have a pretty intricate and insightful relationship. So I spent some time reading a textbook of Labour Economics to nail the math behind the relationship so I can use it for my dashboard. I will write another article to explain this further.

5. **Draft a list of questions and analysis** - I then pinned down what my dashboards would answer

6. **Mock up in PowerPoint** - After these steps, now I have an idea how I wanted my dashboard to look like. At this stage, I only focus on the design of the dashboard. I will experiment with the number of graphs and headline numbers I can fit onto 1 page of slide. This helps me to finalize on what to report on the dashboard.

7. **Explore different data visualization tools** - After some research and asking for advice from my friends working in data science, I was considering Tableau, Power BI, Excel, ggplot in R, plotly in Python.   

8. **Mock up in Excel** - The dataset I was working with is relatively small so I figured it's faster for me to just download the csv file from [StatsCan website](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410028701), manipulate and plot rather complicated time series graphs in Excel. Therefore, instead of downloading 1GB data from StatsCan and using other tools, I decided to use Excel for me to explore and play around data. You will see the finished dashboard mock-up below. 

9. **Automate the process** - Automating data scraping and updating the dashboard will be the next step. 

[Dashboard Excel Mock-up](/assets/lfsdashboard.pdf)

So this captures my process when developing this dashboard. What do you think? How about your process?

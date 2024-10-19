# Introduction

This project focuses on analyzing COVID-19 vaccination rates, death trends, and related metrics using publicly available data. The analysis explores key relationships between vaccinations, infection resurgence, and mortality rates, leveraging SQL for data extraction and Tableau for visualizations. By examining the impact of vaccination on death rates, ICU admissions, and vaccination inequality across regions, this project aims to highlight how vaccination efforts have affected the global pandemic response.
The project includes multiple SQL queries for extracting insights from the dataset, along with tailored visualizations to effectively showcase the findings. These visualizations include choropleth maps, dual-axis line charts, stacked area charts, and bubble charts to highlight vaccination progress, case fatality rates, and other key metrics.
Check out Covid_Data_Exploration and Covid_Project for full codes. 


# Tools Used

- SQL Server: Used for querying and analyzing the COVID-19 data.
- Tableau: Visualized the analysis results through various chart types such as dual-axis line charts, choropleth maps, stacked area charts, and bubble charts.
- GitHub: Repository to store the project files, including SQL queries, visualizations, and documentation.
- Excel: Initial data cleaning and preparation before loading into SQL Server for analysis.


## The Analysis
Here are some of the visualizations from the analysis

### Time Series Analysis of Vaccination and Death Rates
![Sheet 7](https://github.com/user-attachments/assets/e1a5b59d-b4e1-49d2-8c1f-c3a004efe2fb)
The Time Series Analysis of Vaccination and Death Rates is a dual-axis line chart that tracks the relationship between vaccination rollout and death rates over time. The orange line represents the cumulative number of new vaccinations, while the blue line tracks the number of new deaths. Over time, the chart shows a sharp increase in the vaccination rate, represented by the upward slope of the orange line, while the death rate remains relatively flat. This divergence suggests that as vaccination rates climbed, there was a significant control in the number of new deaths, highlighting the effectiveness of vaccination efforts in reducing the mortality rate associated with COVID-19. This analysis provides a clear picture of the positive impact of vaccines on controlling death rates globally.

### Case Fatality Rate by Country
![Sheet 4](https://github.com/user-attachments/assets/90033ccd-95c9-493d-9e3b-c2d16b20007b)
The Case Fatality Rate by Country map visualizes COVID-19 fatality rates across the globe by showing a comparison of how different countries have been impacted in terms of deaths relative to confirmed cases. Each country is represented by a colored circle, where the size of the circle indicates the severity of the case fatality rate (CFR). Countries such as Canada, the United States, and several in Europe and Africa show higher CFR values, highlighted with larger circles, while regions like parts of Asia and Oceania have much smaller circles, indicating lower fatality rates. The variation in color emphasizes the global disparity in pandemic outcomes, making it easy to visually identify the most affected regions.

### Vaccination Coverage vs Infection Resurgence
![Sheet 3](https://github.com/user-attachments/assets/fb22adf9-5c66-4409-aea1-88d4f92d211a)
Vaccination coverage and new COVID-19 cases are compared over time, from February to April 2021. The blue line, representing new cases smoothed per million, shows a rise in infections, peaking in March before slightly declining in April. Meanwhile, the orange line tracks the number of people vaccinated per hundred, showing a steady increase throughout the period. Despite the increasing vaccination rate, new cases continued to rise initially, likely due to the time required to build immunity. By April, the slight decline in cases may indicate the early effects of widespread vaccination. The chart suggests a lag in the impact of vaccination on reducing infections, but an eventual positive effect as vaccination coverage grows.

### Vaccination Inequality

Vaccination Inequality chart visualizes the number of people fully vaccinated across different continents using a bubble chart. Europe stands out with the largest bubble, indicating it has the highest number of vaccinated individuals. Africa, on the other hand, has the smallest bubble, reflecting the lowest vaccination numbers. North America, South America, and Asia have similar bubble sizes, suggesting a middle ground in terms of vaccination coverage, but they are all significantly behind Europe. The darker the bubble, the greater the number of vaccinated individuals, as shown by the color scale.

### Impact of Vaccination on ICU Patients
![Sheet 6](https://github.com/user-attachments/assets/69886636-1f39-4b54-b24b-e148874f5d71)
The Impact of Vaccination on ICU Patients graph shows the correlation between the increase in vaccination rates and the reduction in ICU patients per million. The x-axis represents the year, starting from 2020 and extending into 2021, while the y-axis on the left indicates the average number of ICU patients per million, and the y-axis on the right indicates the average number of people fully vaccinated per hundred. The blue area represents the trend in ICU admissions per million people, which starts high in 2020, indicating a significant burden on the healthcare system at the pandemic’s peak. However, as time progresses and vaccines are rolled out, indicated by the growing orange area, the number of ICU patients begins to decline. The orange area represents the percentage of the population that is fully vaccinated, showing a steady rise throughout 2021. This visual clearly demonstrates the effectiveness of vaccinations in reducing the severity of COVID-19 infections, as seen by the drop in ICU admissions as the vaccination rate increases. This analysis highlights the relationship between mass vaccination efforts and a noticeable decrease in the number of severe COVID-19 cases requiring ICU treatment. The graph effectively communicates the positive impact vaccines have had on alleviating the strain on healthcare systems during the pandemic.


# Conclusion
The analysis of COVID-19 data, including vaccination rates, ICU admissions, and other pandemic-related metrics, offers crucial insights into the profound impact of vaccines on public health outcomes. Throughout the pandemic, various metrics such as ICU admissions, death rates, and case numbers showed a significant burden on global healthcare systems, particularly in regions with lower vaccination coverage. The data reveals that countries with higher vaccination rates experienced a more noticeable reduction in ICU admissions, deaths, and severe cases, underscoring the critical role of vaccines in mitigating the pandemic’s effects.

Time-series analyses, such as those comparing vaccination progress with ICU admissions or case fatalities, illustrate the direct correlation between increased vaccination rates and the decline in severe outcomes. This trend is especially evident in the latter part of 2021 when vaccine rollouts accelerated, leading to fewer hospitalizations and a decreasing death rate, despite continued infection waves. The case of ICU patients per million versus vaccination rates highlights how mass vaccination drives alleviate pressure on healthcare infrastructures.

Additionally, exploring vaccination inequality across different regions or the resurgence of infections relative to vaccine distribution sheds light on the disparities in pandemic recovery. Countries with slower vaccine access or lower vaccination rates saw longer recovery times and higher rates of hospitalizations, indicating the need for more equitable vaccine distribution efforts worldwide.

This research concludes that widespread vaccination is a key factor in curbing severe COVID-19 outcomes, saving lives, and stabilizing healthcare systems globally. As vaccinations increase, the data consistently shows a reduction in ICU admissions, death rates, and overall COVID-19 severity. Furthermore, a concerted global effort to address vaccine inequality remains essential in combating future waves and ensuring a faster and more balanced recovery across regions. The evidence overwhelmingly supports the continued promotion and administration of vaccines as a critical tool in managing the pandemic and returning to normalcy.

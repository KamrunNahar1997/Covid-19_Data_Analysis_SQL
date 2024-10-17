--Vaccination Impact on Death Rate

SELECT 
    dea.continent,
    dea.location,
    dea.date,
    dea.total_deaths_per_million,
    vac.people_fully_vaccinated_per_hundred,
    vac.new_vaccinations_smoothed_per_million
FROM 
    ProjectProfile..CovidDeaths dea
JOIN 
    ProjectProfile..CovidVaccinations vac
ON 
    dea.location = vac.location
and dea.date = vac.date
WHERE 
    vac.people_fully_vaccinated_per_hundred IS NOT NULL 
    ANd dea.total_deaths_per_million IS NOT NULL
ORDER BY 
    location, date;

--Time Series Analysis of Vaccination and Death Rates

SELECT 
    dea.continent, 
    dea.location, 
    dea.date, 
    vac.new_vaccinations_smoothed, 
    dea.new_deaths_smoothed
FROM 
    ProjectProfile..CovidDeaths dea
JOIN 
    ProjectProfile..CovidVaccinations vac
ON 
    dea.location = vac.location
and dea.date = vac.date
WHERE 
    vac.new_vaccinations_smoothed IS NOT NULL 
    AND dea.new_deaths_smoothed IS NOT NULL
ORDER BY 
    dea.location, dea.date;


--Case Fatality Rate by Country

SELECT 
    continent, 
    location, 
    date, 
    total_deaths, 
    total_cases, 
    (total_deaths / total_cases) * 100 AS case_fatality_rate
FROM 
    ProjectProfile..CovidDeaths dea
WHERE 
    total_cases > 0
ORDER BY 
    location, date;


--Vaccination Coverage vs Infection Resurgence

SELECT 
    dea.continent, 
    dea.location, 
    dea.date, 
    dea.new_cases_smoothed_per_million, 
    CAST(vac.people_vaccinated_per_hundred AS decimal) AS people_vaccinated_per_hundred
FROM 
    ProjectProfile..CovidDeaths dea
JOIN 
    ProjectProfile..CovidVaccinations vac 
ON 
    dea.iso_code = vac.iso_code 
    AND dea.date = vac.date
WHERE 
    CAST(vac.people_vaccinated_per_hundred AS decimal) > 50 
ORDER BY 
    dea.location, dea.date;

-- Vaccination Inequality

SELECT 
    vac.continent, 
    vac.location, 
    vac.date, 
    CAST(vac.people_fully_vaccinated_per_hundred AS decimal) AS people_fully_vaccinated_per_hundred, 
    dea.gdp_per_capita, 
    vac.extreme_poverty
FROM 
    ProjectProfile..CovidDeaths dea
JOIN 
    ProjectProfile..CovidVaccinations vac 
ON 
    vac.iso_code = dea.iso_code
WHERE 
    CAST(vac.people_fully_vaccinated_per_hundred AS decimal) < 10 
ORDER BY 
    vac.location, vac.date;

SELECT TOP 10 * FROM ProjectProfile..CovidDeaths dea;


--Impact of Vaccination on ICU Patients

SELECT 
    dea.continent, 
    dea.location, 
    dea.date, 
    vac.people_fully_vaccinated_per_hundred, 
    dea.icu_patients_per_million
FROM 
    ProjectProfile..CovidDeaths dea
JOIN 
    ProjectProfile..CovidVaccinations vac
ON 
    dea.iso_code = vac.iso_code 
    AND dea.date = vac.date
WHERE 
    vac.people_fully_vaccinated_per_hundred IS NOT NULL 
    AND dea.icu_patients_per_million IS NOT NULL
ORDER BY 
    dea.location, dea.date;


--Longitudinal Study Pre- and Post-Vaccine Rollout

SELECT 
    Vac.continent, 
    Vac.location, 
    Vac.date, 
    SUM(CAST(dea.total_deaths AS DECIMAL)) AS total_deaths, 
    SUM(CAST(vac.people_vaccinated AS DECIMAL)) AS total_vaccinated
FROM 
    ProjectProfile..CovidDeaths dea
JOIN 
    ProjectProfile..CovidVaccinations vac
ON 
    dea.iso_code = vac.iso_code 
    AND dea.date = vac.date
WHERE 
    CAST(vac.people_vaccinated_per_hundred AS decimal) > 50 
GROUP BY 
    vac.continent, vac.location, vac.date
ORDER BY 
    vac.location, vac.date;


--Hospitalization Rates vs Vaccination


SELECT 
    dea.continent, 
    dea.location, 
    dea.date, 
    vac.people_fully_vaccinated_per_hundred, 
    dea.hosp_patients_per_million
FROM 
    ProjectProfile..CovidDeaths dea
JOIN 
    ProjectProfile..CovidVaccinations vac 
ON 
    dea.iso_code = vac.iso_code 
    AND dea.date = vac.date
WHERE 
    vac.people_fully_vaccinated_per_hundred IS NOT NULL 
    AND dea.hosp_patients_per_million IS NOT NULL
ORDER BY 
    dea.location, dea.date;

--Vaccination Progress by Population Density

SELECT 
    vac.continent, 
    vac.location, 
    vac.date, 
    vac.population_density, 
    vac.people_fully_vaccinated_per_hundred
FROM 
    ProjectProfile..CovidVaccinations vac 
WHERE 
    vac.people_fully_vaccinated_per_hundred IS NOT NULL
ORDER BY 
    vac.continent, vac.location, vac.date;


--New Cases vs. New Vaccinations

SELECT 
    dea.continent, 
    dea.location, 
    dea.date, 
    dea.new_cases, 
    vac.new_vaccinations
FROM 
    ProjectProfile..CovidDeaths dea
JOIN 
    ProjectProfile..CovidVaccinations vac 
ON 
    dea.iso_code = vac.iso_code 
    AND dea.date = vac.date
WHERE 
    dea.new_cases IS NOT NULL 
    AND vac.new_vaccinations IS NOT NULL
ORDER BY 
    dea.continent, dea.location, dea.date;

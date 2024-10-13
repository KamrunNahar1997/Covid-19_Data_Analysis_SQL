select*
from ProjectProfile..CovidDeaths
where continent is not null
order by 3,4


select*
from ProjectProfile..CovidVaccinations
where continent is not null
order by 3,4


select location, date, total_cases, new_cases, total_deaths, population
from ProjectProfile..CovidDeaths
order by 1,2

--Total Deaths VS Total Cases

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from ProjectProfile..CovidDeaths
where location like '%Bangladesh%'
order by 1,2

--Total Cases VS Population

select location, date, total_cases, population, (total_deaths/population)*100 as PercentPopulationInfected
from ProjectProfile..CovidDeaths
where location like '%Bangladesh%'
order by 1,2

--Countries with Highest Infection Rate compared to Population

select location, population, Max(total_cases) as HighestInfectionCount, Max((total_deaths/population))*100 as PercentPopulationInfected
from ProjectProfile..CovidDeaths
--where location like '%Bangladesh%'
group by location, population
order by PercentPopulationInfected desc

--Countries with Highest Death Count per Population

select location, MAX(cast(total_deaths as int)) as TotalDeathCount
from ProjectProfile..CovidDeaths
--where location like '%Bangladesh%'
where continent is not null
group by location
order by TotalDeathCount desc


--BREAKING THINGS DOWN BY CONTINENT

--Showing continents with the highest death count per population

select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
from ProjectProfile..CovidDeaths
--where location like '%Bangladesh%'
where continent is not null
group by continent
order by TotalDeathCount desc

--Global Numbers

select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
from ProjectProfile..CovidDeaths
--where location like '%Bangladesh%'
where continent is not null
--group by date
order by 1,2


--Total Population vs Vaccinations

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, Sum(Convert(int, vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
--(RollingPeopleVaccinated/population)*100
from ProjectProfile..CovidDeaths dea
join ProjectProfile..CovidVaccinations vac
on dea.location = vac.location
and dea.date = vac.date
--where dea.continent is not null
order by 2,3

--Using CTE

with PopulationvsVaccination (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, Sum(Convert(int, vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
--(RollingPeopleVaccinated/population)*100
from ProjectProfile..CovidDeaths dea
join ProjectProfile..CovidVaccinations vac
on dea.location = vac.location
and dea.date = vac.date
--where dea.continent is not null
--order by 2,3
)
select *, (RollingPeopleVaccinated/Population)*100
from PopulationvsVaccination


--Using Temp Table to perform Calculation on Partition By in previous query

drop table #PercentagePopulationVaccinated
Create Table #PercentagePopulationVaccinated
(
continent nvarchar(255),
location nvarchar(255),
Date datetime,
population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)
insert into #PercentagePopulationVaccinated
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, Sum(Convert(int, vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
--(RollingPeopleVaccinated/population)*100
from ProjectProfile..CovidDeaths dea
join ProjectProfile..CovidVaccinations vac
on dea.location = vac.location
and dea.date = vac.date
--where dea.continent is not null
--order by 2,3

select *, (RollingPeopleVaccinated/Population)*100
from #PercentagePopulationVaccinated


--Creating View to store data for visualizations

Create View PercentagePopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From ProjectProfile..CovidDeaths dea
Join ProjectProfile..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
--order by 2,3

select *
from PercentagePopulationVaccinated


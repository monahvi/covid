select *
From PortfolioProject..CovidDeaths
Where continent is not null
order by 3,4

--select *
--From PortfolioProject..CovidVaccinations
--order by 3,4

--Select Data that we are going be using

select location, date, total_cases, new_cases,total_deaths,population
From PortfolioProject..CovidDeaths
order by 1,2


-- Looking at Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country

Select location, date, total_cases, total_deaths,(total_deaths/total_cases) *100 As DeathPersentage
From PortfolioProject..CovidDeaths
Where location like '%United kingdom%'
order by 1,2


-- Looking at Total Cases vs Population
-- Shows what percentage of population got Covid!

Select location, date, population, total_cases, (total_cases/population) *100 As DeathPersentage
From PortfolioProject..CovidDeaths
Where location like '%United kingdom%'
order by 1,2


-- Looking at Countries with Highest Infection Rate Compared to Population
Select location, population, MAX(total_cases) As HighestInfectionCount, MAX((total_cases/population)) *100 As PercentPopulationUnfected
From PortfolioProject..CovidDeaths
--Where location like '%United kingdom%'
Group by location,population
order by PercentPopulationUnfected desc


-- Showing Countries with Highest Death Count per population

select *
From PortfolioProject..CovidDeaths
order by 3,4

--select *
--From PortfolioProject..CovidVaccinations
--order by 3,4


--Select Data that we are going be using

select location, date, total_cases, new_cases,total_deaths,population
From PortfolioProject..CovidDeaths
order by 1,2


-- Looking at Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country

Select location, date, total_cases, total_deaths,(total_deaths/total_cases) *100 As DeathPersentage
From PortfolioProject..CovidDeaths
Where location like '%United kingdom%'
order by 1,2


-- Looking at Total Cases vs Population
-- Shows what percentage of population got Covid!

Select location, date, population, total_cases, (total_cases/population) *100 As DeathPersentage
From PortfolioProject..CovidDeaths
Where location like '%United kingdom%'
order by 1,2


-- Looking at Countries with Highest Infection Rate Compared to Population

Select location, MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
--Where location like '%United kingdom%'
Where continent is not null
Group by location
order by TotalDeathCount desc


-- Let's Break Things down by Continent
-- Showing contintents with the highest death count per population

Select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
--Where location like '%United kingdom%'
Where continent is not null
Group by continent
order by TotalDeathCount desc


-- Global Numbers

Select  date, SUM(new_cases) as Total_cases, SUM(cast(new_deaths as int)) as Total_deaths
From PortfolioProject..CovidDeaths
Where continent is not null
Group by date
order by 1,2


-- Looking at Total Population vs Vaccinations

Select dea.continent, dea.location, dea.date,dea.population,vac.new_vaccinations,
SUM(Convert(int,vac.new_vaccinations)) OVER (Partition by dea.location Order by dea.location,
dea.date) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
order by 2,3


-- TEMP TABLE

DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date,dea.population,vac.new_vaccinations,
SUM(Convert(int,vac.new_vaccinations)) OVER (Partition by dea.location Order by dea.location,
dea.date) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
--Where dea.continent is not null
order by 2,3

Select*,(RollingPeopleVaccinated /Population)*100
From #PercentPopulationVaccinated


-- Creating view to store data for later visualizations

Create View PercentPopulationVaccinated as 
Select dea.continent, dea.location, dea.date,dea.population,vac.new_vaccinations,
SUM(Convert(int,vac.new_vaccinations)) OVER (Partition by dea.location Order by dea.location,
dea.date) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
--order by 2,3

Select *
From PercentPopulationVaccinated



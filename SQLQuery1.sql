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
Select location, population, MAX(total_cases) As HighestInfectionCount, MAX((total_cases/population)) *100 As PercentPopulationUnfected
From PortfolioProject..CovidDeaths
--Where location like '%United kingdom%'
Group by location,population
order by PercentPopulationUnfected desc


-- Looking at Countries with Highest Infection Rate Compared to Population
Select location, MAX(total_deaths) As TotalDeathCount
From PortfolioProject..CovidDeaths
--Where location like '%United kingdom%'
Group by location
order by TotalDeathCount desc

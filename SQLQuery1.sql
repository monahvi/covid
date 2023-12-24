select *
From PortfolioProject..CovidDeaths
order by 3,4

--select *
--From PortfolioProject..CovidVaccinations
--order by 3,4

select location, date, total_cases, new_cases,total_deaths,population
From PortfolioProject..CovidDeaths
order by 1,2


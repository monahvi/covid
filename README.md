# COVID Data Analysis Project

## Overview

This GitHub repository contains SQL code for analyzing COVID-19 data from the tables `CovidDeaths` and `CovidVaccinations` in the `PortfolioProject` database. The project explores various aspects of the data, including total cases, deaths, population percentages, infection rates, and vaccination statistics. The analysis is conducted on a global and country-specific level, with a focus on visualizing the data for insights.

## Data Sources

- `CovidDeaths.xlsx`: Excel file containing COVID-19 death data.
- `CovidVaccinations.xlsx`: Excel file containing COVID-19 vaccination data.

## SQL Queries and Analysis

1. **Data Selection Queries**
    - Retrieve data from the `CovidDeaths` table, filtering out records with a null continent and ordering by columns 3 and 4.

2. **Total Cases vs Total Deaths**
    - Analyze the likelihood of dying if contracting COVID-19 in a specific country, focusing on the United Kingdom.

3. **Total Cases vs Population**
    - Explore the percentage of a country's population that contracted COVID-19, emphasizing the United Kingdom.

4. **Countries with Highest Infection Rate Compared to Population**
    - Identify countries with the highest infection rates relative to their populations.

5. **Countries with Highest Death Count per Population**
    - Evaluate countries with the highest death counts per population.

6. **Continent-wise Analysis**
    - Break down data by continent, showing continents with the highest death counts per population.

7. **Global Numbers**
    - Provide global COVID-19 statistics, including total cases and deaths over time.

8. **Total Population vs Vaccinations**
    - Investigate the relationship between total population and COVID-19 vaccinations, considering rolling vaccination counts.

9. **Temporary Table Usage**
    - Utilize a temporary table (`#PercentPopulationVaccinated`) to store and analyze vaccination data.

10. **Creating a View for Visualization**
    - Create a view (`PercentPopulationVaccinated`) to store data for later visualizations, focusing on vaccination statistics.

## Usage

1. Ensure that the necessary data files (`CovidDeaths.xlsx` and `CovidVaccinations.xlsx`) are available in the project directory.
2. Execute the SQL queries in a compatible SQL environment, considering the dependencies between queries.
3. Visualize the results using your preferred data visualization tools.

## Notes
- The project assumes the existence of a database named `PortfolioProject` containing the required tables.
- Data files (`CovidDeaths.xlsx` and `CovidVaccinations.xlsx`) are essential for proper execution.

Feel free to explore, modify, and adapt the code to suit your specific needs. If you encounter any issues or have suggestions for improvement, please create an issue or contribute to the project.

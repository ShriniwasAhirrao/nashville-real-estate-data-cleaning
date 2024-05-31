# Nashville Housing Dataset Analysis

This project involves cleaning and preparing the Nashville Housing dataset for further analysis. The dataset is available in the file `Nashville Housing Data for Data Cleaning.xlsx`. The primary goal of this project was to perform data cleaning to enhance the dataset's usability.

## Project Overview

The key tasks performed in this project include:

1. **Standardizing Date Format**:
   - Ensured all date entries are in a consistent format to facilitate proper sorting and analysis.

2. **Populating Property Address Data**:
   - Filled in any missing property address information to complete the dataset.

3. **Breaking Out Address into Individual Columns**:
   - Separated the address into individual columns: `Address`, `City`, and `State` for better data manipulation and analysis.

4. **Changing 'Y' and 'N' to 'Yes' and 'No'**:
   - Standardized the "Sold as Vacant" field by replacing 'Y' with 'Yes' and 'N' with 'No' for better readability and consistency.

5. **Removing Duplicates**:
   - Identified and removed duplicate entries to ensure data integrity and accuracy.

6. **Deleting Unused Columns**:
   - Removed columns that were not useful for the analysis to streamline the dataset.

## Dataset

The dataset used for this project is named `Nashville Housing Data for Data Cleaning.xlsx`. It contains information about housing properties in Nashville, including details like property address, sale date, sale price, and other relevant attributes.

## File Structure

- `Nashville Housing Data for Data Cleaning.xlsx`: The raw dataset before and after cleaning.

## SQL Server Management Studio (SSMS)

The data cleaning was performed using SQL Server Management Studio (SSMS). Below are the steps to set up and use SSMS for this project.

### Steps to Set Up

1. **Install SQL Server**:
   - Download and install the latest version of SQL Server from the [official Microsoft SQL Server website](https://www.microsoft.com/en-us/sql-server/sql-server-downloads).

2. **Install SQL Server Management Studio (SSMS)**:
   - Download and install SSMS from the [official SQL Server Management Studio download page](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms).

3. **Import the Dataset**:
   - Open SSMS and connect to your SQL Server instance.
   - Create a new database, for example, `NashvilleHousing`.
   - Use the import wizard or write a script to import the `Nashville Housing Data for Data Cleaning.xlsx` into a table.

## License

This project is licensed under the MIT License.


Create database HousingData

/* Cleaning the data in sql Queries */

Select * 
from HousingData.dbo.NashvilleHousing
 

--------------------------------------------------------------------------------------------------------------------------

-- Standardize Date Format



Select SaleDate
from HousingData.dbo.NashvilleHousing



Select SaleDate, Convert(Date, SaleDate)  
from HousingData.dbo.NashvilleHousing

update NashvilleHousing
SET SaleDate =  Convert(Date, SaleDate)

Alter table NashvilleHousing
add SaleDateConverted Date;

Update NashvilleHousing 
set SaleDateConverted = convert(Date, SaleDate )


--------------------------------------------------------------------------------------------------------------------------

-- Populate Property Address data

Select PropertyAddress  
from HousingData.dbo.NashvilleHousing
Where PropertyAddress is null


Select * 
from NashvilleHousing
order by ParcelID 

  


update a
set PropertyAddress = isnull (a.PropertyAddress, b.PropertyAddress) 
from NashvilleHousing  a
join NashvilleHousing  b
on  a.ParcelID  = b.ParcelID 
AND a.[UniqueID] <> b.[UniqueID]
where  a.PropertyAddress is null 

--------------------------------------------------------------------------------------------------------------------------

-- Breaking out Address into Individual Columns (Address, City, State)

select PropertyAddress 
from NashvilleHousing 


select 
SUBSTRING(PropertyAddress, 1,CHARINDEX(',', PropertyAddress) -1 ) As address
, SUBSTRING(PropertyAddress,  CHARINDEX(',', PropertyAddress) +1 , LEN(PropertyAddress))	As address
from NashvilleHousing


Alter table NashvilleHousing
add PropertySplitAddress NVARCHAR(255);

Update NashvilleHousing 
set PropertySplitAddress = SUBSTRING(PropertyAddress, 1,CHARINDEX(',', PropertyAddress) -1 ) 



ALTER TABLE NashvilleHousing
ADD PropertySplitCityNew NVARCHAR(255);


Update NashvilleHousing 
set PropertySplitCityNew = SUBSTRING(PropertyAddress,  CHARINDEX(',', PropertyAddress) +1 , LEN(PropertyAddress))	

Select * from NashvilleHousing




--0wners address 

Select OwnerAddress 
from NashvilleHousing


-- BY USING  PARSNAME 

SELECT 
PARSENAME( REPLACE ( OwnerAddress, ',', '.') ,3)
,PARSENAME( REPLACE ( OwnerAddress, ',', '.') ,2)
,PARSENAME( REPLACE ( OwnerAddress, ',', '.') ,1)
from NashvilleHousing


-- adding columns in the dataset :

ALTER TABLE NashvilleHousing
ADD OwnerSplitAddress NVARCHAR(255);

Update NashvilleHousing 
set OwnerSplitAddress = PARSENAME( REPLACE ( OwnerAddress, ',', '.') ,3)


ALTER TABLE NashvilleHousing
ADD OwnerSplitCity NVARCHAR(255);

Update NashvilleHousing 
set OwnerSplitCity =PARSENAME( REPLACE ( OwnerAddress, ',', '.') ,2)


ALTER TABLE NashvilleHousing
ADD OwnerSplitState NVARCHAR(255);

Update NashvilleHousing 
set OwnerSplitState = PARSENAME( REPLACE ( OwnerAddress, ',', '.') ,1)

Select * from NashvilleHousing

--------------------------------------------------------------------------------------------------------------------------


-- Change Y and N to Yes and No in "Sold as Vacant" field

Select  distinct (SoldAsVacant), Count(SoldAsVacant)
from NashvilleHousing
Group by SoldAsVacant
order by 2


Select SoldAsVacant
, case 
		when SoldAsVacant = 'Y'then 'Yes'
		when SoldAsVacant =  'N' then 'No'
		else SoldAsVacant
		End
from NashvilleHousing


Update  NashvilleHousing
SET SoldAsVacant = case 
		when SoldAsVacant = 'Y'then 'Yes'
		when SoldAsVacant =  'N' then 'No'
		else SoldAsVacant
		End
from NashvilleHousing




-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Remove Duplicates


WITH RowNumCTE as (

Select * ,
ROW_NUMBER() over(
Partition by parcelID,
		     PropertyAddress,
			 SalePrice,
			 SaleDate,
			 LegalReference
			 ORDER BY 
				UniqueID
				) Row_Num

from NashvilleHousing
--order by ParcelID
)
-- delete 
Select *
from RowNumCTE
Where Row_Num >1
--order by PropertyAddress



Select * from NashvilleHousing

---------------------------------------------------------------------------------------------------------

-- Delete Unused Columns

select *
from NashvilleHousing


alter table NashvilleHousing
drop column OwnerAddress, TaxDistrict, PropertyAddress

alter table NashvilleHousing
drop column SaleDate

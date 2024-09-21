/*
Cleaning Data in SQL Queries
*/

select *
from ProjectProfile..NashvilleHousing


--Standardize Date Format
select saledate, CONVERT(date, SaleDate)
from ProjectProfile..NashvilleHousing

ALTER TABLE ProjectProfile..NashvilleHousing 
ALTER COLUMN SaleDate DATE;

Update ProjectProfile..NashvilleHousing
SET SaleDate = CONVERT(Date,SaleDate)


-- Populate Property Address data
Select *
From ProjectProfile..NashvilleHousing
--Where PropertyAddress is null
order by ParcelID

select a.PropertyAddress, b.PropertyAddress, a.ParcelID, b.ParcelID
from projectProfile..NashvilleHousing a
join projectProfile..NashvilleHousing b
on a.ParcelID = b.ParcelID
and a.[UniqueID] <> B.[UniqueID]

select a.PropertyAddress, b.PropertyAddress, a.ParcelID, b.ParcelID, isnull( a.PropertyAddress, b.PropertyAddress)
from projectProfile..NashvilleHousing a
join projectProfile..NashvilleHousing b
on a.ParcelID = b.ParcelID
and a.[UniqueID] <> B.[UniqueID]
where a.PropertyAddress is null

update a
set propertyaddress = isnull( a.PropertyAddress, b.PropertyAddress)
from projectProfile..NashvilleHousing a
join projectProfile..NashvilleHousing b
on a.ParcelID = b.ParcelID
and a.[UniqueID] <> B.[UniqueID]
where a.PropertyAddress is null


-- Breaking out Address into Individual Columns (Address, City, State)

Select PropertyAddress
From ProjectProfile..NashvilleHousing
--Where PropertyAddress is null
--order by ParcelID

Select 
SUBSTRING (propertyaddress, 1, CHARINDEX(',', propertyaddress) -1) as Address
,SUBSTRING (propertyaddress, CHARINDEX(',', propertyaddress) +1, LEN(propertyaddress)) as Address
From ProjectProfile.dbo.NashvilleHousing

ALTER TABLE ProjectProfile.dbo.NashvilleHousing
Add PropertySplitAddress Nvarchar(255);

Update ProjectProfile.dbo.NashvilleHousing
SET PropertySplitAddress = SUBSTRING (propertyaddress, 1, CHARINDEX(',', propertyaddress) -1)

ALTER TABLE ProjectProfile.dbo.NashvilleHousing
Add PropertyCity Nvarchar(255);

Update ProjectProfile.dbo.NashvilleHousing
SET PropertyCity = SUBSTRING (propertyaddress, CHARINDEX(',', propertyaddress) +1, LEN(propertyaddress))

select *
from ProjectProfile..NashvilleHousing


select owneraddress
from ProjectProfile..NashvilleHousing

select 
PARSENAME(replace(owneraddress,',','.'), 3)
,PARSENAME(replace(owneraddress,',','.'), 2)
,PARSENAME(replace(owneraddress,',','.'), 1)
from ProjectProfile..NashvilleHousing


ALTER TABLE ProjectProfile..NashvilleHousing
Add OwnerSplitAddress Nvarchar(255);

Update ProjectProfile..NashvilleHousing
SET OwnerSplitAddress = PARSENAME(replace(owneraddress,',','.'), 3)

ALTER TABLE ProjectProfile..NashvilleHousing
Add OwnerCity Nvarchar(255);

Update ProjectProfile..NashvilleHousing
SET PropertyCity = PARSENAME(replace(owneraddress,',','.'), 2)

ALTER TABLE ProjectProfile..NashvilleHousing
Add OwnerState Nvarchar(255);

Update ProjectProfile..NashvilleHousing
SET PropertyCity = PARSENAME(replace(owneraddress,',','.'), 1)

Select *
From ProjectProfile.dbo.NashvilleHousing


-- Change Y and N to Yes and No in "Sold as Vacant" field

select distinct (soldasvacant), COUNT (soldasvacant)
From ProjectProfile.dbo.NashvilleHousing
group by SoldAsVacant
order by 2

Select SoldAsVacant
, CASE when SoldAsVacant = 'Y' then 'Yes'
	when SoldAsVacant = 'N' then 'No'
	Else SoldAsVacant
	End
From ProjectProfile.dbo.NashvilleHousing

Update ProjectProfile..NashvilleHousing
Set SoldAsVacant = CASE when SoldAsVacant = 'Y' then 'Yes'
	when SoldAsVacant = 'N' then 'No'
	Else SoldAsVacant
	End

select distinct (soldasvacant), COUNT (soldasvacant)
From ProjectProfile.dbo.NashvilleHousing
group by SoldAsVacant
order by 2


-- Remove Duplicates

WITH RowNumCTE AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference
            ORDER BY UniqueID
        ) AS row_num
FROM ProjectProfile.dbo.NashvilleHousing
)
Select *
From RowNumCTE
Where row_num > 1
Order by PropertyAddress

Select *
From ProjectProfile.dbo.NashvilleHousing


-- Delete Unused Columns

ALTER TABLE ProjectProfile.dbo.NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress

Select *
From ProjectProfile.dbo.NashvilleHousing

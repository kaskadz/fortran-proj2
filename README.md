# Fortran - project 2

## Task 1
Proszę napisać metodę mnożącą dwie macierze o poniższym interfejsie:

```fortran
subroutine mm(first, second, multiply, status)
implicit none
real (kind = 8), intent(in) :: first(:,:) ! pierwsza macierz
real (kind = 8), intent(in) :: second(: ,:) ! druga macierz
real (kind = 8), intent(out) :: multiply(:,:) ! macierz wynikowa
integer (kind = 4), intent(out) :: status ! kod błędu, 0 gdy OK
end subroutine
```

Metodę tą proszę przetestować za pomocą pFUnit. Jako przypadki testowe
proszę przyjąć:
- dwie macierze 1 × 1
- macierze 1 × N oraz N × 1 (obie kombinacje)
- macierze bardzo duże
- macierze, których rozmiary matematycznie nie pozwalają na poprawne pomnożenie
- przypadek “standardowy” z macierzami prostokątnymi małych rozmiarów
- dodatkowe przypadki, szczególnie dodatkowe skrajne mogące sprawić problemy obliczeniowe (jeśli takie występują)

## Task 2
Proszę wykonać poniższe optymalizacje:

1. proszę użyć: `multiply(i,j)=dot_product(first(i,:),second(:,j))`:
2. proszę wykorzystać cache podobnie do [fmm3.F90](https://github.com/macwozni/OORA/blob/master/Fortran/fmm3.F90)
3. proszę użyć obu powyższych obu wersji na raz
4. proszę dobrać odpowiednią wartość zmiennej ichunk adekwatną do cache swojego systemu

Proszę przetestować wszystkie modyfikacje za pomocą testów jednostkowych
z zadania 1.

## Task 3
Proszę przetestować wydajność powyższych rozwiązań używając opcji optymalizacji
-O2. Dodatkowo proszę porównać je z funkcją wbudowaną matmul.
Proszę narysować wykres gdzie na osi X znajduje się rozmiar macierzy
N × N, na osi Y czas wykonania w sekundach. Proszę o zachowanie
skali logarytmicznej na obu osiach oraz wszystkich sposobów mnożenia
macierzy na jednym wykresie.
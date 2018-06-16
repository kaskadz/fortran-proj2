module naive
  contains
  subroutine mm(firstmx, secondmx, resultmx, status)
    real (kind = 8), intent(in) :: firstmx(:,:)                ! first matrix
    real (kind = 8), intent(in) :: secondmx(:,:)               ! second matrix
    real (kind = 8), intent(out) :: resultmx(:,:)              ! result matrix
    integer (kind = 4) :: rowsF, rowsS, colsF, colsS, r, c, i
    integer (kind = 4) :: resultshape(2)
    integer (kind = 4), intent(out) :: status                  ! status code (0 means OK)

    ! check initial conditions
    rowsF = size(first, 1)
    colsF = size(first, 2)
    rowsS = size(second, 1)
    colsS = size(second, 2)
    resultshape = shape(resultmx)

    resultmx = 0

    do r = 1, rowsF
      do c = 1, colsS
        do i = 1, colsF
          resultmx(r, c) = resultmx(r, c) + first(r, i) * second(i, c)
        end do
      end do
    end do

    status = 0
  end subroutine

  function modname()
    character(len=32) :: modname
    modname="basic"
  end function
end module

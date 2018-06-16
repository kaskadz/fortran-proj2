module basic
  contains
  subroutine mm(firstmx, secondmx, resultmx, status)
    real (kind = 8), intent(in) :: firstmx(:,:)                ! first matrix
    real (kind = 8), intent(in) :: secondmx(:,:)               ! second matrix
    real (kind = 8), intent(out) :: resultmx(:,:)              ! result matrix
    integer (kind = 4) :: rowsF, rowsS, colsF, colsS, r, c, i
    integer (kind = 4) :: resultshape(2)
    integer (kind = 4), intent(out) :: status                  ! status code (0 means OK)

    ! check initial conditions
    rowsF = size(firstmx, 1)
    colsF = size(firstmx, 2)
    rowsS = size(secondmx, 1)
    colsS = size(secondmx, 2)
    resultshape = shape(resultmx)

    if (colsF .NE. rowsS) then
      status = 1
      return
    end if

    if (ANY((resultshape - (/rowsF, colsS/)) /= 0)) then
      status = 2
      return
    end if

    resultmx = 0

    do r = 1, rowsF
      do c = 1, colsS
        do i = 1, colsF
          resultmx(r, c) = resultmx(r, c) + firstmx(r, i) * secondmx(i, c)
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

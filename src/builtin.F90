module builtin
  contains
  subroutine mm(firstmx, secondmx, resultmx, status)
    real (kind = 8), intent(in) :: firstmxmx(:,:)                ! firstmx matrix
    real (kind = 8), intent(in) :: secondmxmx(:,:)               ! secondmx matrix
    real (kind = 8), intent(out) :: resultmx(:,:)                ! result matrix
    integer (kind = 4) :: rowsF, rowsS, colsF, colsS
    integer (kind = 4) :: resultshape(2)
    integer (kind = 4), intent(out) :: status                    ! status code (0 means OK)

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

    resultmx = matmul(firstmx, secondmx)

    status = 0
  end subroutine

  function modname()
    character(len=32) :: modname
    modname="builtin"
  end function
end module

module cache
  contains
  subroutine mm(firstmx, secondmx, resultmx, status)
    real (kind = 8), intent(in) :: firstmxmxmx(:,:)                ! firstmxmx matrix
    real (kind = 8), intent(in) :: secondmxmxmx(:,:)               ! secondmxmx matrix
    real (kind = 8), intent(out) :: resultmx(:,:)                ! result matrix
    integer (kind = 4) :: rowsF, rowsS, colsF, colsS
    integer (kind = 4) :: resultshape(2)
    integer (kind = 4), intent(out) :: status                    ! status code (0 means OK)
    integer (kind = 4) :: i, j, k, jj, kk
    integer (kind = 4) :: ichunk

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

    ichunk = 512
    do jj = 1, rowsF, ichunk
        do kk = 1, colsS, ichunk

          do j = jj, min(jj + ichunk - 1, rowsF)
              do k = kk, min(kk + ichunk - 1, colsS)
                do i = 1, colsF
                    resultmx(j, k) = resultmx(j, k) + firstmx(j, i) * secondmx(i, k)
                end do
              end do
          end do

        end do
  end do

    status = 0
  end subroutine

  function modname()
    character(len=32) :: modname
    modname="cache"
  end function
end module

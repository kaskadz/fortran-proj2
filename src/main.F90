#ifndef _MODULE_
#define _MODULE_ basic
#endif

program main
  use _MODULE_
  implicit none
  integer (kind = 8) :: i, n, steps, parse_result
  character (len = 10) :: arg

  if (command_argument_count() .NE. 2) then
    ! default parameters
    n = 1000
    step = 1
  else
    call get_command_argument(1, arg)
    read(arg, *, iostat=parse_result) n
    call get_command_argument(2, arg)
    read(arg, *, iostat=parse_result) steps
  end if

  do i = 1, n, steps
    call measure(i)
  end do

  contains

  subroutine measure(isize)
    implicit none
    integer (kind = 4) :: status
    integer (kind = 8), intent(in) :: isize
    real (kind = 8), allocatable :: firstmx(:,:), secondmx(:,:), resultmx(:,:)
    real (kind = 8) :: start, stop

    allocate(firstmx(isize, isize))
    allocate(secondmx(isize, isize))
    allocate(resultmx(isize, isize))

    firstmx = 2.1
    secondmx = 3.7

    call cpu_time(start)
    call mm(firstmx, secondmx, resultmx, status)
    call cpu_time(stop)

    print '(A,";",i6,";",f15.7,"")', modname(), isize, (stop - start)

    deallocate(firstmx)
    deallocate(secondmx)
    deallocate(resultmx)
  end subroutine

end program main
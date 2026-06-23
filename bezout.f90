!python implementation

!def bezout(a, b, top_level=True):
!    """the minimal pair of bezout coefficients (they are infinite!)
!    ax + by = gcd(a, b);
!    (x + k*b/gcd, y - k*a/gcd)
!    a(x + k*b/gcd) + b(y - k*a/gcd) = gcd"""
!    if b == 0:
!        x, y, g = 1, 0, a
!        print(f"{a}*{x} + {b}*{y} = {g}")
!        return x, y, g
!    else:
!        q = a // b
!        r = a % b
!        print(f"{a} = {b}*{q} + {r} (q = {q}, r = {r})")
!        x, y, g = bezout(b, r, top_level=False)
!        x, y = y, x - q * y
!        print(f"{a}*{x} + {b}*{y} = {g}")
!        
!        if top_level:
!            print(f"gcd = {g}")
!            print(f"general solution: ({x} + k*{b//g}, {y} - k*{a//g})")
!            print(f"general form: {b}({y}-{a//g}k) + {a}({x}+{b//g}k) = {g}")
!        return x, y, g

module bezout_mod
  implicit none
contains

  recursive subroutine bezout(a, b, x, y, g, top_level)
    integer, intent(in)  :: a, b
    integer, intent(out) :: x, y, g
    logical, intent(in)  :: top_level

    integer :: q, r, x1, y1, g1

    if (b == 0) then
      x = 1; y = 0; g = a
      write(*,'(I0,"*",I0," + ",I0,"*",I0," = ",I0)') a, x, b, y, g
    else
      q = a / b
      r = mod(a, b)
      write(*,'(I0," = ",I0,"*",I0," + ",I0," (q = ",I0,", r = ",I0,")")') a, b, q, r, q, r
      call bezout(b, r, x1, y1, g1, .false.)
      x = y1
      y = x1 - q * y1
      g = g1
      write(*,'(I0,"*",I0," + ",I0,"*",I0," = ",I0)') a, x, b, y, g

      if (top_level) then
        write(*,'("gcd = ",I0)') g
        write(*,'("general solution: (",I0," + k*",I0,", ",I0," - k*",I0,")")') &
          x, b/g, y, a/g
        write(*,'("general form: ",I0,"(",I0,"-",I0,"k) + ",I0,"(",I0,"+",I0,"k) = ",I0)') &
          b, y, a/g, a, x, b/g, g
      end if
    end if
  end subroutine bezout

end module bezout_mod

program main
  use bezout_mod
  implicit none
  integer :: x, y, g
  call bezout(35, 15, x, y, g, .true.)
end program main

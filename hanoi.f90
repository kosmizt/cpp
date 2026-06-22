!equivalent .py code:
! def hanoi(n, src, dst, aux):
! if n == 1:
!        print(f"Move disk 1 from {src} to {dst}")
!        return
!    hanoi(n - 1, src, aux, dst)
!    print(f"Move disk {n} from {src} to {dst}")
!    hanoi(n - 1, aux, dst, src)
!
!hanoi(3, 'A', 'C', 'B')

program hanoi_tower
    implicit none
    integer :: n_disks
    
    ! Set number of disks
    n_disks = 3
    
    print *, "Solving Tower of Hanoi with", n_disks, "disks:"
    call hanoi(n_disks, 'A', 'C', 'B')
    print *, "Total moves:", 2**n_disks - 1
    
contains

    recursive subroutine hanoi(n, src, dst, aux)
        implicit none
        integer, intent(in) :: n
        character(len=1), intent(in) :: src, dst, aux
        
        if (n == 1) then
            print *, "Move disk 1 from ", src, " to ", dst
            return
        end if
        
        call hanoi(n-1, src, dst, aux)
        print *, "Move disk", n, " from ", src, " to ", dst
        call hanoi(n-1, aux, dst, src)
    end subroutine hanoi

!    program main
!        call hanoi(3, 'A', 'C', 'B')
    
end program hanoi_tower

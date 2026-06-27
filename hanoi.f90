!equivalent .py code:
! def hanoi(n, src, dst, aux):
! if n == 0:
!       return 0
! count = hanoi(n - 1, src, aux, dst)
! print(f"Move disk {n} from {src} to {dst}")
! return count + 1 + hanoi(n - 1, aux, dst, src)
!
!print(f"Total moves: {hanoi(n, 'A', 'C', 'B')}")
!total_moves = (2 ** n)-1
!print(f"Total moves required: {total_moves}")


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
!        call hanoi(n_disks, 'A', 'C', 'B')

! counting moves
program hanoi_tower
    implicit none
    
    print *, "Total moves:", hanoi(n_disks, 'A', 'C', 'B')
    
contains

    recursive integer function hanoi(n, src, dst, aux) result(moves)
        implicit none
        integer, intent(in) :: n
        character(len=1), intent(in) :: src, dst, aux
        
        if (n == 0) then
            moves = 0
            return
        end if
        
        moves = hanoi(n-1, src, aux, dst)
        print *, "Move disk", n, " from ", src, " to ", dst
        moves = moves + 1 + hanoi(n-1, aux, dst, src)
    end function hanoi
    
end program hanoi_tower
end program hanoi_tower

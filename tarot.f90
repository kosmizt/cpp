program tarot
    implicit none

    integer, parameter :: NMAJORS   = 22
    integer, parameter :: NRANKS    = 14
    integer, parameter :: NSUITS    = 4
    integer, parameter :: DECK_SIZE = 78

    character(len=40), parameter :: MAJORS(NMAJORS) = [ &
        "The Fool/Le Mat                         ", &
        "The Magician/Le Bateleur                ", &
        "The High Priestess/La Papesse           ", &
        "The Empress/L'Imperatrice               ", &
        "The Emperor/L'Empereur                  ", &
        "The Hierophant/Le Pape                  ", &
        "The Lovers/L'Amoureux                   ", &
        "The Chariot/Le Chariot                  ", &
        "Justice/La Justice                      ", &
        "The Hermit/L'Hermite                    ", &
        "Wheel of Fortune/La Roue de Fortune     ", &
        "Strength/La Force                       ", &
        "The Hanged Man/Le Pendu                 ", &
        "XIII                                    ", &
        "Temperance/Temperance                   ", &
        "The Devil/Le Diable                     ", &
        "The Tower/La Maison Dieu                ", &
        "The Star/L'Etoile                       ", &
        "The Moon/La Lune                        ", &
        "The Sun/Le Soleil                       ", &
        "Judgement/Le Jugement                   ", &
        "The World/Le Monde                      " ]

    character(len=20), parameter :: RANKS(NRANKS) = [ &
        "A                   ", &
        "2                   ", &
        "3                   ", &
        "4                   ", &
        "5                   ", &
        "6                   ", &
        "7                   ", &
        "8                   ", &
        "9                   ", &
        "10                  ", &
        "Page/Valet          ", &
        "Knight/Cavalier     ", &
        "Queen/Reine         ", &
        "King/Roi            " ]

    character(len=20), parameter :: SUITS(NSUITS) = [ &
        "Wands/Batons        ", &
        "Cups/Coupes         ", &
        "Swords/Epees        ", &
        "Pentacles/Deniers   " ]

    integer :: deck(DECK_SIZE), i, j, tmp, n, si, ri, red, pos
    real    :: r
    character(len=70) :: cname
    character(len=10) :: orient

    call random_seed()

    do i = 1, DECK_SIZE
        deck(i) = i - 1
    end do

    ! Fisher-Yates shuffle
    do i = DECK_SIZE, 2, -1
        call random_number(r)
        j = int(r * i) + 1
        tmp = deck(i); deck(i) = deck(j); deck(j) = tmp
    end do

    do pos = 1, 3
        n = deck(pos)

        if (n < NMAJORS) then
            cname = trim(MAJORS(n+1))
        else
            j  = n - NMAJORS
            si = j / NRANKS + 1
            ri = mod(j, NRANKS) + 1
            cname = trim(RANKS(ri)) // " of " // trim(SUITS(si))
        end if

        call random_number(r)
        if (r < 0.5) then
            orient = "upright"
        else
            orient = "reversed"
        end if

        red = n
        do while (red > 9 .and. red /= 11 .and. red /= 22)
            red = digit_sum(red)
        end do

        write(*,'(I1,A,I2.2,A,A,A,A,A,I2)') &
            pos, ". #", n, " | ", trim(cname), " | ", trim(orient), " | numerology=", red
    end do

contains

    integer function digit_sum(x)
        integer, intent(in) :: x
        integer :: t, s
        s = 0; t = x
        do while (t > 0)
            s = s + mod(t, 10)
            t = t / 10
        end do
        digit_sum = s
    end function digit_sum

end program tarot

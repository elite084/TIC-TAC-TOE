# TIC-TAC-TOE

🎮 Project Description
This project is a modular Verilog-based simulation of a classic two-player Tic-Tac-Toe game. It does not feature any AI or automated opponents — instead, it manages and validates turn-based gameplay between two human players. After each move, the game state is updated, and the system checks for a winning or draw condition.

🧩 Implemented Modules

🔹 TCell – Individual Cell Logic
    This module represents a single cell on the 3×3 game board.

Inputs:

    clk, set, reset, and the player's symbol (X or O).

Outputs:

    valid – Indicates whether the cell is occupied.
    symbol – Stores the current symbol in the cell.

Key Features:

    Synchronous reset and set signals.
    A cell can be set only once, unless it is explicitly reset.
    Reset has priority over set to maintain consistent state control.

🔹 TBox – Game Board Controller
    This module builds the entire 3×3 board by instantiating 9 TCell modules.

Inputs:
    row and column (2-bit each) to determine the cell targeted for a move.

Functionality:

    Manages alternating turns, with Player X going first.
    Assigns symbols accordingly (X or O).
    Disables further moves once the game is over (win or draw).

Outputs:

    valid[8:0] – Status of each cell (whether it's filled).
    symbol[8:0] – Symbols stored in each cell.
    game_state[1:0] – Encodes the game status: ongoing, win, or draw.

🕹 Game Logic and Rules

    Player X always goes first.
    Once the game ends (either by win or draw), no further moves are accepted until a reset is issued.
    Only valid board positions are accepted (via a 1-based index decoder).
    The game includes built-in logic to detect wins and draws automatically after each move.


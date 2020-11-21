class Game{
  String player;
  List board;
  Game(){
    restart();
  }
  void select(int i,int j){
    if(board[i][j]!="") throw new Exception("Invalid move");
    board[i][j]=player;
    changePlayer();
  }

  void restart(){
    board = [["","",""],["","",""],["","","",""]];
    player = "X";
  }

  String getElement(int i,int j){
    return board[i][j];
  }

  void changePlayer(){
    if(player=="X") player="O";
    else player = "X";
  }

  bool isWin(){
    return diagonalWin() || columnWin() || rowWin();
  }

  bool diagonalWin(){
    return (board[0][0]!="" && board[0][0]==board[1][1] && board[1][1]==board[2][2])
        || (board[0][2]!="" && board[0][2]==board[1][1] && board[1][1]==board[2][0]);
  }

  bool columnWin(){
    for(var i=0;i<3;i++){
      if(board[0][i]!="" && board[0][i]==board[1][i] && board[1][i]==board[2][i]) return true;
    }
    return false;
  }
  bool rowWin(){
    for(var i=0;i<3;i++){
      if(board[i][0]!="" && board[i][0]==board[i][1] && board[i][1]==board[i][2]) return true;
    }
    return false;
  }
}
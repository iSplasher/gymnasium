void keyPressed()
{
  if(key=='a')
    keys[0]=true;
  if(key=='d')
    keys[1]=true;
  if(key=='w')
    keys[2]=true;
  if(key=='s')
    keys[3]=true;
    
  if(key=='j')
    keys[10]=true;
  if(key=='l')
    keys[11]=true;
  if(key=='i')
    keys[12]=true;
  if(key=='k')
    keys[13]=true;
}

void keyReleased()
{
  if(key=='a')
    keys[0]=false;
  if(key=='d')
    keys[1]=false;
  if(key=='w')
    keys[2]=false;
  if(key=='s')
    keys[3]=false;
    
  if(key=='j')
    keys[10]=false;
  if(key=='l')
    keys[11]=false;
  if(key=='i')
    keys[12]=false;
  if(key=='k')
    keys[13]=false;
} 
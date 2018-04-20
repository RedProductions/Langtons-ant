int currentTime = 0;
int pastTime = 0;
int deltaTime = 0;

int spawnRate = 10;
int lastSpawned = 0;

void timeCalc(){
  
  pastTime = currentTime;
  currentTime = millis();
  
  deltaTime = currentTime - pastTime;
  
}
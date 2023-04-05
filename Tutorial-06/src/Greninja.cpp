#include "Greninja.h"

#include <iostream>

void Greninja::sayHi() const {
  std::cout << "Greninja ~~" << std::endl;
}


#if defined(ENABLE_MEGA)
bool Greninja::megaEvolve() {
  std::cout << "MEGA Greninja!!"<< std::endl;
  return true;
}
#endif


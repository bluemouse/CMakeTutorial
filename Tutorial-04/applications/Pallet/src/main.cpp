#include <Pikachu.h>
#if defined(ENABLE_MEGA)
#include <Greninja.h>
#endif

int main(int argc, char *argv[]) {
  Pikachu().sayHi();
#if defined(ENABLE_MEGA)
  Greninja().megaEvolve();
#endif
}
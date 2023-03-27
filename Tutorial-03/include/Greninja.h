#include <Pokemon.h>

class Pikachu: public Pokemon {
  public:
    void sayHi() const;
#if defined(ENABLE_MEGA)
    virtual void megaEvolve();
#endif
};
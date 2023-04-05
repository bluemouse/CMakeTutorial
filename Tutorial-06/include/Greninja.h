#pragma once

#include <Pokemon.h>

class Greninja : public Pokemon {
public:
  void sayHi() const;
#if defined(ENABLE_MEGA)
    virtual bool megaEvolve();
#endif
};
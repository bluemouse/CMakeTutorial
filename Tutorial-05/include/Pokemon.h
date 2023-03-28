class Pokemon {
public:
  virtual ~Pokemon() {}

  virtual void sayHi() const = 0;
#if defined(ENABLE_MEGA)
  virtual bool megaEvolve();
#endif
};
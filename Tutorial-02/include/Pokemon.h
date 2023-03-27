class Pokemon {
public:
  virtual ~Pokemon() {}

  virtual void sayHi() const = 0;
};
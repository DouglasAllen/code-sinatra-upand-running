# Defining a `GET` handler also automatically defines
# a `HEAD` handler.
def get(path, opts = {}, &block)
  conditions = @conditions.dup
  route('GET', path, opts, &block)

  @conditions = conditions
  route('HEAD', path, opts, &block)
end

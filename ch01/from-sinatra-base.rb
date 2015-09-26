# Run routes defined on the class and all superclasses.
def route!(base = settings, pass_block = nil)
  if routes = base.routes[@request.request_method]
    routes.each do |pattern, keys, conditions, block|
      returned_pass_block = process_route(pattern, keys, conditions) do |*args|
        env['sinatra.route'] = block.instance_variable_get(:@route_name)
        route_eval { block[*args] }
      end

      # don't wipe out pass_block in superclass
      pass_block = returned_pass_block if returned_pass_block
    end
  end

  # Run routes defined in superclass.
  if base.superclass.respond_to?(:routes)
    return route!(base.superclass, pass_block)
  end

  route_eval(&pass_block) if pass_block
  route_missing
end

# Defining a `GET` handler also automatically defines
# a `HEAD` handler.
def get(path, opts = {}, &block)
  conditions = @conditions.dup
  route('GET', path, opts, &block)

  @conditions = conditions
  route('HEAD', path, opts, &block)
end

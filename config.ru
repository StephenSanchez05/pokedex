require './config/environment'

use Rack::MethodOverride
use UserController
use TrainerController
use PokemonController
run ApplicationController

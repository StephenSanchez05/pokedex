require './config/environment'

use Rack::MethodOverride
use TrainerController
use PokemonController
run ApplicationController

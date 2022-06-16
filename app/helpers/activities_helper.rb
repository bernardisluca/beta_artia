module ActivitiesHelper
  def set_finished(finished)
    finished ? 'Completo' : 'Em andamento'
  end
end

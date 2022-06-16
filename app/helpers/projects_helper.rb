module ProjectsHelper
  def set_is_late(is_late)
    is_late ? 'Sim' : 'Não'
  end
end

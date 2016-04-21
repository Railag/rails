module ApplicationHelper
  def admin?
    request.authorization.present? && (request.authorization.split(' ', 2).first == 'Basic')
  end
end
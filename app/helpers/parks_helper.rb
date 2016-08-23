module ParksHelper

  def park_buttons(park, score)
    if current_user.parks.include?(park)
      link_to "Remove from MyParks", user_park_path(park), method: :delete, class: "btn btn-primary unfriend-button"
    else
      link_to "Add to MyParks", user_parks_path(park_id: park), method: :post, class: "btn btn-primary unfriend-button"
    end
  end

  def new_park_buttons(park, score)
    link_to "Add to MyParks", parks_path(score: score, park: park), method: :post, class: "btn btn-primary unfriend-button"
  end

end

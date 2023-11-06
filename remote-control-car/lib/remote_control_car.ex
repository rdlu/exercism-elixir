defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct nickname: "none", battery_percentage: 100, distance_driven_in_meters: 0

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: distance}) do
    "#{distance} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: 0}) do
    "Battery empty"
  end

  def display_battery(%RemoteControlCar{battery_percentage: bat}) do
    "Battery at #{bat}%"
  end

  def drive(remote_car) when remote_car.battery_percentage == 0 do
    remote_car
  end

  def drive(
        %RemoteControlCar{battery_percentage: bat, distance_driven_in_meters: distance} =
          remote_car
      ) do
    %{
      remote_car
      | distance_driven_in_meters: distance + 20,
        battery_percentage: bat - 1
    }
  end
end

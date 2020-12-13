{ config, ... }:
{
  location.latitude = 52.2226;
  location.longitude = 4.5322;
  services = {
    redshift = {
      enable = true;
      temperature = {
        day = 5700;
        night = 3000;
      };
    };
  };
}

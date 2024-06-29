--ORTAM SESLERINI KAPATMA

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(1)
      for i = 1, 12 do
          EnableDispatchService(i, false)
      end
      SetPlayerWantedLevel(PlayerId(), 0, false)
      SetPlayerWantedLevelNow(PlayerId(), false)
      SetPlayerWantedLevelNoDrop(PlayerId(), 0, false)
      StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE"); -- mekan/ortam sesleri kapatma
      SetAudioFlag("PoliceScannerDisabled",true); 
  end
end)

CreateThread(function()
  while true do
      DistantCopCarSirens(false)
      Citizen.Wait(400)
  end
end)

-- GUNSHOP VB. MUZIK KAPATMA

local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    while true do
        Wait(1000) -- Her saniye kontrol eder
        SetRadioToStationName("OFF") -- Radyo kanalını kapatır
        SetUserRadioControlEnabled(false) -- Kullanıcının radyo kontrolünü devre dışı bırakır
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            SetVehicleRadioEnabled(veh, false) -- Araçtaki radyoyu kapatır
        end
        StartAudioScene("DLC_MPHEIST_TRANSITION_TO_APT_FADE_IN_RADIO_SCENE") -- Müzik sahnesini durdurur
        SetAudioFlag("MobileRadioInGame", false) -- Mobil radyoyu kapatır
    end
end)



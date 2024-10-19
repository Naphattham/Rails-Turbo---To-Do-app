Rails.application.routes.draw do
  # หน้า Home
  get "home/index"
  root 'home#index'

  # เส้นทางสำหรับการจัดการ Messages และ Rooms
  resources :messages
  resources :rooms

  # เส้นทางสำหรับตรวจสอบสถานะสุขภาพของแอป
  get "up" => "rails/health#show", as: :rails_health_check

  # เส้นทางสำหรับ dynamic PWA files
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # เส้นทางสำหรับการจัดการ Categories และ Todos
  resources :categories, except: [:show] do
    resources :todos do
      member do
        patch :toggle_status
      end
    end  
  end
end
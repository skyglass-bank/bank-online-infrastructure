resource "kubernetes_service_v1" "bank_online_api_service" {
  metadata {
    name = "bank-online-api-service"
  }
  spec {
    selector = {
      app = "bank-online-api"
    }
    port {
      port = 8081
    }
  }
}

resource "kubernetes_service_v1" "bank_online_ui_service" {
  metadata {
    name = "bank-online-ui"
  }
  spec {
    selector = {
      app = "bank-online-ui-deployment"
    }
    port {
      port = 4200
    }
  }
}
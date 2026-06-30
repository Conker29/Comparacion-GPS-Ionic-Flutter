import { CommonModule } from '@angular/common';
import { Component, OnDestroy } from '@angular/core';
import {
  IonApp,
  IonButton,
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonContent,
} from '@ionic/angular/standalone';

interface PositionState {
  latitude: number;
  longitude: number;
  accuracy: number;
  timestamp: string;
}

@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html',
  imports: [
    CommonModule,
    IonApp,
    IonButton,
    IonCard,
    IonCardContent,
    IonCardHeader,
    IonCardTitle,
    IonContent,
  ],
})
export class AppComponent implements OnDestroy {
  statusText = 'Listo para localizar';
  errorMessage = '';
  watching = false;
  position: PositionState | null = null;

  private watchId: number | null = null;

  ngOnDestroy(): void {
    this.stopTracking();
  }

  startTracking(): void {
    if (!('geolocation' in navigator)) {
      this.statusText = 'GPS no disponible';
      this.errorMessage = 'Tu dispositivo o navegador no soporta geolocalización.';
      return;
    }

    this.errorMessage = '';
    this.statusText = 'Obteniendo ubicación...';
    this.watching = true;

    if (this.watchId !== null) {
      navigator.geolocation.clearWatch(this.watchId);
    }

    navigator.geolocation.getCurrentPosition(
      (currentPosition) => this.handlePosition(currentPosition),
      (error) => this.handleError(error),
      { enableHighAccuracy: true, timeout: 10000, maximumAge: 0 }
    );

    this.watchId = navigator.geolocation.watchPosition(
      (currentPosition) => this.handlePosition(currentPosition),
      (error) => this.handleError(error),
      { enableHighAccuracy: true, timeout: 10000, maximumAge: 0 }
    );
  }

  stopTracking(): void {
    if (this.watchId !== null) {
      navigator.geolocation.clearWatch(this.watchId);
      this.watchId = null;
    }

    this.watching = false;
    this.statusText = 'Seguimiento detenido';
  }

  private handlePosition(position: GeolocationPosition): void {
    this.position = {
      latitude: position.coords.latitude,
      longitude: position.coords.longitude,
      accuracy: position.coords.accuracy,
      timestamp: new Date(position.timestamp).toLocaleTimeString(),
    };
    this.statusText = 'Ubicación actualizada';
    this.errorMessage = '';
  }

  private handleError(error: GeolocationPositionError): void {
    this.watching = false;
    this.statusText = 'No se pudo obtener la ubicación';

    switch (error.code) {
      case error.PERMISSION_DENIED:
        this.errorMessage = 'Permiso de ubicación denegado.';
        break;
      case error.POSITION_UNAVAILABLE:
        this.errorMessage = 'La ubicación no está disponible.';
        break;
      case error.TIMEOUT:
        this.errorMessage = 'Tiempo de espera agotado.';
        break;
      default:
        this.errorMessage = 'Hubo un error inesperado con el GPS.';
        break;
    }
  }
}

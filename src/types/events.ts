export interface InputChangeEvent extends Event {
  currentTarget: HTMLInputElement;
}

export interface EventHandler<T> {
  (event: T): void;
}

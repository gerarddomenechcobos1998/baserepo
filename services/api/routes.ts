import { Application } from 'express';

export default function routes(app: Application): void {
  app.use('/api/v1');
}

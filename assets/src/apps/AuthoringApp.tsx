import Authoring from './authoring/Authoring';
import { registerApplication } from './app';
import authoringStore from './authoring/store';

registerApplication('Authoring', Authoring, authoringStore);

export {};

declare global {
	namespace NodeJS {
		interface ProcessEnv {
			NAME: string;
		}
	}
}

import path from 'node:path';

import { loadEnv } from 'vite';
import { defineConfig } from 'vitest/config';

export default defineConfig({
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
      '@/public': path.resolve(__dirname, './public'),
    },
  },
  esbuild: {
    jsxInject: `import React from 'react'`,
  },
  test: {
    globals: true, // This is needed by @testing-library to be cleaned up after each test
    include: ['src/**/*.test.{js,jsx,ts,tsx}'],
    coverage: {
      include: ['src/**/*'],
      exclude: ['src/**/*.stories.{js,jsx,ts,tsx}', '**/*.d.ts'],
    },
    environment: 'jsdom', // Default environment for React components
    setupFiles: ['./vitest-setup.ts'],
    env: loadEnv('', process.cwd(), ''),
  },
});

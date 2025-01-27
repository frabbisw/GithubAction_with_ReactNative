import globals from "globals";
import tseslint from "typescript-eslint";
import pluginReact from "eslint-plugin-react";

/** @type {import('eslint').Linter.FlatConfig[]} */
export default [
  // Basic configuration for JavaScript/TypeScript files
  {
    files: ["**/*.{js,mjs,cjs,ts,jsx,tsx}"],
    languageOptions: {
      globals: globals.browser,
    },
  },
  // Specific configuration for plain JavaScript files
  {
    files: ["**/*.js"],
    languageOptions: {
      sourceType: "script",
    },
  },
  // Extend recommended TypeScript and React configurations
  ...tseslint.configs.recommended,
  {
    ...pluginReact.configs.flat.recommended,
    settings: {
      react: {
        version: "detect", // Automatically detect the React version
      },
    },
  },
  // Override rules for specific files (e.g., metro.config.js)
  {
    files: ["metro.config.js"],
    rules: {
      "@typescript-eslint/no-require-imports": "off", // Allow require() in this file
    },
  },
];

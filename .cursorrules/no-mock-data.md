rules:
  - id: no-mock-data
    description: Prevents the model from creating mock data or hardcoded placeholders. Forces actual API integration.
    pattern: ".*"
    directive: |
      Never generate or suggest mock data, placeholder objects, or fake API responses.
      Always attempt to connect to the real API or endpoint, even if authentication, schemas,
      or environment variables are missing. If connection details are unclear, explicitly ask
      the user for the needed information rather than fabricating data.
      Do not write `const mockData = [...]`, `sampleResponse`, `faker`, or similar.
      Only implement actual calls, request/response handling, and error handling for the real API.

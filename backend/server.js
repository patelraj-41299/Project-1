const express = require('express');
const app = express();
const port = 5000;

app.get('/products', (req, res) => {
  res.json([
    { id: 1, name: 'Product A' },
    { id: 2, name: 'Product B' }
  ]);
});

app.listen(port, () => {
  console.log(`Backend server is running on port ${port}`);
});

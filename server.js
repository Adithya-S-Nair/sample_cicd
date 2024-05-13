const express = require('express');
const { exec } = require('child_process');

const app = express();
const port = 5010;

// Route to trigger execution of shell script
app.get('/rundeploy', (req, res) => {
    exec('sh /app/deploy.sh', (err, stdout, stderr) => {
        if (err) {
            console.error(err);
            return res.status(500).send('Error executing script');
        }
        console.log(stdout);
        res.send('Script executed successfully');
    });
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});

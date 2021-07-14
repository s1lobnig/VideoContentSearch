const express = require('express');
const router = express.Router();
const getDb = require("./db").getDb;

// get single image db entry in JSON format
router.get('/:videoid', (req, res) => {
    const videoid = req.params.videoid;
    const minconfidence = req.query.minconfidence
    console.log(videoid);
    let db = getDb();

    // prepare query: join over tables user, users_images and images
    const query = {
        text: `SELECT k.path as keypath, k.confidence
                FROM keyframe k
                  JOIN concept c ON c.id = k.conceptid
                WHERE c.name = $1 and k.confidence >= $2
                ORDER BY 2`,
        values: [videoid, minconfidence]
    }

    // issue query (returns promise)
    db.query(query)
        .then(results => {

            resultRows = results.rows;

            // everything ok -- return results
            let response = [];
            for (let val of resultRows) {
                response.push ({
                    "keypath": val.keypath,
                    "confidence": val.confidence
                });
            }
            res.status(200).json(response);

        })
        .catch(error => {
            // error accessing db
            if (error) {
                res.status(400).json({
                    "message": "error ocurred"
                });
                console.log(error.stack);
                return;
            }
        });

});

module.exports = router;

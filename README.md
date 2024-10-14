### Example Project File Tree Rule in [examples] folder

[Name]/
    -Section[SectionNumber]/
        -Subsection[SubsectionNumber]/
            -codes/
                -[SubsectioNnumber].ipynb
            -resources/
            [SubsectionNumber].html
    filetree.json


### Example Project filetree.json Rule

[
  {
    "section": [SectionNumber],
    "name": "[Name]",
    "subsections": [
      {
        "subsection": [SubsectionNumber],
        "name": "[Name]",
        "env": "type[Typenumber]",
        "location": "[location]" *ex = databases , learning/1/1/codes
        "target"; [targetName].ipynb *ex = 1.ipynb
      },
    ]
  },
]

* type0 = jupyternotebook
* type1 = classes
* type2 = datacoolection
* type3 = model

### Deep Learning Model Rule in [models] folder

[Name]/
  checkpoints/
    -[Name].ckg
  -optimized/
    -[Name].ckg
  -optimized.ipynb
  -test.ipynb
  -train.ipynb




### GET format (Client)

    const fetch = async () => {
      try {
        const response = await axios.get(`${config.ServerURL}/api/db/classes/get/${projectname}`);
        if (response.data.length > 0) {

        }
      } catch (error) {
        console.error('Error fetching datasets:', error);
      }
    };

### Get format (Server)

  router.get('/api/markdown/:name/:section/:subsection', (req, res) => {
    const { name,section,subsection } = req.params;
    
      res.json({ content: data });
      // res.send(data);
    });

### POST format (Client)

    const fetch = async () => {
      try {
        const response = await axios.post(`${config.ServerURL}/`, {
          userprojname: projectname
        });

      } catch (error) {
        console.error('Error fetching files', error);
      }
    };

### POST format (Server)

  router.post('/api/db/set/WorkingDirectory', async (req, res) => {
  const { projectname, location } = req.body;

  res.status(200).json({ message: 'Working Directory set successfully' });
});

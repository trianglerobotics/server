const express = require('express');
const path = require('path');
const session = require('express-session');
const app = express();
const port = process.env.PORT || 3000;

// Configure sessions
app.use(session({
  secret: 'yourSecretKey',
  resave: false,
  saveUninitialized: true,
  cookie: { maxAge: 6000000000 } // 세션 타임아웃 설정 (1분)
}));

let activeSession = null;

app.get('/logout', (req, res) => {
  console.log('session',activeSession)
  if (req.session.id) {
    activeSession = null; // Reset activeSession
    req.session.destroy(err => {
      if (err) {
        return res.status(500).send("로그아웃 중 오류가 발생했습니다.");
      }
      res.send("로그아웃되었습니다. 다른 사용자가 접속할 수 있습니다.");
      console.log("로그아웃되었습니다.");
    });
  } else {
    res.send("현재 활성 세션이 없습니다.");
    console.log("현재 활성 세션이 없습니다.");
  }
});

app.get('/check', (req, res) => {
  console.log('현재 세션:', req.session ? req.session.id : '세션 없음', '활성 세션:', activeSession);
  
  //res.send('connected');
  if (!activeSession || activeSession===null) {
    // No active session at the moment
    console.log('empty');
    return res.send("empty");
  }

  if (req.session && req.session.id === activeSession) {
    // Current user is the active session user
    console.log('connected');
    return res.send('connected');
  } else {
    // Another user is currently active
    console.log('occupied');
    return res.send('occupied')
  }
});


// Middleware to allow only one active session at a time
app.use((req, res, next) => {
  console.log('세션:', req.session.id);
  // if (activeSession && activeSession !== req.session.id) {
  //   return res.status(403).send("현재 다른 사용자가 접속 중입니다.");
  // }
  activeSession = req.session.id; // 현재 세션을 활성 세션으로 설정
  next();
});

// Serve the static files from the React app
app.use(express.static(path.join(__dirname, 'build')));

// Handle any requests that don't match the ones above
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'build', 'index.html'));
});

// Middleware to handle session expiration or disconnect
app.use((req, res, next) => {
  // 세션이 닫힐 때 activeSession을 비웁니다.
  req.on('close', () => {
    if (req.session && req.session.id === activeSession) {
      activeSession = null;
    }
    console.log('세션이 닫혔습니다.');
  });

  // 세션 만료를 확인하고, 만료된 경우 activeSession을 비웁니다.
  req.session.reload((err) => {
    if (err || !req.session) {
      if (req.session && req.session.id === activeSession) {
        activeSession = null;
      }
    }
    next();
  });
});

app.listen(port, () => {
  console.log(`서버가 ${port}번 포트에서 실행 중입니다.`);
});

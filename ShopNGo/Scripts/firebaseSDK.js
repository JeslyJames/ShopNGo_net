import { initializeApp } from "https://www.gstatic.com/firebasejs/10.12.5/firebase-app.js";
import { getAuth, GoogleAuthProvider, FacebookAuthProvider, signInWithPopup, OAuthProvider } from "https://www.gstatic.com/firebasejs/10.12.5/firebase-auth.js";

const firebaseConfig = {
    apiKey: "AIzaSyA2qjNpCC0_OpOlHnDzD-w4UIrjz0hNUF8",
    authDomain: "shopngodotnet.firebaseapp.com",
    projectId: "shopngodotnet",
    storageBucket: "shopngodotnet.appspot.com",
    messagingSenderId: "302349725138",
    appId: "1:302349725138:web:603333c830f1f9c497ac0b"
};

const app = initializeApp(firebaseConfig);
const auth = getAuth(app);
auth.languageCode = 'en';

// Initialize providers
const googleProvider = new GoogleAuthProvider();
const facebookProvider = new FacebookAuthProvider();
const appleProvider = new OAuthProvider('apple.com'); // Adjust if needed

// Google Login
const googleLogin = document.getElementById("googleLink");
googleLogin.addEventListener("click", function () {
    signInWithPopup(auth, googleProvider)
        .then((result) => {
            const credential = GoogleAuthProvider.credentialFromResult(result);
            setCookie('token', credential.accessToken, 7); // Cookie expires in 7 days
            window.location.href = "/Home";
        }).catch((error) => {
            console.log(error);
        });
});

// Facebook Login
const facebookLogin = document.getElementById("facebookLogin");
facebookLogin.addEventListener("click", function () {
    signInWithPopup(auth, facebookProvider)
        .then((result) => {
            const credential = FacebookAuthProvider.credentialFromResult(result);
            setCookie('token', credential.accessToken, 7); // Cookie expires in 7 days
            window.location.href = "/";
        }).catch((error) => {
            console.log(error);
        });
});

// Apple Login
const appleLogin = document.getElementById("appleLogin");
appleLogin.addEventListener("click", function () {
    signInWithPopup(auth, appleProvider)
        .then((result) => {
            const credential = OAuthProvider.credentialFromResult(result);
            setCookie('token', credential.accessToken, 7); // Cookie expires in 7 days
            window.location.href = "/";
        }).catch((error) => {
            console.log(error);
        });
});

// Function to set a cookie
function setCookie(name, value, days) {
    let expires = "";
    if (days) {
        const date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = "expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + encodeURIComponent(value) + ";" + expires + ";path=/";
}
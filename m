From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82118] nouveau tearing with xvideo
Date: Thu, 20 Nov 2014 20:40:32 +0000
Message-ID: <bug-82118-8800-TnxkEPilaU@http.bugs.freedesktop.org/>
References: <bug-82118-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0467916381=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82118-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0467916381==
Content-Type: multipart/alternative; boundary="1416516032.Eb4bB71.26420"; charset="UTF-8"


--1416516032.Eb4bB71.26420
Date: Thu, 20 Nov 2014 20:40:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82118

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I believe recent changes to the ddx and kernel have improved this. Please
update to xf86-video-nouveau 1.0.11 and kernel 3.17.x and retest. GLXVBlank
defaults to true now, I believe.

However it's at least a little odd that xvinfo is returning Adaptor #0:
"Intel(R) Textured Video" -- nouveau returns different strings. Perhaps you ran
xvinfo on the wrong screen?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416516032.Eb4bB71.26420
Date: Thu, 20 Nov 2014 20:40:32 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau tearing with xvideo"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82118#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau tearing with xvideo"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82118">bug 82118</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I believe recent changes to the ddx and kernel have improved this. Please
update to xf86-video-nouveau 1.0.11 and kernel 3.17.x and retest. GLXVBlank
defaults to true now, I believe.

However it's at least a little odd that xvinfo is returning Adaptor #0:
&quot;Intel(R) Textured Video&quot; -- nouveau returns different strings. Perhaps you ran
xvinfo on the wrong screen?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416516032.Eb4bB71.26420--

--===============0467916381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0467916381==--

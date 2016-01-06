From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93613] 3D acceleration/OpenGL corrupts output on
 GeForce FX-5200
Date: Wed, 06 Jan 2016 20:13:16 +0000
Message-ID: <bug-93613-8800-E9RR41xkvO@http.bugs.freedesktop.org/>
References: <bug-93613-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1740879767=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93613-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1740879767==
Content-Type: multipart/alternative; boundary="1452111196.8c5aA7771.9841"; charset="UTF-8"


--1452111196.8c5aA7771.9841
Date: Wed, 6 Jan 2016 20:13:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93613

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
You selected mesa 10.3 which was released quite a while ago. Does the issue
persist with Mesa 11.1?

Note that there's an issue that I haven't gotten around to addressing whereby
if you select a 16-bit color (rgb565) and 24-bit depth, or vice-versa
(rgba8/rgbx8 + 16-bit depth), then we basically fail at rendering. Hopefully
etracer isn't doing that.

If the issue persists with a recent mesa, please make a short apitrace of the
issue.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1452111196.8c5aA7771.9841
Date: Wed, 6 Jan 2016 20:13:16 +0000
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
   title="NEW - 3D acceleration/OpenGL corrupts output on GeForce FX-5200"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93613#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - 3D acceleration/OpenGL corrupts output on GeForce FX-5200"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93613">bug 93613</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>You selected mesa 10.3 which was released quite a while ago. Does the issue
persist with Mesa 11.1?

Note that there's an issue that I haven't gotten around to addressing whereby
if you select a 16-bit color (rgb565) and 24-bit depth, or vice-versa
(rgba8/rgbx8 + 16-bit depth), then we basically fail at rendering. Hopefully
etracer isn't doing that.

If the issue persists with a recent mesa, please make a short apitrace of the
issue.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1452111196.8c5aA7771.9841--

--===============1740879767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1740879767==--

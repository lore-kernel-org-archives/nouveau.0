From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91333] Connecting second of two monitors to a Lenovo
 W520 causes displays to go crazy
Date: Tue, 14 Jul 2015 17:03:55 +0000
Message-ID: <bug-91333-8800-TVQLcUj10o@http.bugs.freedesktop.org/>
References: <bug-91333-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0664237473=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91333-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0664237473==
Content-Type: multipart/alternative; boundary="1436893434.358a02.19057"; charset="UTF-8"


--1436893434.358a02.19057
Date: Tue, 14 Jul 2015 17:03:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91333

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
A few people who have had these PDISP errors were due to gnome toggling cursor
state when a CRTC had not been enabled, and nouveau not properly protecting
against it. There was a (lost) patch that fixed it, unfortunately I don't
remember where the place was. Ben should be able to come up with that patch
fairly easily.

However for the user in question, while the PDISP error dumps went away, the
underlying problems remained. Just a thought.

[As an aside, Corey, with reverse-prime you should also be able to get all 3
screens up... see http://nouveau.freedesktop.org/wiki/Optimus/ . Of course
nothing is perfect, this also introduces tons of problem for some people. But
not others.]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1436893434.358a02.19057
Date: Tue, 14 Jul 2015 17:03:54 +0000
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
   title="NEW - Connecting second of two monitors to a Lenovo W520 causes displays to go crazy"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91333#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Connecting second of two monitors to a Lenovo W520 causes displays to go crazy"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91333">bug 91333</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>A few people who have had these PDISP errors were due to gnome toggling cursor
state when a CRTC had not been enabled, and nouveau not properly protecting
against it. There was a (lost) patch that fixed it, unfortunately I don't
remember where the place was. Ben should be able to come up with that patch
fairly easily.

However for the user in question, while the PDISP error dumps went away, the
underlying problems remained. Just a thought.

[As an aside, Corey, with reverse-prime you should also be able to get all 3
screens up... see <a href="http://nouveau.freedesktop.org/wiki/Optimus/">http://nouveau.freedesktop.org/wiki/Optimus/</a> . Of course
nothing is perfect, this also introduces tons of problem for some people. But
not others.]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1436893434.358a02.19057--

--===============0664237473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0664237473==--

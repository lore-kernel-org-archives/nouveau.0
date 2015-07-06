From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91247] Tomb Raider: Underworld renders lots of
 artefacts on models and objects
Date: Mon, 06 Jul 2015 17:22:45 +0000
Message-ID: <bug-91247-8800-Z4lUk9vUus@http.bugs.freedesktop.org/>
References: <bug-91247-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0682142792=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91247-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0682142792==
Content-Type: multipart/alternative; boundary="1436203365.2B387e511.12855"; charset="UTF-8"


--1436203365.2B387e511.12855
Date: Mon, 6 Jul 2015 17:22:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91247

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Early analysis makes it seem like the issue is with face culling or depth
tests. The colors you see on the model are the background color on which the
model is drawn (Or not drawn, as the case might be.) Both depth test and
front-face culling are enabled.

The frag shaders being used to draw it are *crazy* long, they're all like

if (bool) { bunch o' code }
if (other bool) { bunch o' code }
if (third bool) { bunch o' code }

and so on. I guess they were written with the assumption that the programs
would be compiled with the bools known ahead of time and only have one or two
of the bunches o' code. Oh well. But they're generally simple... Could still be
an error in the frag shaders though, should try replacing them with just
writing a solid color. Hopefully qapitrace makes that possible.

This issue reproduces on both nvc0 and nv50.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1436203365.2B387e511.12855
Date: Mon, 6 Jul 2015 17:22:45 +0000
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
   title="NEW - Tomb Raider: Underworld renders lots of artefacts on models and objects"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91247#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Tomb Raider: Underworld renders lots of artefacts on models and objects"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91247">bug 91247</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Early analysis makes it seem like the issue is with face culling or depth
tests. The colors you see on the model are the background color on which the
model is drawn (Or not drawn, as the case might be.) Both depth test and
front-face culling are enabled.

The frag shaders being used to draw it are *crazy* long, they're all like

if (bool) { bunch o' code }
if (other bool) { bunch o' code }
if (third bool) { bunch o' code }

and so on. I guess they were written with the assumption that the programs
would be compiled with the bools known ahead of time and only have one or two
of the bunches o' code. Oh well. But they're generally simple... Could still be
an error in the frag shaders though, should try replacing them with just
writing a solid color. Hopefully qapitrace makes that possible.

This issue reproduces on both nvc0 and nv50.</pre>
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

--1436203365.2B387e511.12855--

--===============0682142792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0682142792==--

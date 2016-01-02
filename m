From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93563] Hack'n'Slash hangs with Nouveau driver
Date: Sat, 02 Jan 2016 23:47:10 +0000
Message-ID: <bug-93563-8800-bCBr3Rbk91@http.bugs.freedesktop.org/>
References: <bug-93563-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1562028610=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93563-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1562028610==
Content-Type: multipart/alternative; boundary="1451778430.66c0e1.29577"; charset="UTF-8"


--1451778430.66c0e1.29577
Date: Sat, 2 Jan 2016 23:47:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93563

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Yeah, I'm sure it works with blob drivers... they probably move some of the
resources to sysmem. Nouveau sadly doesn't support that right now. It just
hopes for the best, and when a submit fails, you end up with a ton of
additional errors due to things not being where they are supposed to be.

Making it more resilient to errors is on my list... better resource management
is too, but even further down =/

Your best bet for now is turning down some sort of quality knob so that the
game doesn't use as many resources. FWIW it does say it wants 512MB VRAM while
you only have 256...

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1451778430.66c0e1.29577
Date: Sat, 2 Jan 2016 23:47:10 +0000
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
   title="NEW - Hack'n'Slash hangs with Nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93563#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Hack'n'Slash hangs with Nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93563">bug 93563</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Yeah, I'm sure it works with blob drivers... they probably move some of the
resources to sysmem. Nouveau sadly doesn't support that right now. It just
hopes for the best, and when a submit fails, you end up with a ton of
additional errors due to things not being where they are supposed to be.

Making it more resilient to errors is on my list... better resource management
is too, but even further down =/

Your best bet for now is turning down some sort of quality knob so that the
game doesn't use as many resources. FWIW it does say it wants 512MB VRAM while
you only have 256...</pre>
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

--1451778430.66c0e1.29577--

--===============1562028610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1562028610==--

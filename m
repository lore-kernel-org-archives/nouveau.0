From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87942] [NVE7] Unable to use nouveau
Date: Thu, 01 Jan 2015 18:44:30 +0000
Message-ID: <bug-87942-8800-XY3DyTxceF@http.bugs.freedesktop.org/>
References: <bug-87942-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1233203352=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87942-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1233203352==
Content-Type: multipart/alternative; boundary="1420137870.a8Ba62.3508"; charset="UTF-8"


--1420137870.a8Ba62.3508
Date: Thu, 1 Jan 2015 18:44:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87942

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
[151022.040] (EE) NOUVEAU(0): Failed to initialise context object: 2D_NVC0 (0)
[151022.040] (EE) NOUVEAU(0): Error initialising acceleration.  Falling back to
NoAccel

Two observations --

(a) nouveau isn't being added as a GPU but rather as a "primary" video card. I
had assumed you had one of the new-fangled optimus situations where the screens
are attached to the igpu and 3d offloading can be done to the secondary gpu --
is that not the case? Using an xorg.conf with Device entries tends to mess all
of that up, btw.

(b) That error should have caused some nasties to be printed to dmesg. I think
I know what they are, but I still want to see them.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1420137870.a8Ba62.3508
Date: Thu, 1 Jan 2015 18:44:30 +0000
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
   title="NEW - [NVE7] Unable to use nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87942#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] Unable to use nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87942">bug 87942</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>[151022.040] (EE) NOUVEAU(0): Failed to initialise context object: 2D_NVC0 (0)
[151022.040] (EE) NOUVEAU(0): Error initialising acceleration.  Falling back to
NoAccel

Two observations --

(a) nouveau isn't being added as a GPU but rather as a &quot;primary&quot; video card. I
had assumed you had one of the new-fangled optimus situations where the screens
are attached to the igpu and 3d offloading can be done to the secondary gpu --
is that not the case? Using an xorg.conf with Device entries tends to mess all
of that up, btw.

(b) That error should have caused some nasties to be printed to dmesg. I think
I know what they are, but I still want to see them.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420137870.a8Ba62.3508--

--===============1233203352==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1233203352==--

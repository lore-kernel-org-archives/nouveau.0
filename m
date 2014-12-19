From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87469] [NV34] Invisible cursor on Xorg
Date: Fri, 19 Dec 2014 02:57:15 +0000
Message-ID: <bug-87469-8800-ok62dlgPVZ@http.bugs.freedesktop.org/>
References: <bug-87469-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1597426626=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87469-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1597426626==
Content-Type: multipart/alternative; boundary="1418957835.2A1846832.14269"; charset="UTF-8"


--1418957835.2A1846832.14269
Date: Fri, 19 Dec 2014 02:57:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87469

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Fernando Rodriguez from comment #6)
> Created attachment 111027 [details]
> Xorg log 3.17.2

As I suspected:

[    20.659] (EE) NOUVEAU(0): Error creating GPU channel: -13
[    20.659] (EE) NOUVEAU(0): Error initialising acceleration.  Falling back to
NoAccel

And in dmesg:

[   20.658982] nouveau E[  DEVICE][0000:01:00.0][0x80000080][ffff880076072c00]
failed to create 0x00000002, -13

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418957835.2A1846832.14269
Date: Fri, 19 Dec 2014 02:57:15 +0000
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
   title="NEW - [NV34] Invisible cursor on Xorg"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87469#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV34] Invisible cursor on Xorg"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87469">bug 87469</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Fernando Rodriguez from <a href="show_bug.cgi?id=87469#c6">comment #6</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=111027" name="attach_111027" title="Xorg log 3.17.2">attachment 111027</a> <a href="attachment.cgi?id=111027&amp;action=edit" title="Xorg log 3.17.2">[details]</a></span>
&gt; Xorg log 3.17.2</span >

As I suspected:

[    20.659] (EE) NOUVEAU(0): Error creating GPU channel: -13
[    20.659] (EE) NOUVEAU(0): Error initialising acceleration.  Falling back to
NoAccel

And in dmesg:

[   20.658982] nouveau E[  DEVICE][0000:01:00.0][0x80000080][ffff880076072c00]
failed to create 0x00000002, -13</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418957835.2A1846832.14269--

--===============1597426626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1597426626==--

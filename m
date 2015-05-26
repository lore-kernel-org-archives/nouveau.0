From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21273] [NV17] PowerMac3,
 6 Driver can't detect video output and xserver doesn't start
Date: Tue, 26 May 2015 16:47:26 +0000
Message-ID: <bug-21273-8800-UxrjiDmAZR@http.bugs.freedesktop.org/>
References: <bug-21273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0398930159=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21273-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0398930159==
Content-Type: multipart/alternative; boundary="1432658846.AefE1.9492"; charset="UTF-8"


--1432658846.AefE1.9492
Date: Tue, 26 May 2015 16:47:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=21273

--- Comment #105 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Tim Riker from comment #104)
> What became of this? I installed Ubuntu 14.04 on a Powermac G4 Quicksilver
> 2002 edition and got a blank screen. I look at the output and it thinks it's
> using VGA when I suspect it should be using TMDS

Nothing AFAIK. I ran out of ideas to try. You can look through some of my
suggested patches and try some of them out, perhaps you'll get better results.
As I recall, Andrey had some success using xf86-video-nv and/or nvidiafb.

If you have the necessary skills, it shouldn't be *too* difficult to add a
*ton* of prints in dispnv04/* and nvidiafb and compare where they start making
different decisions about stuff.

Note that dispnv04/* should map pretty closely to xf86-video-nv -- that driver
was originally imported as nouveau into the kernel and then modified...
dispnv04 is the bits of it that were modified the least. [The details of the
history are a bit off there, but close enough... xf86-video-nv was first forked
as xf86-video-nouveau and *then* imported into the kernel...]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432658846.AefE1.9492
Date: Tue, 26 May 2015 16:47:26 +0000
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
   title="NEW - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273#c105">Comment # 105</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273">bug 21273</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Tim Riker from <a href="show_bug.cgi?id=21273#c104">comment #104</a>)
<span class="quote">&gt; What became of this? I installed Ubuntu 14.04 on a Powermac G4 Quicksilver
&gt; 2002 edition and got a blank screen. I look at the output and it thinks it's
&gt; using VGA when I suspect it should be using TMDS</span >

Nothing AFAIK. I ran out of ideas to try. You can look through some of my
suggested patches and try some of them out, perhaps you'll get better results.
As I recall, Andrey had some success using xf86-video-nv and/or nvidiafb.

If you have the necessary skills, it shouldn't be *too* difficult to add a
*ton* of prints in dispnv04/* and nvidiafb and compare where they start making
different decisions about stuff.

Note that dispnv04/* should map pretty closely to xf86-video-nv -- that driver
was originally imported as nouveau into the kernel and then modified...
dispnv04 is the bits of it that were modified the least. [The details of the
history are a bit off there, but close enough... xf86-video-nv was first forked
as xf86-video-nouveau and *then* imported into the kernel...]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432658846.AefE1.9492--

--===============0398930159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0398930159==--

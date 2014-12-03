From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86935] [NV106] unknown kepler chipset 0x106
Date: Wed, 03 Dec 2014 11:27:11 +0000
Message-ID: <bug-86935-8800-tJz8E7FNoB@http.bugs.freedesktop.org/>
References: <bug-86935-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1853311669=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86935-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1853311669==
Content-Type: multipart/alternative; boundary="1417606031.cDcAc41.21206"; charset="UTF-8"


--1417606031.cDcAc41.21206
Date: Wed, 3 Dec 2014 11:27:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86935

--- Comment #8 from Sven <sven.koehler-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #4)
> (In reply to Sven from comment #2)
> > Adding 0x106 seems to have worked. I can now boot with nouveau framebuffer
> > and nouveau Xorg driver also works.
> 
> Awesome. Please confirm that you're using the nouveau 3d driver (you'll need
> at least mesa 10.2). Try running some semi-stressing 3d thing too? Not sure
> if you use gnome-shell or something. [glxgears isn't really enough, although
> it's a start.]

I'm using mesa 10.3.4 and glxinfo confirms that I'm using "Gallium 0.4 on
NV106" and not software rendering or nvidia binary driver. I can confirm that
glxgears, quake3-demo, and 0ad alpha 17 run fine. Everything looks like it
should.

Sorry, no gnome-shell here. I'm using the MATE Desktop Environment (good old
fast 2D stuff).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1417606031.cDcAc41.21206
Date: Wed, 3 Dec 2014 11:27:11 +0000
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
   title="NEW - [NV106] unknown kepler chipset 0x106"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86935#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV106] unknown kepler chipset 0x106"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86935">bug 86935</a>
              from <span class="vcard"><a class="email" href="mailto:sven.koehler&#64;gmail.com" title="Sven &lt;sven.koehler&#64;gmail.com&gt;"> <span class="fn">Sven</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=86935#c4">comment #4</a>)
<span class="quote">&gt; (In reply to Sven from <a href="show_bug.cgi?id=86935#c2">comment #2</a>)
&gt; &gt; Adding 0x106 seems to have worked. I can now boot with nouveau framebuffer
&gt; &gt; and nouveau Xorg driver also works.
&gt; 
&gt; Awesome. Please confirm that you're using the nouveau 3d driver (you'll need
&gt; at least mesa 10.2). Try running some semi-stressing 3d thing too? Not sure
&gt; if you use gnome-shell or something. [glxgears isn't really enough, although
&gt; it's a start.]</span >

I'm using mesa 10.3.4 and glxinfo confirms that I'm using &quot;Gallium 0.4 on
NV106&quot; and not software rendering or nvidia binary driver. I can confirm that
glxgears, quake3-demo, and 0ad alpha 17 run fine. Everything looks like it
should.

Sorry, no gnome-shell here. I'm using the MATE Desktop Environment (good old
fast 2D stuff).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1417606031.cDcAc41.21206--

--===============1853311669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1853311669==--

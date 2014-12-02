From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86935] [NV106] unknown kepler chipset 0x106
Date: Tue, 02 Dec 2014 16:15:07 +0000
Message-ID: <bug-86935-8800-Px0bWXx3ON@http.bugs.freedesktop.org/>
References: <bug-86935-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0973259658=="
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


--===============0973259658==
Content-Type: multipart/alternative; boundary="1417536907.fDFD71.27385"; charset="UTF-8"


--1417536907.fDFD71.27385
Date: Tue, 2 Dec 2014 16:15:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86935

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Sven from comment #2)
> Created attachment 110361 [details] [review]
> the patch proposed in the previous comment
> 
> Adding 0x106 seems to have worked. I can now boot with nouveau framebuffer
> and nouveau Xorg driver also works.

Awesome. Please confirm that you're using the nouveau 3d driver (you'll need at
least mesa 10.2). Try running some semi-stressing 3d thing too? Not sure if you
use gnome-shell or something. [glxgears isn't really enough, although it's a
start.]

Also, I think it'd still be nice if you could provide a mmiotrace of the blob,
the chip could have different golden init values, and other small differences.

As for the patch, change it so that the 0x106 case gets a full copy of the
0x108 stuff, and call it GK208B in the name string, and send it as a proper
patch (with git format-patch) to nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org .

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1417536907.fDFD71.27385
Date: Tue, 2 Dec 2014 16:15:07 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86935#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV106] unknown kepler chipset 0x106"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86935">bug 86935</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Sven from <a href="show_bug.cgi?id=86935#c2">comment #2</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=110361" name="attach_110361" title="the patch proposed in the previous comment">attachment 110361</a> <a href="attachment.cgi?id=110361&amp;action=edit" title="the patch proposed in the previous comment">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=86935&amp;attachment=110361'>[review]</a> [review]
&gt; the patch proposed in the previous comment
&gt; 
&gt; Adding 0x106 seems to have worked. I can now boot with nouveau framebuffer
&gt; and nouveau Xorg driver also works.</span >

Awesome. Please confirm that you're using the nouveau 3d driver (you'll need at
least mesa 10.2). Try running some semi-stressing 3d thing too? Not sure if you
use gnome-shell or something. [glxgears isn't really enough, although it's a
start.]

Also, I think it'd still be nice if you could provide a mmiotrace of the blob,
the chip could have different golden init values, and other small differences.

As for the patch, change it so that the 0x106 case gets a full copy of the
0x108 stuff, and call it GK208B in the name string, and send it as a proper
patch (with git format-patch) to <a href="mailto:nouveau&#64;lists.freedesktop.org">nouveau&#64;lists.freedesktop.org</a> .</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1417536907.fDFD71.27385--

--===============0973259658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0973259658==--

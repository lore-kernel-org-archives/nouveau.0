From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93405] nouveau: Xorg crashes sooner or later in
	3840x2160 mode
Date: Sat, 23 Jan 2016 16:47:53 +0000
Message-ID: <bug-93405-8800-0sxKUekNyW@http.bugs.freedesktop.org/>
References: <bug-93405-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0925593247=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93405-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0925593247==
Content-Type: multipart/alternative; boundary="14535676731.EFA0697B.8439";
 charset="UTF-8"


--14535676731.EFA0697B.8439
Date: Sat, 23 Jan 2016 16:47:53 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93405

--- Comment #15 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I can't quite tell what you're trying to do, but here are a few pieces of
information that you may find useful:

HDMI cables can only carry a single TMDS link. (Not enough pins for more.)
DVI cables can carry one or two TMDS links, each maxing at 165mhz (for a total
of 330mhz for dual-link DVI).

The maximum TMDS link speed nouveau will allow on HDMI connectors is 165MHz.

With kernel 4.5 (or anything that includes
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=1a0c96c075bb4517d4ce4fb6750ee0a3cf38714c
and a few of the surrounding commits), you will be able to override this by
setting nouveau.hdmimhz=anything-you-want. We have no idea where to get the
limits from, so we just set it to

165mhz for tesla and earlier
225mhz for fermi
297mhz for kepler+

We'll have to figure something out for HDMI 2.0 eventually. But again, this is
all with the above commits; with kernel 4.4 it's just 165mhz for HDMI.

Assuming your connector and cables support it, dual-link DVI will give you the
highest maximum frequency.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14535676731.EFA0697B.8439
Date: Sat, 23 Jan 2016 16:47:53 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau: Xorg crashes sooner or later in 3840x2160 mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93405#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau: Xorg crashes sooner or later in 3840x2160 mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93405">bug 93405</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I can't quite tell what you're trying to do, but here are a few pieces of
information that you may find useful:

HDMI cables can only carry a single TMDS link. (Not enough pins for more.)
DVI cables can carry one or two TMDS links, each maxing at 165mhz (for a total
of 330mhz for dual-link DVI).

The maximum TMDS link speed nouveau will allow on HDMI connectors is 165MHz.

With kernel 4.5 (or anything that includes
<a href="https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=1a0c96c075bb4517d4ce4fb6750ee0a3cf38714c">https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=1a0c96c075bb4517d4ce4fb6750ee0a3cf38714c</a>
and a few of the surrounding commits), you will be able to override this by
setting nouveau.hdmimhz=anything-you-want. We have no idea where to get the
limits from, so we just set it to

165mhz for tesla and earlier
225mhz for fermi
297mhz for kepler+

We'll have to figure something out for HDMI 2.0 eventually. But again, this is
all with the above commits; with kernel 4.4 it's just 165mhz for HDMI.

Assuming your connector and cables support it, dual-link DVI will give you the
highest maximum frequency.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14535676731.EFA0697B.8439--

--===============0925593247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0925593247==--

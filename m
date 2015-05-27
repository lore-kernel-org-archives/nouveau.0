From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90682] [NVE6] failed to idle channel 0xcccc0001 +
	crash
Date: Wed, 27 May 2015 16:06:10 +0000
Message-ID: <bug-90682-8800-nkmF5neMH8@http.bugs.freedesktop.org/>
References: <bug-90682-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0022812749=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90682-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0022812749==
Content-Type: multipart/alternative; boundary="1432742770.1416c2.3199"; charset="UTF-8"


--1432742770.1416c2.3199
Date: Wed, 27 May 2015 16:06:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90682

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
All of those screens are attached to intel. I can't think of a reason why you
would have lost your DP screens.

However it seems like your eDP panel is actively attached to *both* the intel
*and* the nvidia adapters. Yeah, *that*'ll work great. Ugh. There also appears
to be a DVI-D output, which may or may not be real.

I wonder if that's the cause of the trouble. It seems like intel is allocating
its outputs second, so the first eDP screen goes to nouveau. But presumably
nouveau is card1 while intel is card0.

Double-check with

grep . /sys/class/drm/card*-*/status

I bet that there's a eDP-1 and eDP-2, and that eDP-2 is on the card that all
the other useful ones are on. In that case, try booting with

video=eDP-1:d

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432742770.1416c2.3199
Date: Wed, 27 May 2015 16:06:10 +0000
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
   title="NEW - [NVE6] failed to idle channel 0xcccc0001 + crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90682#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] failed to idle channel 0xcccc0001 + crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90682">bug 90682</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>All of those screens are attached to intel. I can't think of a reason why you
would have lost your DP screens.

However it seems like your eDP panel is actively attached to *both* the intel
*and* the nvidia adapters. Yeah, *that*'ll work great. Ugh. There also appears
to be a DVI-D output, which may or may not be real.

I wonder if that's the cause of the trouble. It seems like intel is allocating
its outputs second, so the first eDP screen goes to nouveau. But presumably
nouveau is card1 while intel is card0.

Double-check with

grep . /sys/class/drm/card*-*/status

I bet that there's a eDP-1 and eDP-2, and that eDP-2 is on the card that all
the other useful ones are on. In that case, try booting with

video=eDP-1:d</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432742770.1416c2.3199--

--===============0022812749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0022812749==--

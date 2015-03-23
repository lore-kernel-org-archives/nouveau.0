From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89730] NV50: LightDM GTK+ Greeter Background -
 inconsistent display
Date: Mon, 23 Mar 2015 17:21:29 +0000
Message-ID: <bug-89730-8800-6aPUSiJz2q@http.bugs.freedesktop.org/>
References: <bug-89730-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1566929577=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89730-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1566929577==
Content-Type: multipart/alternative; boundary="1427131288.D6acCcfB1.27920"; charset="UTF-8"


--1427131288.D6acCcfB1.27920
Date: Mon, 23 Mar 2015 17:21:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89730

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to poma from comment #4)
> dunno whether it is proper position, but comparing with the
> NV50_3D(ZETA_ENABLE) in src/nvc0_accel.c
> your patch fit like this:

Yes, this is what I had in mind. On my local branch I've replaced a bunch of
the 0xbla values with names :) Thanks for testing, it was a long shot though.

> Nevertheless it still has no effect.
> 
> With regard to your question - GL, I tried the following:
> options nouveau noaccel=1
> 
> and it has a positive effect - Greeter Background is displayed correctly.
> 
> After all this, if I understand it correctly:
> 1. Family : NV30 / Chipset: NV34 (NV34) / GeForce FX 5200 
>    because it has no problemos in this case - per se is not accelerated?

Nope, it's accelerated. Just all the acceleration logic is different, it's very
different hardware.

> 2. the same applies if the modesetting is used - not accelerated?

Right. Or perhaps it's using glamor to implement EXA? Depends on the
modesetting version.

> 3. also there is no problemos if nouveau noaccel=1 is used - not accelerated?

Right, not accelerated. You can be more targeted and set Option "AccelMethod"
"none" in your xorg.conf which will only disable 2d accel via the ddx. Or you
can try setting it to "glamor" and see if the problem goes away.

> 
> Perhaps this is flaw within the greeter application then?

Perhaps. Would be nice to know wtf the application is doing in the first place,
then we may be able to work out where the issue might lie. At this point I
don't know if it's using X or GL for drawing this stuff to the screen, which
are very different paths.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427131288.D6acCcfB1.27920
Date: Mon, 23 Mar 2015 17:21:28 +0000
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
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730">bug 89730</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to poma from <a href="show_bug.cgi?id=89730#c4">comment #4</a>)
<span class="quote">&gt; dunno whether it is proper position, but comparing with the
&gt; NV50_3D(ZETA_ENABLE) in src/nvc0_accel.c
&gt; your patch fit like this:</span >

Yes, this is what I had in mind. On my local branch I've replaced a bunch of
the 0xbla values with names :) Thanks for testing, it was a long shot though.

<span class="quote">&gt; Nevertheless it still has no effect.
&gt; 
&gt; With regard to your question - GL, I tried the following:
&gt; options nouveau noaccel=1
&gt; 
&gt; and it has a positive effect - Greeter Background is displayed correctly.
&gt; 
&gt; After all this, if I understand it correctly:
&gt; 1. Family : NV30 / Chipset: NV34 (NV34) / GeForce FX 5200 
&gt;    because it has no problemos in this case - per se is not accelerated?</span >

Nope, it's accelerated. Just all the acceleration logic is different, it's very
different hardware.

<span class="quote">&gt; 2. the same applies if the modesetting is used - not accelerated?</span >

Right. Or perhaps it's using glamor to implement EXA? Depends on the
modesetting version.

<span class="quote">&gt; 3. also there is no problemos if nouveau noaccel=1 is used - not accelerated?</span >

Right, not accelerated. You can be more targeted and set Option &quot;AccelMethod&quot;
&quot;none&quot; in your xorg.conf which will only disable 2d accel via the ddx. Or you
can try setting it to &quot;glamor&quot; and see if the problem goes away.

<span class="quote">&gt; 
&gt; Perhaps this is flaw within the greeter application then?</span >

Perhaps. Would be nice to know wtf the application is doing in the first place,
then we may be able to work out where the issue might lie. At this point I
don't know if it's using X or GL for drawing this stuff to the screen, which
are very different paths.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427131288.D6acCcfB1.27920--

--===============1566929577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1566929577==--

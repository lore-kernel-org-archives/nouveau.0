From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70895] BUG: soft lockup - CPU#0 stuck for 22s!
 [Xorg:1292] after disable descrete card with switcheroo
Date: Thu, 20 Nov 2014 23:41:03 +0000
Message-ID: <bug-70895-8800-Gf1dC9vxoe@http.bugs.freedesktop.org/>
References: <bug-70895-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1582407677=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70895-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1582407677==
Content-Type: multipart/alternative; boundary="1416526862.fe1bb2.24013"; charset="UTF-8"


--1416526862.fe1bb2.24013
Date: Thu, 20 Nov 2014 23:41:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70895

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Marcin Zajaczkowski from comment #2)
> Hello again. I upgraded my system to Fedora 21 and with
> 3.17.3-300.fc21.x86_64 I cannot reproduce mentioned issue (with "CPU#0 stuck
> for 22s").
> 
> Unfortunately I have problem with switching a discrete card. By default:
> # echo OFF > /sys/kernel/debug/vgaswitcheroo/switch
> does nothing - a discrete card is still in DynPwr state:

That's expected. What's unexpected is that something is keeping a reference to
your GPU which isn't letting it power off. Similar to bug #70875.

> Booting with nouveau.runpm=0 I have both cards on:
> $ $ sudo cat /sys/kernel/debug/vgaswitcheroo/switch
> 0:IGD:+:Pwr:0000:00:02.0
> 1:DIS: :Pwr:0000:01:00.0
> 
> and after
> # echo OFF > /sys/kernel/debug/vgaswitcheroo/switch
> 
> I have:
> 0:IGD:+:Pwr:0000:00:02.0
> 1:DIS: :Off:0000:01:00.0
> 
> Looks ok, but I still see 3 providers:
> $ xrandr --listproviders
> Providers: number : 3
> Provider 0: id: 0x90 cap: 0xb, Source Output, Sink Output, Sink Offload
> crtcs: 3 outputs: 5 associated providers: 2 name:Intel
> Provider 1: id: 0x63 cap: 0x7, Source Output, Sink Output, Source Offload
> crtcs: 2 outputs: 2 associated providers: 2 name:nouveau
> Provider 2: id: 0x63 cap: 0x7, Source Output, Sink Output, Source Offload
> crtcs: 2 outputs: 2 associated providers: 2 name:nouveau
> 
> and system temperature could suggest that the card is still on. I see no
> messages from VGA switcheroo in the system log (as there were in 3.11.6).

That is odd... not sure what that situation is.

> Should I close that issue and report another issue?

Yes, don't confuse multiple issues into one, it gets unwieldy.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416526862.fe1bb2.24013
Date: Thu, 20 Nov 2014 23:41:02 +0000
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
   title="NEW - BUG: soft lockup - CPU#0 stuck for 22s! [Xorg:1292] after disable descrete card with switcheroo"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70895#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - BUG: soft lockup - CPU#0 stuck for 22s! [Xorg:1292] after disable descrete card with switcheroo"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70895">bug 70895</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Marcin Zajaczkowski from <a href="show_bug.cgi?id=70895#c2">comment #2</a>)
<span class="quote">&gt; Hello again. I upgraded my system to Fedora 21 and with
&gt; 3.17.3-300.fc21.x86_64 I cannot reproduce mentioned issue (with &quot;CPU#0 stuck
&gt; for 22s&quot;).
&gt; 
&gt; Unfortunately I have problem with switching a discrete card. By default:
&gt; # echo OFF &gt; /sys/kernel/debug/vgaswitcheroo/switch
&gt; does nothing - a discrete card is still in DynPwr state:</span >

That's expected. What's unexpected is that something is keeping a reference to
your GPU which isn't letting it power off. Similar to <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC1] runtime pm not auto-suspending card"
   href="show_bug.cgi?id=70875">bug #70875</a>.

<span class="quote">&gt; Booting with nouveau.runpm=0 I have both cards on:
&gt; $ $ sudo cat /sys/kernel/debug/vgaswitcheroo/switch
&gt; 0:IGD:+:Pwr:0000:00:02.0
&gt; 1:DIS: :Pwr:0000:01:00.0
&gt; 
&gt; and after
&gt; # echo OFF &gt; /sys/kernel/debug/vgaswitcheroo/switch
&gt; 
&gt; I have:
&gt; 0:IGD:+:Pwr:0000:00:02.0
&gt; 1:DIS: :Off:0000:01:00.0
&gt; 
&gt; Looks ok, but I still see 3 providers:
&gt; $ xrandr --listproviders
&gt; Providers: number : 3
&gt; Provider 0: id: 0x90 cap: 0xb, Source Output, Sink Output, Sink Offload
&gt; crtcs: 3 outputs: 5 associated providers: 2 name:Intel
&gt; Provider 1: id: 0x63 cap: 0x7, Source Output, Sink Output, Source Offload
&gt; crtcs: 2 outputs: 2 associated providers: 2 name:nouveau
&gt; Provider 2: id: 0x63 cap: 0x7, Source Output, Sink Output, Source Offload
&gt; crtcs: 2 outputs: 2 associated providers: 2 name:nouveau
&gt; 
&gt; and system temperature could suggest that the card is still on. I see no
&gt; messages from VGA switcheroo in the system log (as there were in 3.11.6).</span >

That is odd... not sure what that situation is.

<span class="quote">&gt; Should I close that issue and report another issue?</span >

Yes, don't confuse multiple issues into one, it gets unwieldy.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416526862.fe1bb2.24013--

--===============1582407677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1582407677==--

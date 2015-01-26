From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84721] [NVC1] Nvidia Geforce GT 630 using nouveau on
 3.16 kernel. dangerous Fan speed
Date: Mon, 26 Jan 2015 00:19:31 +0000
Message-ID: <bug-84721-8800-v8FR8Ne4nT@http.bugs.freedesktop.org/>
References: <bug-84721-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0463429982=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-84721-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0463429982==
Content-Type: multipart/alternative; boundary="1422231571.AeB64fF2.17600"; charset="UTF-8"


--1422231571.AeB64fF2.17600
Date: Mon, 26 Jan 2015 00:19:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84721

--- Comment #11 from r004 <roo4.id-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Krzysztof Katowicz-Kowalewski from comment #10)
> As far as I've checked, the problem appeared in 3.15 kernel. I've tried
> hardened-sources-3.14.29 and there's no problem with the fan, at least in
> auto mode. But since you change the mode to manual (echo 1 > pwm1_enable),
> the fan gets mad as in 3.15 kernel branch. Related info from me:
> https://forums.gentoo.org/viewtopic-t-1009318.html

I didn't do anything to the kernel and I did change nothing in settings.
the tests I have done are all in the live usb env and all from the 3.16 and
above kernels.
 voild-linux-x86_64-01-2015-enlightenment.iso
 fatdog-x86_64-7.00b1.iso
 latest lileblue.iso
 ... and so on
IT MAY BE statred at 3.15 but all of live cd/usb (s) that I used were 3.16 or
above I assumed it started by then.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422231571.AeB64fF2.17600
Date: Mon, 26 Jan 2015 00:19:31 +0000
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
   title="NEW - [NVC1] Nvidia Geforce GT 630 using nouveau on 3.16 kernel. dangerous Fan speed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84721#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC1] Nvidia Geforce GT 630 using nouveau on 3.16 kernel. dangerous Fan speed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84721">bug 84721</a>
              from <span class="vcard"><a class="email" href="mailto:roo4.id&#64;gmail.com" title="r004 &lt;roo4.id&#64;gmail.com&gt;"> <span class="fn">r004</span></a>
</span></b>
        <pre>(In reply to Krzysztof Katowicz-Kowalewski from <a href="show_bug.cgi?id=84721#c10">comment #10</a>)
<span class="quote">&gt; As far as I've checked, the problem appeared in 3.15 kernel. I've tried
&gt; hardened-sources-3.14.29 and there's no problem with the fan, at least in
&gt; auto mode. But since you change the mode to manual (echo 1 &gt; pwm1_enable),
&gt; the fan gets mad as in 3.15 kernel branch. Related info from me:
&gt; <a href="https://forums.gentoo.org/viewtopic-t-1009318.html">https://forums.gentoo.org/viewtopic-t-1009318.html</a></span >

I didn't do anything to the kernel and I did change nothing in settings.
the tests I have done are all in the live usb env and all from the 3.16 and
above kernels.
 voild-linux-x86_64-01-2015-enlightenment.iso
 fatdog-x86_64-7.00b1.iso
 latest lileblue.iso
 ... and so on
IT MAY BE statred at 3.15 but all of live cd/usb (s) that I used were 3.16 or
above I assumed it started by then.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422231571.AeB64fF2.17600--

--===============0463429982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0463429982==--

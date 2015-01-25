From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84721] [NVC1] Nvidia Geforce GT 630 using nouveau on
 3.16 kernel. dangerous Fan speed
Date: Sun, 25 Jan 2015 23:04:25 +0000
Message-ID: <bug-84721-8800-bljlc9V0KA@http.bugs.freedesktop.org/>
References: <bug-84721-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0512880002=="
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


--===============0512880002==
Content-Type: multipart/alternative; boundary="1422227065.FC7a53.28025"; charset="UTF-8"


--1422227065.FC7a53.28025
Date: Sun, 25 Jan 2015 23:04:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84721

--- Comment #10 from Krzysztof Katowicz-Kowalewski <vnd-da06O8EuSQE@public.gmane.org> ---
As far as I've checked, the problem appeared in 3.15 kernel. I've tried
hardened-sources-3.14.29 and there's no problem with the fan, at least in auto
mode. But since you change the mode to manual (echo 1 > pwm1_enable), the fan
gets mad as in 3.15 kernel branch. Related info from me:
https://forums.gentoo.org/viewtopic-t-1009318.html

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422227065.FC7a53.28025
Date: Sun, 25 Jan 2015 23:04:25 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84721#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC1] Nvidia Geforce GT 630 using nouveau on 3.16 kernel. dangerous Fan speed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84721">bug 84721</a>
              from <span class="vcard"><a class="email" href="mailto:vnd&#64;vndh.net" title="Krzysztof Katowicz-Kowalewski &lt;vnd&#64;vndh.net&gt;"> <span class="fn">Krzysztof Katowicz-Kowalewski</span></a>
</span></b>
        <pre>As far as I've checked, the problem appeared in 3.15 kernel. I've tried
hardened-sources-3.14.29 and there's no problem with the fan, at least in auto
mode. But since you change the mode to manual (echo 1 &gt; pwm1_enable), the fan
gets mad as in 3.15 kernel branch. Related info from me:
<a href="https://forums.gentoo.org/viewtopic-t-1009318.html">https://forums.gentoo.org/viewtopic-t-1009318.html</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422227065.FC7a53.28025--

--===============0512880002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0512880002==--

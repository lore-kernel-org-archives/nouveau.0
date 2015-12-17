From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59069] nouveau E[     DRM] fail ttm_validate
Date: Thu, 17 Dec 2015 05:57:18 +0000
Message-ID: <bug-59069-8800-aYte7V27FI@http.bugs.freedesktop.org/>
References: <bug-59069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0760184334=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0760184334==
Content-Type: multipart/alternative; boundary="1450331838.2E65dDd3.549"; charset="UTF-8"


--1450331838.2E65dDd3.549
Date: Thu, 17 Dec 2015 05:57:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59069

--- Comment #34 from peter swain <swine-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org> ---
(In reply to peter swain from comment #33)
> my issue was resolved by update yesterday,
by xserver-xorg-video-nouveau                                           
1:1.0.12+git1512080732.b18bc0~gd~w
from
deb http://ppa.launchpad.net/oibaf/graphics-drivers/ubuntu wily main


Peeking into logs, it looks like this commit was responsible,
as the issue looks similar ...
author    Mario Kleiner <mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>    2015-06-28 00:33:49
(GMT)
committer    Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>    2015-11-17 05:55:42 (GMT)
commit    6e6d8ac1c7b4ee047a7b40b95dea1e65a7c3211a
  "Take shift in crtc positions for ZaphodHeads configs into account"

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1450331838.2E65dDd3.549
Date: Thu, 17 Dec 2015 05:57:18 +0000
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
          bz_status_REOPENED "
   title="REOPENED - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069#c34">Comment # 34</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069">bug 59069</a>
              from <span class="vcard"><a class="email" href="mailto:swine&#64;pobox.com" title="peter swain &lt;swine&#64;pobox.com&gt;"> <span class="fn">peter swain</span></a>
</span></b>
        <pre>(In reply to peter swain from <a href="show_bug.cgi?id=59069#c33">comment #33</a>)
<span class="quote">&gt; my issue was resolved by update yesterday,</span >
by xserver-xorg-video-nouveau                                           
1:1.0.12+git1512080732.b18bc0~gd~w
from
deb <a href="http://ppa.launchpad.net/oibaf/graphics-drivers/ubuntu">http://ppa.launchpad.net/oibaf/graphics-drivers/ubuntu</a> wily main


Peeking into logs, it looks like this commit was responsible,
as the issue looks similar ...
author    Mario Kleiner &lt;<a href="mailto:mario.kleiner.de&#64;gmail.com">mario.kleiner.de&#64;gmail.com</a>&gt;    2015-06-28 00:33:49
(GMT)
committer    Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;    2015-11-17 05:55:42 (GMT)
commit    6e6d8ac1c7b4ee047a7b40b95dea1e65a7c3211a
  &quot;Take shift in crtc positions for ZaphodHeads configs into account&quot;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1450331838.2E65dDd3.549--

--===============0760184334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0760184334==--

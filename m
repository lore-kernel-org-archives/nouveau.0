From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86935] [NV106] unknown kepler chipset 0x106
Date: Thu, 18 Dec 2014 23:45:40 +0000
Message-ID: <bug-86935-8800-VHZSjPfIOG@http.bugs.freedesktop.org/>
References: <bug-86935-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1492809787=="
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


--===============1492809787==
Content-Type: multipart/alternative; boundary="1418946339.Dda41.24746"; charset="UTF-8"


--1418946339.Dda41.24746
Date: Thu, 18 Dec 2014 23:45:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86935

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Sven from comment #11)
> nouveau 0000:01:00.0: Direct firmware load for nouveau/nv106_fuc084 failed
> with error -2
> nouveau 0000:01:00.0: Direct firmware load for nouveau/nv106_fuc084d failed
> with error -2
> nouveau E[    PBSP][0000:01:00.0] unable to load firmware data
> nouveau E[    PBSP][0000:01:00.0] init failed, -2
> 
> Does extract_firmware.py need updating?
> (I have Gentoo's nvidia-firmware-340.32 installed)

Just add symlinks, same as for nv108, to the bsp/vp/ppp files. I'll update
extract_firmware.py shortly.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418946339.Dda41.24746
Date: Thu, 18 Dec 2014 23:45:39 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86935#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV106] unknown kepler chipset 0x106"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86935">bug 86935</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Sven from <a href="show_bug.cgi?id=86935#c11">comment #11</a>)
<span class="quote">&gt; nouveau 0000:01:00.0: Direct firmware load for nouveau/nv106_fuc084 failed
&gt; with error -2
&gt; nouveau 0000:01:00.0: Direct firmware load for nouveau/nv106_fuc084d failed
&gt; with error -2
&gt; nouveau E[    PBSP][0000:01:00.0] unable to load firmware data
&gt; nouveau E[    PBSP][0000:01:00.0] init failed, -2
&gt; 
&gt; Does extract_firmware.py need updating?
&gt; (I have Gentoo's nvidia-firmware-340.32 installed)</span >

Just add symlinks, same as for nv108, to the bsp/vp/ppp files. I'll update
extract_firmware.py shortly.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418946339.Dda41.24746--

--===============1492809787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1492809787==--

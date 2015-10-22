From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91236] [NVC3] Passive DP to HDMI adapter cannot use
 pixel clocks greater than 165 MHz
Date: Thu, 22 Oct 2015 03:54:37 +0000
Message-ID: <bug-91236-8800-s8xyezIjS1@http.bugs.freedesktop.org/>
References: <bug-91236-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2058597039=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91236-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2058597039==
Content-Type: multipart/alternative; boundary="1445486077.fba88FEC2.18519"; charset="UTF-8"


--1445486077.fba88FEC2.18519
Date: Thu, 22 Oct 2015 03:54:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91236

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Look for the series starting with

[PATCH 0/2] drm/nouveau: add support for 2560x1440@56 over HDMI

sent to nouveau and dri-devel on Aug 8. It limits things to 225mhz though. We
did some poking around with various VBIOS's, I think I found the place where
the max freq is stored, but would be curious to see yours (can be grabbed from
/sys/kernel/debug/dri/0/vbios.rom).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1445486077.fba88FEC2.18519
Date: Thu, 22 Oct 2015 03:54:37 +0000
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
   title="NEW - [NVC3] Passive DP to HDMI adapter cannot use pixel clocks greater than 165 MHz"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91236#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC3] Passive DP to HDMI adapter cannot use pixel clocks greater than 165 MHz"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91236">bug 91236</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Look for the series starting with

[PATCH 0/2] drm/nouveau: add support for 2560x1440&#64;56 over HDMI

sent to nouveau and dri-devel on Aug 8. It limits things to 225mhz though. We
did some poking around with various VBIOS's, I think I found the place where
the max freq is stored, but would be curious to see yours (can be grabbed from
/sys/kernel/debug/dri/0/vbios.rom).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445486077.fba88FEC2.18519--

--===============2058597039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2058597039==--

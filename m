From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91705] [NVE7] GPU crash (read fault) on boot w/
 DMI+HDMI outputs
Date: Thu, 20 Aug 2015 18:53:14 +0000
Message-ID: <bug-91705-8800-vAUsgQ6tHL@http.bugs.freedesktop.org/>
References: <bug-91705-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2143021168=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91705-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2143021168==
Content-Type: multipart/alternative; boundary="1440096794.dDeFe2.10282"; charset="UTF-8"


--1440096794.dDeFe2.10282
Date: Thu, 20 Aug 2015 18:53:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91705

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
errrr what?

[   12.163791] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x61d804 [ IBUS ]
[   26.237760] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x61a804 [ IBUS ]

That'd be PDISPLAY.SOR[0x3].PWR and PDISPLAY.DAC[0x1].DPMS_CTRL for those
following at home.

No idea what we're (not) doing to make those mmio reads fail. As they're
connected to "power", perhaps they're getting turned off for our convenience?
Not sure.

Perhaps it just doesn't have a SOR[3]/DAC[1]? Can you include your VBIOS,
perhaps there's something interesting in there? From a successful boot, grab
/sys/kernel/debug/dri/0/vbios.rom and upload it here.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1440096794.dDeFe2.10282
Date: Thu, 20 Aug 2015 18:53:14 +0000
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
   title="NEW - [NVE7] GPU crash (read fault) on boot w/ DMI+HDMI outputs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91705#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] GPU crash (read fault) on boot w/ DMI+HDMI outputs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91705">bug 91705</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>errrr what?

[   12.163791] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x61d804 [ IBUS ]
[   26.237760] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x61a804 [ IBUS ]

That'd be PDISPLAY.SOR[0x3].PWR and PDISPLAY.DAC[0x1].DPMS_CTRL for those
following at home.

No idea what we're (not) doing to make those mmio reads fail. As they're
connected to &quot;power&quot;, perhaps they're getting turned off for our convenience?
Not sure.

Perhaps it just doesn't have a SOR[3]/DAC[1]? Can you include your VBIOS,
perhaps there's something interesting in there? From a successful boot, grab
/sys/kernel/debug/dri/0/vbios.rom and upload it here.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1440096794.dDeFe2.10282--

--===============2143021168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2143021168==--

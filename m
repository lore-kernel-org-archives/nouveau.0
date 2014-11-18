From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77674] [NVE7] "failed to read DPCD" on wake up with
 external monitor
Date: Tue, 18 Nov 2014 07:36:03 +0000
Message-ID: <bug-77674-8800-T0YRmUCDcn@http.bugs.freedesktop.org/>
References: <bug-77674-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1710522557=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77674-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1710522557==
Content-Type: multipart/alternative; boundary="1416296163.24e0deAA2.22560"; charset="UTF-8"


--1416296163.24e0deAA2.22560
Date: Tue, 18 Nov 2014 07:36:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77674

--- Comment #8 from Dominique Dumont <domi.dumont-GANU6spQydw@public.gmane.org> ---
Hello

I have a similar problem with my laptop:
01:00.0 VGA compatible controller: NVIDIA Corporation GF106GLM [Quadro 2000M]
(rev a1)
kernel: SMP Debian 3.16.7-2 (2014-11-06) x86_64 GNU/Linux

The options nouveau.debug=VBIOS=trace,PDISP=trace,I2C=trace drm.debug=0xe does
make the setup more robust, but I has a crash this morning while expanding the
screen display to an external monitor connected to a dock station.

For what it's worth, I've attached a kern.log generated with the above trace
from the wake up of the machine up to the crash.


Hope this helps

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416296163.24e0deAA2.22560
Date: Tue, 18 Nov 2014 07:36:03 +0000
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
   title="NEW - [NVE7] &quot;failed to read DPCD&quot; on wake up with external monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77674#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] &quot;failed to read DPCD&quot; on wake up with external monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77674">bug 77674</a>
              from <span class="vcard"><a class="email" href="mailto:domi.dumont&#64;free.fr" title="Dominique Dumont &lt;domi.dumont&#64;free.fr&gt;"> <span class="fn">Dominique Dumont</span></a>
</span></b>
        <pre>Hello

I have a similar problem with my laptop:
01:00.0 VGA compatible controller: NVIDIA Corporation GF106GLM [Quadro 2000M]
(rev a1)
kernel: SMP Debian 3.16.7-2 (2014-11-06) x86_64 GNU/Linux

The options nouveau.debug=VBIOS=trace,PDISP=trace,I2C=trace drm.debug=0xe does
make the setup more robust, but I has a crash this morning while expanding the
screen display to an external monitor connected to a dock station.

For what it's worth, I've attached a kern.log generated with the above trace
from the wake up of the machine up to the crash.


Hope this helps</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416296163.24e0deAA2.22560--

--===============1710522557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1710522557==--

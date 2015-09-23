From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92077] nouveau graphics freeze when using KDE Plasma
 5; PGR engine fault
Date: Wed, 23 Sep 2015 04:37:55 +0000
Message-ID: <bug-92077-8800-K5djIYCNl0@http.bugs.freedesktop.org/>
References: <bug-92077-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1177521939=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92077-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1177521939==
Content-Type: multipart/alternative; boundary="1442983075.f0eF0.19227"; charset="UTF-8"


--1442983075.f0eF0.19227
Date: Wed, 23 Sep 2015 04:37:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92077

--- Comment #4 from zoominee <gentoo-5cK0ikVjkE4@public.gmane.org> ---
I generated a new apitrace without too much private content. It was about 155
MB, so I zipped it down to 77 MB. Because I couldn't attach that to this
report, I uploaded it to a free service, here's the link. Maybe it works.
http://www.uploadmb.com/dw.php?id=1442982871

The apitrace was generated with the versions mentioned in the bug's
Description.

I noticed that there is a newer mesa, so I will test (later) whether the
apitrace still results in the graphics freeze.

The dmesg output related to this graphics freeze captured in the new trace is
the following:

Sep 22 23:49:39 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] read fault
at 0x000310e000 [PTE] from GR/GPC0/T1_1 on channel 0x003facd000
[plasmashell[2933]]                                                             
Sep 22 23:49:39 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] PGR engine
fault on channel 5, recovering...
Sep 22 23:49:39 localhost kernel: nouveau E[     PGR][0000:02:00.0] TRAP ch 5
[0x003facd000 plasmashell[2933]]
Sep 22 23:49:39 localhost kernel: nouveau E[     PGR][0000:02:00.0]
GPC0/TPC0/TEX: 0x80000049
Sep 22 23:49:39 localhost kernel: nouveau E[     PGR][0000:02:00.0]
GPC0/TPC1/TEX: 0x80000049

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1442983075.f0eF0.19227
Date: Wed, 23 Sep 2015 04:37:55 +0000
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
   title="NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engine fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92077#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engine fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92077">bug 92077</a>
              from <span class="vcard"><a class="email" href="mailto:gentoo&#64;moin.fi" title="zoominee &lt;gentoo&#64;moin.fi&gt;"> <span class="fn">zoominee</span></a>
</span></b>
        <pre>I generated a new apitrace without too much private content. It was about 155
MB, so I zipped it down to 77 MB. Because I couldn't attach that to this
report, I uploaded it to a free service, here's the link. Maybe it works.
<a href="http://www.uploadmb.com/dw.php?id=1442982871">http://www.uploadmb.com/dw.php?id=1442982871</a>

The apitrace was generated with the versions mentioned in the bug's
Description.

I noticed that there is a newer mesa, so I will test (later) whether the
apitrace still results in the graphics freeze.

The dmesg output related to this graphics freeze captured in the new trace is
the following:

Sep 22 23:49:39 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] read fault
at 0x000310e000 [PTE] from GR/GPC0/T1_1 on channel 0x003facd000
[plasmashell[2933]]                                                             
Sep 22 23:49:39 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] PGR engine
fault on channel 5, recovering...
Sep 22 23:49:39 localhost kernel: nouveau E[     PGR][0000:02:00.0] TRAP ch 5
[0x003facd000 plasmashell[2933]]
Sep 22 23:49:39 localhost kernel: nouveau E[     PGR][0000:02:00.0]
GPC0/TPC0/TEX: 0x80000049
Sep 22 23:49:39 localhost kernel: nouveau E[     PGR][0000:02:00.0]
GPC0/TPC1/TEX: 0x80000049</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1442983075.f0eF0.19227--

--===============1177521939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1177521939==--

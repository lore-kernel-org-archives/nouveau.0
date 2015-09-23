From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91722] [NVE4] PGRAPH - grctx template channel unload
 timeout, failed to construct context, init failed, -16
Date: Wed, 23 Sep 2015 15:20:48 +0000
Message-ID: <bug-91722-8800-TXtsDTE9N6@http.bugs.freedesktop.org/>
References: <bug-91722-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0777722045=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91722-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0777722045==
Content-Type: multipart/alternative; boundary="1443021648.65D57af0.27969"; charset="UTF-8"


--1443021648.65D57af0.27969
Date: Wed, 23 Sep 2015 15:20:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91722

--- Comment #11 from Adam Williamson <adamw-cfjF3rc+CpsYNetmKr+vY16hYfS7NtTn@public.gmane.org> ---
We have a downstream reporter with what looks like much the same issue:

https://bugzilla.redhat.com/show_bug.cgi?id=1264872

Sep 23 20:06:31 w50.localdomain kernel: nouveau E[  PGRAPH][0000:01:00.0] wait
for idle timeout (en: 1, ctxsw: 0, busy: 1)
Sep 23 20:06:33 w50.localdomain kernel: nouveau E[  PGRAPH][0000:01:00.0] wait
for idle timeout (en: 1, ctxsw: 0, busy: 1)
Sep 23 20:06:35 w50.localdomain kernel: nouveau E[  PGRAPH][0000:01:00.0] wait
for idle timeout (en: 1, ctxsw: 0, busy: 1)
Sep 23 20:06:37 w50.localdomain kernel: nouveau E[  PGRAPH][0000:01:00.0] wait
for idle timeout (en: 1, ctxsw: 0, busy: 1)
Sep 23 20:06:39 w50.localdomain kernel: nouveau E[  PGRAPH][0000:01:00.0] grctx
template channel unload timeout
Sep 23 20:06:39 w50.localdomain kernel: nouveau E[  PGRAPH][0000:01:00.0]
failed to construct context
Sep 23 20:06:39 w50.localdomain kernel: nouveau E[  PGRAPH][0000:01:00.0] init
failed, -16
Sep 23 20:06:39 w50.localdomain gnome-session[1428]: nvc0_screen_create:716 -
Error allocating PGRAPH context for M2MF: -16

Adapter there is:

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK106GLM [Quadro
K2100M] [10de:11fc] (rev a1)

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1443021648.65D57af0.27969
Date: Wed, 23 Sep 2015 15:20:48 +0000
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
   title="NEW - [NVE4] PGRAPH - grctx template channel unload timeout, failed to construct context, init failed, -16"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91722#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] PGRAPH - grctx template channel unload timeout, failed to construct context, init failed, -16"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91722">bug 91722</a>
              from <span class="vcard"><a class="email" href="mailto:adamw&#64;happyassassin.net" title="Adam Williamson &lt;adamw&#64;happyassassin.net&gt;"> <span class="fn">Adam Williamson</span></a>
</span></b>
        <pre>We have a downstream reporter with what looks like much the same issue:

<a href="https://bugzilla.redhat.com/show_bug.cgi?id=1264872">https://bugzilla.redhat.com/show_bug.cgi?id=1264872</a>

Sep 23 20:06:31 w50.localdomain kernel: nouveau E[  PGRAPH][0000:01:00.0] wait
for idle timeout (en: 1, ctxsw: 0, busy: 1)
Sep 23 20:06:33 w50.localdomain kernel: nouveau E[  PGRAPH][0000:01:00.0] wait
for idle timeout (en: 1, ctxsw: 0, busy: 1)
Sep 23 20:06:35 w50.localdomain kernel: nouveau E[  PGRAPH][0000:01:00.0] wait
for idle timeout (en: 1, ctxsw: 0, busy: 1)
Sep 23 20:06:37 w50.localdomain kernel: nouveau E[  PGRAPH][0000:01:00.0] wait
for idle timeout (en: 1, ctxsw: 0, busy: 1)
Sep 23 20:06:39 w50.localdomain kernel: nouveau E[  PGRAPH][0000:01:00.0] grctx
template channel unload timeout
Sep 23 20:06:39 w50.localdomain kernel: nouveau E[  PGRAPH][0000:01:00.0]
failed to construct context
Sep 23 20:06:39 w50.localdomain kernel: nouveau E[  PGRAPH][0000:01:00.0] init
failed, -16
Sep 23 20:06:39 w50.localdomain gnome-session[1428]: nvc0_screen_create:716 -
Error allocating PGRAPH context for M2MF: -16

Adapter there is:

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK106GLM [Quadro
K2100M] [10de:11fc] (rev a1)</pre>
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

--1443021648.65D57af0.27969--

--===============0777722045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0777722045==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86491] [NVE6] Nouveau crash when shutting down
Date: Thu, 20 Nov 2014 15:37:47 +0000
Message-ID: <bug-86491-8800-N3Vmnottz6@http.bugs.freedesktop.org/>
References: <bug-86491-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0293137012=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86491-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0293137012==
Content-Type: multipart/alternative; boundary="1416497867.0fC5e73.6954"; charset="UTF-8"


--1416497867.0fC5e73.6954
Date: Thu, 20 Nov 2014 15:37:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86491

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
[   10.538216] nouveau E[  PGRAPH][0000:01:00.0] grctx template channel unload
timeout
[   10.538271] nouveau E[  PGRAPH][0000:01:00.0] failed to construct context
[   10.538273] nouveau E[  PGRAPH][0000:01:00.0] init failed, -16

This doesn't fill me with confidence...

[   33.767942] nouveau E[     DRM] failed to idle channel 0xcccc0000 [DRM]
[   36.435207] pci_pm_runtime_suspend(): nouveau_pmops_runtime_suspend+0x0/0xe0
[nouveau] returns -16

and that's not much better. What happens if you boot with

nouveau.runpm=0

Note that this will cause the secondary (nvidia) gpu to no longer auto-suspend
when not in use. Oh, btw, are you using something like bumblebee? (You
shouldn't be.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416497867.0fC5e73.6954
Date: Thu, 20 Nov 2014 15:37:47 +0000
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
   title="NEW - [NVE6] Nouveau crash when shutting down"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86491#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] Nouveau crash when shutting down"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86491">bug 86491</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>[   10.538216] nouveau E[  PGRAPH][0000:01:00.0] grctx template channel unload
timeout
[   10.538271] nouveau E[  PGRAPH][0000:01:00.0] failed to construct context
[   10.538273] nouveau E[  PGRAPH][0000:01:00.0] init failed, -16

This doesn't fill me with confidence...

[   33.767942] nouveau E[     DRM] failed to idle channel 0xcccc0000 [DRM]
[   36.435207] pci_pm_runtime_suspend(): nouveau_pmops_runtime_suspend+0x0/0xe0
[nouveau] returns -16

and that's not much better. What happens if you boot with

nouveau.runpm=0

Note that this will cause the secondary (nvidia) gpu to no longer auto-suspend
when not in use. Oh, btw, are you using something like bumblebee? (You
shouldn't be.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416497867.0fC5e73.6954--

--===============0293137012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0293137012==--

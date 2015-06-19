From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91025] nouveau fails to run with NV5 [Riva TNT2 /
	TNT2 Pro]
Date: Fri, 19 Jun 2015 16:45:04 +0000
Message-ID: <bug-91025-8800-vMm6N0fq3V@http.bugs.freedesktop.org/>
References: <bug-91025-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1991215013=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91025-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1991215013==
Content-Type: multipart/alternative; boundary="1434732304.5567c42.18314"; charset="UTF-8"


--1434732304.5567c42.18314
Date: Fri, 19 Jun 2015 16:45:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91025

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 116600
  --> https://bugs.freedesktop.org/attachment.cgi?id=116600&action=edit
"fixed" vbios

OK, so I've manually touched up the vbios. I had to do one slightly dodgy
thing, but... it should probably be fine. In any case, the vbios is only
executed on resume (or if it's a secondary GPU), so even if I messed it up,
should be mostly fine.

In order to use it, put it in /lib/firmware (and make sure it's accessible when
nouveau loads, so if it's a module loaded from initrd, it must be in the
initrd), and then boot with

nouveau.config=NvBios=vbios-bug-91025-fixed.rom

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1434732304.5567c42.18314
Date: Fri, 19 Jun 2015 16:45:04 +0000
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
   title="NEW - nouveau fails to run with NV5 [Riva TNT2 / TNT2 Pro]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91025#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau fails to run with NV5 [Riva TNT2 / TNT2 Pro]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91025">bug 91025</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=116600" name="attach_116600" title="&quot;fixed&quot; vbios">attachment 116600</a> <a href="attachment.cgi?id=116600&amp;action=edit" title="&quot;fixed&quot; vbios">[details]</a></span>
&quot;fixed&quot; vbios

OK, so I've manually touched up the vbios. I had to do one slightly dodgy
thing, but... it should probably be fine. In any case, the vbios is only
executed on resume (or if it's a secondary GPU), so even if I messed it up,
should be mostly fine.

In order to use it, put it in /lib/firmware (and make sure it's accessible when
nouveau loads, so if it's a module loaded from initrd, it must be in the
initrd), and then boot with

nouveau.config=NvBios=vbios-bug-91025-fixed.rom</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1434732304.5567c42.18314--

--===============1991215013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1991215013==--

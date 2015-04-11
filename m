From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89985] system video hangs on video switch to
	fullscreen
Date: Sat, 11 Apr 2015 23:46:06 +0000
Message-ID: <bug-89985-8800-luvWeCqOPV@http.bugs.freedesktop.org/>
References: <bug-89985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1582558909=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89985-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1582558909==
Content-Type: multipart/alternative; boundary="1428795966.4F6FE00.4097"; charset="UTF-8"


--1428795966.4F6FE00.4097
Date: Sat, 11 Apr 2015 23:46:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89985

--- Comment #2 from Mario Barrera <mbarrera-KK0ffGbhmjU@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #1)
> You shouldn't need to use blob context switching firmware... I'd start by
> removing
> 
> nouveau.config=NvGrUseFW=1
> 
> Also, if this is recent, and you're using libdrm-2.4.60, try downgrading to
> libdrm-2.4.59.

Effectively this is recent, I downgraded to libdrm-2.4.59 and removed the
kernel parameter. I still could reproduce the issue with a secondary screen and
with the primary only, It tried that because I though it could be because of
the secondary display.

relevant output of dmesg when reproducing with two displays:

[  195.394185] compiz[1209]: segfault at 7f23ad5c7580 ip 00007f23ad5c7580 sp
00007ffec56131a8 error 14 in card0[7f23ad7cd000+200000]
[  518.479158] gstglcontext[2295]: segfault at 8 ip 00007f5d39a4272e sp
00007f5b9bffe950 error 4 in libdrm_nouveau.so.2.0.0[7f5d39a3f000+6000]
[  586.592466] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: PBENTRY
[  586.592475] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 10
[gstglcontext[3129]] subc 0 mthd 0x0000 data 0x00000000

relevant output of dmesg when reproducing with a single display:

[  376.359606] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x01b3f00000
[UNSUPPORTED_KIND] from CE2/GR_COPY on channel 0x00bf449000 [unknown]

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1428795966.4F6FE00.4097
Date: Sat, 11 Apr 2015 23:46:06 +0000
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
   title="NEW - system video hangs on video switch to fullscreen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89985#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - system video hangs on video switch to fullscreen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89985">bug 89985</a>
              from <span class="vcard"><a class="email" href="mailto:mbarrera&#64;gmx.com" title="Mario Barrera &lt;mbarrera&#64;gmx.com&gt;"> <span class="fn">Mario Barrera</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=89985#c1">comment #1</a>)
<span class="quote">&gt; You shouldn't need to use blob context switching firmware... I'd start by
&gt; removing
&gt; 
&gt; nouveau.config=NvGrUseFW=1
&gt; 
&gt; Also, if this is recent, and you're using libdrm-2.4.60, try downgrading to
&gt; libdrm-2.4.59.</span >

Effectively this is recent, I downgraded to libdrm-2.4.59 and removed the
kernel parameter. I still could reproduce the issue with a secondary screen and
with the primary only, It tried that because I though it could be because of
the secondary display.

relevant output of dmesg when reproducing with two displays:

[  195.394185] compiz[1209]: segfault at 7f23ad5c7580 ip 00007f23ad5c7580 sp
00007ffec56131a8 error 14 in card0[7f23ad7cd000+200000]
[  518.479158] gstglcontext[2295]: segfault at 8 ip 00007f5d39a4272e sp
00007f5b9bffe950 error 4 in libdrm_nouveau.so.2.0.0[7f5d39a3f000+6000]
[  586.592466] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: PBENTRY
[  586.592475] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 10
[gstglcontext[3129]] subc 0 mthd 0x0000 data 0x00000000

relevant output of dmesg when reproducing with a single display:

[  376.359606] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x01b3f00000
[UNSUPPORTED_KIND] from CE2/GR_COPY on channel 0x00bf449000 [unknown]</pre>
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

--1428795966.4F6FE00.4097--

--===============1582558909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1582558909==--

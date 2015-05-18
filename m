From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90092] Screen Hangs Displaying Black and White
 Rectangles After Resuming from Suspend
Date: Mon, 18 May 2015 21:34:19 +0000
Message-ID: <bug-90092-8800-LhPhDQymEi@http.bugs.freedesktop.org/>
References: <bug-90092-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0744893670=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90092-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0744893670==
Content-Type: multipart/alternative; boundary="1431984858.41BCC0682.24254"; charset="UTF-8"


--1431984858.41BCC0682.24254
Date: Mon, 18 May 2015 21:34:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90092

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
[ 1013.446964] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT
at 0x103d94

That indicates that PCRYPT is somehow not coming up on resume. And we use it
for faster copies on those GPUs, so it makes sense you'd be getting funny
rectangles. You can disable it with

nouveau.config=PCRYPT=0

which should cause it to use M2MF instead. It's *highly* surprising that you'd
be getting that sort of issue though... no clue why that would happen. A few
boards are missing PCRYPT, but in that case, it *never* works (including
logging similar mmio faults on boot). Perhaps something messed up in the VBIOS
init tables?

BTW, in newer kernels, this will become PCIPHER instead of PCRYPT (for the
nouveau.config line above).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431984858.41BCC0682.24254
Date: Mon, 18 May 2015 21:34:18 +0000
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
   title="NEW - Screen Hangs Displaying Black and White Rectangles After Resuming from Suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90092#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Screen Hangs Displaying Black and White Rectangles After Resuming from Suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90092">bug 90092</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>[ 1013.446964] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT
at 0x103d94

That indicates that PCRYPT is somehow not coming up on resume. And we use it
for faster copies on those GPUs, so it makes sense you'd be getting funny
rectangles. You can disable it with

nouveau.config=PCRYPT=0

which should cause it to use M2MF instead. It's *highly* surprising that you'd
be getting that sort of issue though... no clue why that would happen. A few
boards are missing PCRYPT, but in that case, it *never* works (including
logging similar mmio faults on boot). Perhaps something messed up in the VBIOS
init tables?

BTW, in newer kernels, this will become PCIPHER instead of PCRYPT (for the
nouveau.config line above).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431984858.41BCC0682.24254--

--===============0744893670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0744893670==--

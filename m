From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90626] HP ZBook 15 nouveau driver hangup for kernel
	>= 4.1
Date: Sat, 12 Dec 2015 00:45:58 +0000
Message-ID: <bug-90626-8800-mnxe3WRVxd@http.bugs.freedesktop.org/>
References: <bug-90626-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0806169889=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90626-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0806169889==
Content-Type: multipart/alternative; boundary="1449881158.3dcdEB23.386"; charset="UTF-8"


--1449881158.3dcdEB23.386
Date: Sat, 12 Dec 2015 00:45:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90626

--- Comment #45 from vdanjean-GANU6spQydw@public.gmane.org <vdanjean.ml-GANU6spQydw@public.gmane.org> ---
The last patch help. I tried it when I upgraded my kernel and I checked it
works.

Without it, nouveau was failing at loading time

With it, I can use my NVidia card together with the Intel one.

Note that I tried the new kernel from Debian (package 4.3-1~exp2), it was less
stable that 4.3-1~exp1. So I removed it, reinstall and repatch the 4.3-1~exp1
Debian kernel.
So, I can also certify that the new patch also works for the previous kernel
where I applied the previous patch

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1449881158.3dcdEB23.386
Date: Sat, 12 Dec 2015 00:45:58 +0000
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
   title="NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;= 4.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90626#c45">Comment # 45</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;= 4.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90626">bug 90626</a>
              from <span class="vcard"><a class="email" href="mailto:vdanjean.ml&#64;free.fr" title="vdanjean&#64;free.fr &lt;vdanjean.ml&#64;free.fr&gt;"> <span class="fn">vdanjean&#64;free.fr</span></a>
</span></b>
        <pre>The last patch help. I tried it when I upgraded my kernel and I checked it
works.

Without it, nouveau was failing at loading time

With it, I can use my NVidia card together with the Intel one.

Note that I tried the new kernel from Debian (package 4.3-1~exp2), it was less
stable that 4.3-1~exp1. So I removed it, reinstall and repatch the 4.3-1~exp1
Debian kernel.
So, I can also certify that the new patch also works for the previous kernel
where I applied the previous patch</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1449881158.3dcdEB23.386--

--===============0806169889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0806169889==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92438] Segfault in pushbuf_kref when running the
 android emulator (qemu) on nv50
Date: Fri, 04 Dec 2015 14:41:55 +0000
Message-ID: <bug-92438-8800-sLUiLtreOJ@http.bugs.freedesktop.org/>
References: <bug-92438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1870042891=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92438-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1870042891==
Content-Type: multipart/alternative; boundary="1449240115.365bB1.5848"; charset="UTF-8"


--1449240115.365bB1.5848
Date: Fri, 4 Dec 2015 14:41:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92438

--- Comment #36 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Gabriele Svelto from comment #35)
> I've updated mesa again and running from the current master I encounter the
> segfault again. This time though this is the only message that pops up in
> the kernel log:
> 
> [ 4684.326211] emulator-x86[19034]: segfault at 4 ip 00000000f5f49403 sp
> 00000000ac6fc660 error 4 in libdrm_nouveau.so.2.0.0[f5f46000+7000]
> 
> I'm wondering if running a master mesa with a non-master libdrm is supported
> at all.

If it build again given libdrm{,-nouveau} version it should work. Bugs on the
other hand are something that occasionally exist.

Which version (sha) is the above libdrm-nouveau ? Can you disassemble at the
given offset ?

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1449240115.365bB1.5848
Date: Fri, 4 Dec 2015 14:41:55 +0000
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
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438#c36">Comment # 36</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438">bug 92438</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to Gabriele Svelto from <a href="show_bug.cgi?id=92438#c35">comment #35</a>)
<span class="quote">&gt; I've updated mesa again and running from the current master I encounter the
&gt; segfault again. This time though this is the only message that pops up in
&gt; the kernel log:
&gt; 
&gt; [ 4684.326211] emulator-x86[19034]: segfault at 4 ip 00000000f5f49403 sp
&gt; 00000000ac6fc660 error 4 in libdrm_nouveau.so.2.0.0[f5f46000+7000]
&gt; 
&gt; I'm wondering if running a master mesa with a non-master libdrm is supported
&gt; at all.</span >

If it build again given libdrm{,-nouveau} version it should work. Bugs on the
other hand are something that occasionally exist.

Which version (sha) is the above libdrm-nouveau ? Can you disassemble at the
given offset ?</pre>
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

--1449240115.365bB1.5848--

--===============1870042891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1870042891==--

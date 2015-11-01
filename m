From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92438] Segfault in pushbuf_kref when running the
 android emulator (qemu) on nv50
Date: Sun, 01 Nov 2015 16:52:31 +0000
Message-ID: <bug-92438-8800-ZFlPKBwhRL@http.bugs.freedesktop.org/>
References: <bug-92438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1618984314=="
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


--===============1618984314==
Content-Type: multipart/alternative; boundary="1446396751.1e6b8b1.19617"; charset="UTF-8"


--1446396751.1e6b8b1.19617
Date: Sun, 1 Nov 2015 16:52:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92438

--- Comment #29 from Jim Blandy <jimb-bqtBzms/kfRWk0Htik3J/w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #27)
> Created attachment 119323 [details]
> deal with bind == 0
> 
> Oh blast, you're right. Can't disable GL_ARB_direct_state_access, since it's
> o(dummy_true). Try this mesa patch, which should fix it (but might break
> things on nv30... need to figure that out).

Okay, cool. Building Mesa from source isn't something I can dive into right
now, but I'm hoping I'll have more time for this project in the near future. (I
tried just whacking the domain value into *buffer with GDB and seeing if the
code could proceed, but optimized code foiled me.)

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1446396751.1e6b8b1.19617
Date: Sun, 1 Nov 2015 16:52:31 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438#c29">Comment # 29</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438">bug 92438</a>
              from <span class="vcard"><a class="email" href="mailto:jimb&#64;red-bean.com" title="Jim Blandy &lt;jimb&#64;red-bean.com&gt;"> <span class="fn">Jim Blandy</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=92438#c27">comment #27</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=119323" name="attach_119323" title="deal with bind == 0">attachment 119323</a> <a href="attachment.cgi?id=119323&amp;action=edit" title="deal with bind == 0">[details]</a></span>
&gt; deal with bind == 0
&gt; 
&gt; Oh blast, you're right. Can't disable GL_ARB_direct_state_access, since it's
&gt; o(dummy_true). Try this mesa patch, which should fix it (but might break
&gt; things on nv30... need to figure that out).</span >

Okay, cool. Building Mesa from source isn't something I can dive into right
now, but I'm hoping I'll have more time for this project in the near future. (I
tried just whacking the domain value into *buffer with GDB and seeing if the
code could proceed, but optimized code foiled me.)</pre>
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

--1446396751.1e6b8b1.19617--

--===============1618984314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1618984314==--

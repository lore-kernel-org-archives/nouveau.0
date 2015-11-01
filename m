From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92438] Segfault in pushbuf_kref when running the
 android emulator (qemu) on nv50
Date: Sun, 01 Nov 2015 07:38:47 +0000
Message-ID: <bug-92438-8800-AWKH66oQY1@http.bugs.freedesktop.org/>
References: <bug-92438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1366711294=="
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


--===============1366711294==
Content-Type: multipart/alternative; boundary="1446363527.BeB0ba1.6606"; charset="UTF-8"


--1446363527.BeB0ba1.6606
Date: Sun, 1 Nov 2015 07:38:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92438

--- Comment #28 from Jim Blandy <jimb-bqtBzms/kfRWk0Htik3J/w@public.gmane.org> ---
(In reply to Jim Blandy from comment #26)
> Thanks for looking into this! I still get segfaults. The entry in
> extension_table for GL_ARB_direct_state_access is:
> 
>    { "GL_ARB_draw_buffers", o(dummy_true), GL, 2002 },

Err, I meant, it's the line above that:

   { "GL_ARB_direct_state_access", o(dummy_true), GLC, 2014 },

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1446363527.BeB0ba1.6606
Date: Sun, 1 Nov 2015 07:38:47 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438#c28">Comment # 28</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438">bug 92438</a>
              from <span class="vcard"><a class="email" href="mailto:jimb&#64;red-bean.com" title="Jim Blandy &lt;jimb&#64;red-bean.com&gt;"> <span class="fn">Jim Blandy</span></a>
</span></b>
        <pre>(In reply to Jim Blandy from <a href="show_bug.cgi?id=92438#c26">comment #26</a>)
<span class="quote">&gt; Thanks for looking into this! I still get segfaults. The entry in
&gt; extension_table for GL_ARB_direct_state_access is:
&gt; 
&gt;    { &quot;GL_ARB_draw_buffers&quot;, o(dummy_true), GL, 2002 },</span >

Err, I meant, it's the line above that:

   { &quot;GL_ARB_direct_state_access&quot;, o(dummy_true), GLC, 2014 },</pre>
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

--1446363527.BeB0ba1.6606--

--===============1366711294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1366711294==--

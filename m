From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91570] Upgrading mesa to 10.6 causes segfault in
 OpenGL applications with GeForce4 MX 440 / AGP 8X
Date: Thu, 06 Aug 2015 18:06:56 +0000
Message-ID: <bug-91570-8800-eoz2PyTwwH@http.bugs.freedesktop.org/>
References: <bug-91570-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0263609118=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91570-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0263609118==
Content-Type: multipart/alternative; boundary="1438884415.Adda0.17760"; charset="UTF-8"


--1438884415.Adda0.17760
Date: Thu, 6 Aug 2015 18:06:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91570

--- Comment #15 from omelette <omelette-kcyQbWKpldg@public.gmane.org> ---
(gdb) p tnl->_WindowMap
$1 = {m = 0x821dde0, inv = 0x821de50, flags = 0, type = MATRIX_IDENTITY}

(gdb) p ctx->DrawBuffer
$2 = (struct gl_framebuffer *) 0x0

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1438884415.Adda0.17760
Date: Thu, 6 Aug 2015 18:06:55 +0000
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
   title="NEW - Upgrading mesa to 10.6 causes segfault in OpenGL applications with GeForce4 MX 440 / AGP 8X"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91570#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Upgrading mesa to 10.6 causes segfault in OpenGL applications with GeForce4 MX 440 / AGP 8X"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91570">bug 91570</a>
              from <span class="vcard"><a class="email" href="mailto:omelette&#64;cock.li" title="omelette &lt;omelette&#64;cock.li&gt;"> <span class="fn">omelette</span></a>
</span></b>
        <pre>(gdb) p tnl-&gt;_WindowMap
$1 = {m = 0x821dde0, inv = 0x821de50, flags = 0, type = MATRIX_IDENTITY}

(gdb) p ctx-&gt;DrawBuffer
$2 = (struct gl_framebuffer *) 0x0</pre>
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

--1438884415.Adda0.17760--

--===============0263609118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0263609118==--

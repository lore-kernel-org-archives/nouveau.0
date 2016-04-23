From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95095] NV46 (G72) Full screen artifacts in Freespace
 2 SW OT mod
Date: Sat, 23 Apr 2016 22:47:51 +0000
Message-ID: <bug-95095-8800-xatfjgWrth@http.bugs.freedesktop.org/>
References: <bug-95095-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0600293259=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95095-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0600293259==
Content-Type: multipart/alternative; boundary="14614516710.70E995553.1275";
 charset="UTF-8"


--14614516710.70E995553.1275
Date: Sat, 23 Apr 2016 22:47:51 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95095

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
By the way, it appears that the game makes use of GLSL 1.20 features but
doesn't set a #version 120 on its shaders. You can "fix" this by running it
with

force_glsl_version=120

in the environment. I didn't see any visual changes in the trace replay though.
(But I didn't necessarily know where to look.)

-- 
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.
--14614516710.70E995553.1275
Date: Sat, 23 Apr 2016 22:47:51 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV46 (G72) Full screen artifacts in Freespace 2 SW OT mod"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95095#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV46 (G72) Full screen artifacts in Freespace 2 SW OT mod"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95095">bug 95095</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>By the way, it appears that the game makes use of GLSL 1.20 features but
doesn't set a #version 120 on its shaders. You can &quot;fix&quot; this by running it
with

force_glsl_version=120

in the environment. I didn't see any visual changes in the trace replay though.
(But I didn't necessarily know where to look.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>
--14614516710.70E995553.1275--

--===============0600293259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0600293259==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95095] NV46 (G72) Full screen artifacts in Freespace
 2 SW OT mod
Date: Sat, 23 Apr 2016 22:37:57 +0000
Message-ID: <bug-95095-8800-PQpMXyWv53@http.bugs.freedesktop.org/>
References: <bug-95095-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1763073285=="
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


--===============1763073285==
Content-Type: multipart/alternative; boundary="14614510771.81DB4E.32620";
 charset="UTF-8"


--14614510771.81DB4E.32620
Date: Sat, 23 Apr 2016 22:37:57 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95095

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
If you are involved with the development of this application, could you verify
that it never uses a 32-bit color buffer with a 16-bit depth buffer, or a
16-bit color buffer with a 24-bit depth buffer? (That's RGBA8 + Z16 or RGB565 +
Z24.) Those combinations, while perfectly legal in GL, are not actually
supported by the hardware, and the driver "works around it" by just disabling
depth, which results in broken rendering (but at least no hangs...).

Another random thing to try: set NV30_SWTNL=1 in the environment - that will
make the tnl go through a software path

Lastly, please ensure you're using a semi-recent mesa...

-- 
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.
--14614510771.81DB4E.32620
Date: Sat, 23 Apr 2016 22:37:57 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95095#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV46 (G72) Full screen artifacts in Freespace 2 SW OT mod"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95095">bug 95095</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>If you are involved with the development of this application, could you verify
that it never uses a 32-bit color buffer with a 16-bit depth buffer, or a
16-bit color buffer with a 24-bit depth buffer? (That's RGBA8 + Z16 or RGB565 +
Z24.) Those combinations, while perfectly legal in GL, are not actually
supported by the hardware, and the driver &quot;works around it&quot; by just disabling
depth, which results in broken rendering (but at least no hangs...).

Another random thing to try: set NV30_SWTNL=1 in the environment - that will
make the tnl go through a software path

Lastly, please ensure you're using a semi-recent mesa...</pre>
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
--14614510771.81DB4E.32620--

--===============1763073285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1763073285==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94694] [NVC1] Attempt to use kde/plasma renders the
 system immediately unresponsive
Date: Fri, 25 Mar 2016 17:48:42 +0000
Message-ID: <bug-94694-8800-wrK7HF5sk4@http.bugs.freedesktop.org/>
References: <bug-94694-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0026456868=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94694-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0026456868==
Content-Type: multipart/alternative; boundary="14589281210.bD7c46.29888";
 charset="UTF-8"


--14589281210.bD7c46.29888
Date: Fri, 25 Mar 2016 17:48:41 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94694

--- Comment #3 from Alexander Dubov <oakad-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> ---
It so appears that the issue is due to use of libGLESv2. After re-linking the
Qt library to libGL everything appears to work correctly.

Still, it is pretty unfortunate that a problematic user space library can crash
the kernel like this.

-- 
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.
--14589281210.bD7c46.29888
Date: Fri, 25 Mar 2016 17:48:41 +0000
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
   title="NEW - [NVC1] Attempt to use kde/plasma renders the system immediately unresponsive"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94694#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC1] Attempt to use kde/plasma renders the system immediately unresponsive"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94694">bug 94694</a>
              from <span class="vcard"><a class="email" href="mailto:oakad&#64;yahoo.com" title="Alexander Dubov &lt;oakad&#64;yahoo.com&gt;"> <span class="fn">Alexander Dubov</span></a>
</span></b>
        <pre>It so appears that the issue is due to use of libGLESv2. After re-linking the
Qt library to libGL everything appears to work correctly.

Still, it is pretty unfortunate that a problematic user space library can crash
the kernel like this.</pre>
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
--14589281210.bD7c46.29888--

--===============0026456868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0026456868==--

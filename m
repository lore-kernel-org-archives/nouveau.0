From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90276] [NVE4] read fault error, bisected
Date: Fri, 04 Sep 2015 05:40:54 +0000
Message-ID: <bug-90276-8800-3kflQk0evo@http.bugs.freedesktop.org/>
References: <bug-90276-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1596786517=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90276-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1596786517==
Content-Type: multipart/alternative; boundary="1441345254.5d0EcbB22.2305"; charset="UTF-8"


--1441345254.5d0EcbB22.2305
Date: Fri, 4 Sep 2015 05:40:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90276

--- Comment #16 from Timothy Pearson <kb9vqf-q76TEfyATldW60MLeMDbCeTW4wlIGRCZ@public.gmane.org> ---
(In reply to Arthur Heymans from comment #15)
> 3d9e3921f4d77bcaeea913c48b894d1208f0cb06 + those 4 patches has the read
> fault error!

Out of all of the changes in the aforementioned patches this one would seem to
be most likely to cause the issue:
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/diff/drivers/gpu/drm/nouveau/core/core/mm.c?id=d979ab975ecdb336ed4da77a808be813a293b59e

Any chance you can revert that change in isolation and see if the faults
disappear?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1441345254.5d0EcbB22.2305
Date: Fri, 4 Sep 2015 05:40:54 +0000
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
   title="NEW - [NVE4] read fault error, bisected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90276#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] read fault error, bisected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90276">bug 90276</a>
              from <span class="vcard"><a class="email" href="mailto:kb9vqf&#64;pearsoncomputing.net" title="Timothy Pearson &lt;kb9vqf&#64;pearsoncomputing.net&gt;"> <span class="fn">Timothy Pearson</span></a>
</span></b>
        <pre>(In reply to Arthur Heymans from <a href="show_bug.cgi?id=90276#c15">comment #15</a>)
<span class="quote">&gt; 3d9e3921f4d77bcaeea913c48b894d1208f0cb06 + those 4 patches has the read
&gt; fault error!</span >

Out of all of the changes in the aforementioned patches this one would seem to
be most likely to cause the issue:
<a href="http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/diff/drivers/gpu/drm/nouveau/core/core/mm.c?id=d979ab975ecdb336ed4da77a808be813a293b59e">http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/diff/drivers/gpu/drm/nouveau/core/core/mm.c?id=d979ab975ecdb336ed4da77a808be813a293b59e</a>

Any chance you can revert that change in isolation and see if the faults
disappear?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1441345254.5d0EcbB22.2305--

--===============1596786517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1596786517==--

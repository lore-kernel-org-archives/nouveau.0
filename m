From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58087] [-next] nouveau corrupts kernel mm allocator
Date: Wed, 12 Dec 2012 22:51:27 +0000
Message-ID: <bug-58087-8800-gifguJgJvD@http.bugs.freedesktop.org/>
References: <bug-58087-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1676617806=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58087-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1676617806==
Content-Type: multipart/alternative; boundary="1355352687.2b6c57331.31345"; charset="us-ascii"


--1355352687.2b6c57331.31345
Date: Wed, 12 Dec 2012 22:51:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58087

--- Comment #4 from Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org> ---
(In reply to comment #3)
> It's not a problem with vm allocation. The next one (vm->pgt) fails, so we
> free vm, leaving *pvm pointing at freed memory. When we get to
> nouveau_drm_open, we call nouveau_cli_destroy(cli), which tries to free
> cli->base.vm again. Oops.

Thanks for the explanation. That makes sense to me now.

FYI, I did also file a bug in the kernel bugzilla for the memory allocation
failure itself (kernel bug 51301 here
https://bugzilla.kernel.org/show_bug.cgi?id=51301). A 32k allocation on a 10gb
machine shouldn't really ever fail.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1355352687.2b6c57331.31345
Date: Wed, 12 Dec 2012 22:51:27 +0000
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
   title="NEW --- - [-next] nouveau corrupts kernel mm allocator"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58087#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [-next] nouveau corrupts kernel mm allocator"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58087">bug 58087</a>
              from <span class="vcard"><a class="email" href="mailto:peter&#64;hurleysoftware.com" title="Peter Hurley &lt;peter&#64;hurleysoftware.com&gt;"> <span class="fn">Peter Hurley</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=58087#c3">comment #3</a>)
<span class="quote">&gt; It's not a problem with vm allocation. The next one (vm-&gt;pgt) fails, so we
&gt; free vm, leaving *pvm pointing at freed memory. When we get to
&gt; nouveau_drm_open, we call nouveau_cli_destroy(cli), which tries to free
&gt; cli-&gt;base.vm again. Oops.</span >

Thanks for the explanation. That makes sense to me now.

FYI, I did also file a bug in the kernel bugzilla for the memory allocation
failure itself (kernel <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - ignore_errors ineffective when daemon_reload performed while relevant process is running"
   href="show_bug.cgi?id=51301">bug 51301</a> here
<a href="https://bugzilla.kernel.org/show_bug.cgi?id=51301">https://bugzilla.kernel.org/show_bug.cgi?id=51301</a>). A 32k allocation on a 10gb
machine shouldn't really ever fail.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1355352687.2b6c57331.31345--

--===============1676617806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1676617806==--

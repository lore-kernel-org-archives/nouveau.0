From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58087] [-next] nouveau corrupts kernel mm allocator
Date: Wed, 12 Dec 2012 22:03:42 +0000
Message-ID: <bug-58087-8800-hdecMsRrgd@http.bugs.freedesktop.org/>
References: <bug-58087-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0838620354=="
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


--===============0838620354==
Content-Type: multipart/alternative; boundary="1355349822.a610E3522.23935"; charset="us-ascii"


--1355349822.a610E3522.23935
Date: Wed, 12 Dec 2012 22:03:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58087

--- Comment #3 from Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
It's not a problem with vm allocation. The next one (vm->pgt) fails, so we free
vm, leaving *pvm pointing at freed memory. When we get to nouveau_drm_open, we
call nouveau_cli_destroy(cli), which tries to free cli->base.vm again. Oops.

I already checked other places and some of them also have this bug. I'll post
fixes in a few days.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1355349822.a610E3522.23935
Date: Wed, 12 Dec 2012 22:03:42 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58087#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [-next] nouveau corrupts kernel mm allocator"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58087">bug 58087</a>
              from <span class="vcard"><a class="email" href="mailto:marcin.slusarz&#64;gmail.com" title="Marcin Slusarz &lt;marcin.slusarz&#64;gmail.com&gt;"> <span class="fn">Marcin Slusarz</span></a>
</span></b>
        <pre>It's not a problem with vm allocation. The next one (vm-&gt;pgt) fails, so we free
vm, leaving *pvm pointing at freed memory. When we get to nouveau_drm_open, we
call nouveau_cli_destroy(cli), which tries to free cli-&gt;base.vm again. Oops.

I already checked other places and some of them also have this bug. I'll post
fixes in a few days.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1355349822.a610E3522.23935--

--===============0838620354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0838620354==--

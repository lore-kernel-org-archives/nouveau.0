From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58984] DRM NOUVEAU: probe of 0001:01:00.0 failed
	with error -12
Date: Wed, 13 Mar 2013 20:32:10 +0000
Message-ID: <bug-58984-8800-8PRDtc8cgC@http.bugs.freedesktop.org/>
References: <bug-58984-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1880929546=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58984-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1880929546==
Content-Type: multipart/alternative; boundary="1363206730.2Cbe2.5377"; charset="us-ascii"


--1363206730.2Cbe2.5377
Date: Wed, 13 Mar 2013 20:32:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58984

--- Comment #14 from Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
As you mentioned in the mailing list post that there are other problems after
"fixing" this bug, I think the problem is more widespread.

If page size on GPU is unconnected to page size on CPU (I think it's more
likely than the other option), we need to have our own macros for PAGE_SHIFT /
PAGE_MASK / PAGE_SIZE for GPU and use them everywhere, OR use existing CPU
macros consistently (there are a lot of places using "12" constant).

Either way it's not as simple as this oneliner...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1363206730.2Cbe2.5377
Date: Wed, 13 Mar 2013 20:32:10 +0000
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
   title="NEW --- - DRM NOUVEAU: probe of 0001:01:00.0 failed with error -12"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58984#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - DRM NOUVEAU: probe of 0001:01:00.0 failed with error -12"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58984">bug 58984</a>
              from <span class="vcard"><a class="email" href="mailto:marcin.slusarz&#64;gmail.com" title="Marcin Slusarz &lt;marcin.slusarz&#64;gmail.com&gt;"> <span class="fn">Marcin Slusarz</span></a>
</span></b>
        <pre>As you mentioned in the mailing list post that there are other problems after
&quot;fixing&quot; this bug, I think the problem is more widespread.

If page size on GPU is unconnected to page size on CPU (I think it's more
likely than the other option), we need to have our own macros for PAGE_SHIFT /
PAGE_MASK / PAGE_SIZE for GPU and use them everywhere, OR use existing CPU
macros consistently (there are a lot of places using &quot;12&quot; constant).

Either way it's not as simple as this oneliner...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1363206730.2Cbe2.5377--

--===============1880929546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1880929546==--

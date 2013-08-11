From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67878] Hardware freeze after resume from suspend
Date: Sun, 11 Aug 2013 07:08:29 +0000
Message-ID: <bug-67878-8800-vlGwA6elKD@http.bugs.freedesktop.org/>
References: <bug-67878-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2120668297=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67878-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2120668297==
Content-Type: multipart/alternative; boundary="1376204909.BA34D2.11849"; charset="us-ascii"


--1376204909.BA34D2.11849
Date: Sun, 11 Aug 2013 07:08:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67878

--- Comment #19 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #18)
> Linux commit 992956189de58cae9f2be40585bc25105cd7c5ad is bad.

That seems thoroughly unlikely.

commit 992956189de58cae9f2be40585bc25105cd7c5ad
Author: Eric W. Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Date:   Mon Dec 17 17:19:36 2012 -0800

    efi: Fix the build with user namespaces enabled.

This doesn't apply to your situation on many levels... this is a build fix...
to efi vars...

I bet if you checkout to 992956189de58cae9f2be40585bc25105cd7c5ad^ then you
will still have a bad kernel. You should probably redo the bisect, but look at
the bisect log (git bisect log) and keep all your "bad" commits, since they are
likely indeed bad. But you may have been a bit too eager in calling out the
"good" kernels. (See git help bisect for how to start with a bunch of bad
commits.) While you're at it, you may want to re-test whether 3.7 really is
good.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376204909.BA34D2.11849
Date: Sun, 11 Aug 2013 07:08:29 +0000
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
   title="NEW --- - Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878">bug 67878</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67878#c18">comment #18</a>)
<span class="quote">&gt; Linux commit 992956189de58cae9f2be40585bc25105cd7c5ad is bad.</span >

That seems thoroughly unlikely.

commit 992956189de58cae9f2be40585bc25105cd7c5ad
Author: Eric W. Biederman &lt;<a href="mailto:ebiederm&#64;xmission.com">ebiederm&#64;xmission.com</a>&gt;
Date:   Mon Dec 17 17:19:36 2012 -0800

    efi: Fix the build with user namespaces enabled.

This doesn't apply to your situation on many levels... this is a build fix...
to efi vars...

I bet if you checkout to 992956189de58cae9f2be40585bc25105cd7c5ad^ then you
will still have a bad kernel. You should probably redo the bisect, but look at
the bisect log (git bisect log) and keep all your &quot;bad&quot; commits, since they are
likely indeed bad. But you may have been a bit too eager in calling out the
&quot;good&quot; kernels. (See git help bisect for how to start with a bunch of bad
commits.) While you're at it, you may want to re-test whether 3.7 really is
good.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376204909.BA34D2.11849--

--===============2120668297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2120668297==--

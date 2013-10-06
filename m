From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69827] [NVC1] Uneven, jerky mouse movement,
 increasing CPU usage
Date: Sun, 06 Oct 2013 05:35:51 +0000
Message-ID: <bug-69827-8800-HxOUe6s8H3@http.bugs.freedesktop.org/>
References: <bug-69827-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0115089597=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69827-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0115089597==
Content-Type: multipart/alternative; boundary="1381037751.Bc432.12048"; charset="us-ascii"


--1381037751.Bc432.12048
Date: Sun, 6 Oct 2013 05:35:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69827

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #2)
> >Does this still happen with the latest software, i.e. kernel 3.10,
> > mesa 9.2, xf86-video-nouveau 1.0.9?
> >
> I do not know. My system is not that up to date. v3.7.10-1.16-desktop x86_64

Perhaps I was unclear. The implication was "update your system to these
packages and see if it still happens".

> 
> > Also, does this happen on an untainted kernel?
> >
> Yes.

To be clear, loading the virtualbox modules taints the kernel.

> 
> > Lastly, you can use 'perf' (in tools/perf in the linux-kernel sources) ...
> >
> There is no "perf" executable in that directory.

Yes there is, if you build it. I'm sure there are plenty of wikis about it on
the internet if you have trouble getting it to work.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381037751.Bc432.12048
Date: Sun, 6 Oct 2013 05:35:51 +0000
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
   title="NEW --- - [NVC1] Uneven, jerky mouse movement, increasing CPU usage"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69827#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] Uneven, jerky mouse movement, increasing CPU usage"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69827">bug 69827</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=69827#c2">comment #2</a>)
<span class="quote">&gt; &gt;Does this still happen with the latest software, i.e. kernel 3.10,
&gt; &gt; mesa 9.2, xf86-video-nouveau 1.0.9?
&gt; &gt;
&gt; I do not know. My system is not that up to date. v3.7.10-1.16-desktop x86_64</span >

Perhaps I was unclear. The implication was &quot;update your system to these
packages and see if it still happens&quot;.

<span class="quote">&gt; 
&gt; &gt; Also, does this happen on an untainted kernel?
&gt; &gt;
&gt; Yes.</span >

To be clear, loading the virtualbox modules taints the kernel.

<span class="quote">&gt; 
&gt; &gt; Lastly, you can use 'perf' (in tools/perf in the linux-kernel sources) ...
&gt; &gt;
&gt; There is no &quot;perf&quot; executable in that directory.</span >

Yes there is, if you build it. I'm sure there are plenty of wikis about it on
the internet if you have trouble getting it to work.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381037751.Bc432.12048--

--===============0115089597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0115089597==--

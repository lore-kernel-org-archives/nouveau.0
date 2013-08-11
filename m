From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62835] Screen freezes after resume from s2ram
Date: Sun, 11 Aug 2013 08:49:41 +0000
Message-ID: <bug-62835-8800-pNV49JxWwm@http.bugs.freedesktop.org/>
References: <bug-62835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0687247656=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-62835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0687247656==
Content-Type: multipart/alternative; boundary="1376210981.06dA83.24264"; charset="us-ascii"


--1376210981.06dA83.24264
Date: Sun, 11 Aug 2013 08:49:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62835

--- Comment #3 from Pontus Fuchs <pontus.fuchs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #2)
> Pontus
> 
> You've mentioned in bug 59057
> 
> > Pontus Fuchs 2013-03-11 19:57:13 UTC
> > Suspend / Resume working again with Linus' master git.
> 
> Assuming that this is the same system, has the issue regressed again ?
> 
> I'm assuming that the issue may not have been fixed and was worked around by
> disabling "desktop effects".

The symptoms are similar to bug 59057 but not identical. In bug 59057 the
screen was completely blank after resume. 

In this bug the screen is first restored but everything is frozen except for
the mouse pointer.

Since the symptms where not identical I decided to file a new bug.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376210981.06dA83.24264
Date: Sun, 11 Aug 2013 08:49:41 +0000
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
   title="NEW --- - Screen freezes after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62835#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Screen freezes after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62835">bug 62835</a>
              from <span class="vcard"><a class="email" href="mailto:pontus.fuchs&#64;gmail.com" title="Pontus Fuchs &lt;pontus.fuchs&#64;gmail.com&gt;"> <span class="fn">Pontus Fuchs</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=62835#c2">comment #2</a>)
<span class="quote">&gt; Pontus
&gt; 
&gt; You've mentioned in <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Black screen after resume from s2ram"
   href="show_bug.cgi?id=59057">bug 59057</a>
&gt; 
&gt; &gt; Pontus Fuchs 2013-03-11 19:57:13 UTC
&gt; &gt; Suspend / Resume working again with Linus' master git.
&gt; 
&gt; Assuming that this is the same system, has the issue regressed again ?
&gt; 
&gt; I'm assuming that the issue may not have been fixed and was worked around by
&gt; disabling &quot;desktop effects&quot;.</span >

The symptoms are similar to <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Black screen after resume from s2ram"
   href="show_bug.cgi?id=59057">bug 59057</a> but not identical. In <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Black screen after resume from s2ram"
   href="show_bug.cgi?id=59057">bug 59057</a> the
screen was completely blank after resume. 

In this bug the screen is first restored but everything is frozen except for
the mouse pointer.

Since the symptms where not identical I decided to file a new bug.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376210981.06dA83.24264--

--===============0687247656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0687247656==--

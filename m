From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Wed, 31 Jul 2013 14:34:42 +0000
Message-ID: <bug-54700-8800-xHewUVpjK0@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0537343173=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0537343173==
Content-Type: multipart/alternative; boundary="1375281281.54f762.23352"; charset="us-ascii"


--1375281281.54f762.23352
Date: Wed, 31 Jul 2013 14:34:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #50 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #49)
> (In reply to comment #48)
> > 1. Startup X with SWCursor, by adding "Option "HWCursor" "O"" in your
> > xorg.conf(see $man nouveau for more information)
> > Does the cursor render properly ?
> 
> YES :)
> 
So nouveau_bo_new() it is. Might be worth setting up an X session with nothing
but a plain X, xterm and HWCursor.

> NO signs of corruption in glxgears from a tiny window to a full screen ...
> but resizing glxgears I had X freeze twice, see below
> 
Bummer, older cards seems to me quite susceptible to those issues (reloc
wait_idle failed: -16)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375281281.54f762.23352
Date: Wed, 31 Jul 2013 14:34:41 +0000
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
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c50">Comment # 50</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=54700#c49">comment #49</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=54700#c48">comment #48</a>)
&gt; &gt; 1. Startup X with SWCursor, by adding &quot;Option &quot;HWCursor&quot; &quot;O&quot;&quot; in your
&gt; &gt; xorg.conf(see $man nouveau for more information)
&gt; &gt; Does the cursor render properly ?
&gt; 
&gt; YES :)
&gt; </span >
So nouveau_bo_new() it is. Might be worth setting up an X session with nothing
but a plain X, xterm and HWCursor.

<span class="quote">&gt; NO signs of corruption in glxgears from a tiny window to a full screen ...
&gt; but resizing glxgears I had X freeze twice, see below
&gt; </span >
Bummer, older cards seems to me quite susceptible to those issues (reloc
wait_idle failed: -16)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375281281.54f762.23352--

--===============0537343173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0537343173==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75279] XCloseDisplay() takes one minute around
 nouveau_dri.so, freezing Firefox startup
Date: Sat, 01 Mar 2014 12:20:59 +0000
Message-ID: <bug-75279-8800-1uPymEH3gZ@http.bugs.freedesktop.org/>
References: <bug-75279-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2040027884=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75279-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2040027884==
Content-Type: multipart/alternative; boundary="1393676459.3f77f3.10524"; charset="us-ascii"


--1393676459.3f77f3.10524
Date: Sat, 1 Mar 2014 12:20:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75279

--- Comment #25 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #21)
[snip]
> Sure. You need a Nightly build, but not a current one since we have landed a
> work-around (avoiding to call XCloseDisplay here). This one, from Feb. 20,
> should reproduce:
> 
> http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/2014-02-20-03-02-02-
> mozilla-central/
> 
> E.g.
> http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/2014-02-20-03-02-02-
> mozilla-central/firefox-30.0a1.en-US.linux-x86_64.tar.bz2

I can reproduce the problem with the linked build, although the creation of 16
threads at startup will make things "a little" bit slow to resolve.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393676459.3f77f3.10524
Date: Sat, 1 Mar 2014 12:20:59 +0000
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
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279">bug 75279</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=75279#c21">comment #21</a>)
[snip]
<span class="quote">&gt; Sure. You need a Nightly build, but not a current one since we have landed a
&gt; work-around (avoiding to call XCloseDisplay here). This one, from Feb. 20,
&gt; should reproduce:
&gt; 
&gt; <a href="http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/2014-02-20-03-02-02">http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/2014-02-20-03-02-02</a>-
&gt; mozilla-central/
&gt; 
&gt; E.g.
&gt; <a href="http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/2014-02-20-03-02-02">http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/2014-02-20-03-02-02</a>-
&gt; mozilla-central/firefox-30.0a1.en-US.linux-x86_64.tar.bz2</span >

I can reproduce the problem with the linked build, although the creation of 16
threads at startup will make things &quot;a little&quot; bit slow to resolve.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393676459.3f77f3.10524--

--===============2040027884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2040027884==--

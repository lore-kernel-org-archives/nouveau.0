From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67628] [NVC1] [BISECTED] Monitor on Display port
 shows distortions
Date: Thu, 13 Feb 2014 22:58:10 +0000
Message-ID: <bug-67628-8800-9Dkhr6qojm@http.bugs.freedesktop.org/>
References: <bug-67628-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1694441739=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67628-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1694441739==
Content-Type: multipart/alternative; boundary="1392332289.2FFd3.5542"; charset="us-ascii"


--1392332289.2FFd3.5542
Date: Thu, 13 Feb 2014 22:58:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67628

--- Comment #28 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #26)
> (In reply to comment #25)
> Yes, after making that change, the displayport output is working again.
> 
> I'll attach the dmesg in case you're curious.

Fantastic!

I think what would be interesting would be adding a _ton_ of prints to that
function, basically at every step, and comparing to the old version (which
unfortunately was in a somewhat different place, but look at the diff and it
should be apparent). Reading over the code, the computations should be
identical, but perhaps there's a subtle bug somewhere, or the inputs end up
different.

If you're not up to figuring out how to do this yourself, I can try to write up
some patches to apply to the old + new versions.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392332289.2FFd3.5542
Date: Thu, 13 Feb 2014 22:58:09 +0000
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
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67628#c28">Comment # 28</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67628">bug 67628</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67628#c26">comment #26</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=67628#c25">comment #25</a>)
&gt; Yes, after making that change, the displayport output is working again.
&gt; 
&gt; I'll attach the dmesg in case you're curious.</span >

Fantastic!

I think what would be interesting would be adding a _ton_ of prints to that
function, basically at every step, and comparing to the old version (which
unfortunately was in a somewhat different place, but look at the diff and it
should be apparent). Reading over the code, the computations should be
identical, but perhaps there's a subtle bug somewhere, or the inputs end up
different.

If you're not up to figuring out how to do this yourself, I can try to write up
some patches to apply to the old + new versions.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392332289.2FFd3.5542--

--===============1694441739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1694441739==--

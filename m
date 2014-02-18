From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75013] [NVC1] [Quadro 600] Display update issues,
 stale rendered content
Date: Tue, 18 Feb 2014 18:31:20 +0000
Message-ID: <bug-75013-8800-3DoADwbT4V@http.bugs.freedesktop.org/>
References: <bug-75013-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0051625833=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75013-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0051625833==
Content-Type: multipart/alternative; boundary="1392748280.8C2451.7348"; charset="us-ascii"


--1392748280.8C2451.7348
Date: Tue, 18 Feb 2014 18:31:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75013

--- Comment #8 from Sudarshan <spartha80-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #7)
> (In reply to comment #6)
> > One observatino is that the issue is not seen with Live CD.
> > Is there a difference between the installed OS and the live CD? This
> > surprised me, as I was expecting a smooth sail...
> 
> Depends on the Live CD, doesn't it :) In the Ubuntu case, I haven't the
> slightest clue. I'm guessing it has different versions of something -- would
> be good to figure out what versions it's running and what versions you're
> running on the installed system of:
> 
> (a) kernel
> (b) xf86-video-nouveau (potentially called xorg-server-video-nouveau or
> something else along those lines)
> (c) libdrm
> (d) mesa (specifically the dri drivers)
> 
> Those 4 pieces of software basically make up nouveau. I doubt the last 2
> really matter for your case, but... no harm done grabbing versions.

I am for the time being giving up. I was unable to build a TOT kernel that
would boot. For now, falling back to the onboard graphics card. Will try to
post the findings when I get some time. Hope there is resolution for this
issue, otherwise I will be left with a 100$ card that I cannot use :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392748280.8C2451.7348
Date: Tue, 18 Feb 2014 18:31:20 +0000
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
   title="NEW --- - [NVC1] [Quadro 600] Display update issues, stale rendered content"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75013#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [Quadro 600] Display update issues, stale rendered content"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75013">bug 75013</a>
              from <span class="vcard"><a class="email" href="mailto:spartha80&#64;gmail.com" title="Sudarshan &lt;spartha80&#64;gmail.com&gt;"> <span class="fn">Sudarshan</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=75013#c7">comment #7</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=75013#c6">comment #6</a>)
&gt; &gt; One observatino is that the issue is not seen with Live CD.
&gt; &gt; Is there a difference between the installed OS and the live CD? This
&gt; &gt; surprised me, as I was expecting a smooth sail...
&gt; 
&gt; Depends on the Live CD, doesn't it :) In the Ubuntu case, I haven't the
&gt; slightest clue. I'm guessing it has different versions of something -- would
&gt; be good to figure out what versions it's running and what versions you're
&gt; running on the installed system of:
&gt; 
&gt; (a) kernel
&gt; (b) xf86-video-nouveau (potentially called xorg-server-video-nouveau or
&gt; something else along those lines)
&gt; (c) libdrm
&gt; (d) mesa (specifically the dri drivers)
&gt; 
&gt; Those 4 pieces of software basically make up nouveau. I doubt the last 2
&gt; really matter for your case, but... no harm done grabbing versions.</span >

I am for the time being giving up. I was unable to build a TOT kernel that
would boot. For now, falling back to the onboard graphics card. Will try to
post the findings when I get some time. Hope there is resolution for this
issue, otherwise I will be left with a 100$ card that I cannot use :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392748280.8C2451.7348--

--===============0051625833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0051625833==--

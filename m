From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68835] [NV04] Script offset calculated incorrectly
 for some BMP 1.x VBIOSes
Date: Mon, 27 Jan 2014 01:42:49 +0000
Message-ID: <bug-68835-8800-vzgLGXdn6A@http.bugs.freedesktop.org/>
References: <bug-68835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1619076661=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1619076661==
Content-Type: multipart/alternative; boundary="1390786969.acEF2.9348"; charset="us-ascii"


--1390786969.acEF2.9348
Date: Mon, 27 Jan 2014 01:42:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68835

--- Comment #13 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #12)
> (In reply to comment #11)
> > The fix should be in 3.13.0 and later. I'm going to mark this bug as fixed,
> > but do test it out when you get a chance and let us know whether it fixes
> > your issue (and/or breaks anything, like suspend, since vbios scripts are
> > found now).
> 
> Hi Ilia,
> just to let you know that I got to install Fedora 19 on a new hard disk and
> that I'm following the procedure you pointed me to build a patched custom
> 3.12 kernel with your patch applied. It's currently compiling (it takes a
> lot of time on this old Pentium 3...). When I've completed my testings, I'll
> let you know.

Great! You could also have grabbed a pre-compiled 3.13 kernel off of rawhide,
if that's availble. I'm really not sure what the Fedora situation is though, so
I can't give specific advice.

> 
> On the other hand, I have another small glitch: the maximum resolution
> proposed by the monitor configuration utility of Fedora is 1024x768@60Hz,
> while my monitor preferred resolution is 1280x1024 and it can support up to
> 75Hz resolution. I see that the xrandr output is not consistent with what I
> get using monitor-get-edid+monitor-parse-edid, which returns the correct
> data. Is this something related to the nouveau driver?

I believe you have a different bug already open about this, yes?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390786969.acEF2.9348
Date: Mon, 27 Jan 2014 01:42:49 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV04] Script offset calculated incorrectly for some BMP 1.x VBIOSes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68835#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV04] Script offset calculated incorrectly for some BMP 1.x VBIOSes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68835">bug 68835</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=68835#c12">comment #12</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=68835#c11">comment #11</a>)
&gt; &gt; The fix should be in 3.13.0 and later. I'm going to mark this bug as fixed,
&gt; &gt; but do test it out when you get a chance and let us know whether it fixes
&gt; &gt; your issue (and/or breaks anything, like suspend, since vbios scripts are
&gt; &gt; found now).
&gt; 
&gt; Hi Ilia,
&gt; just to let you know that I got to install Fedora 19 on a new hard disk and
&gt; that I'm following the procedure you pointed me to build a patched custom
&gt; 3.12 kernel with your patch applied. It's currently compiling (it takes a
&gt; lot of time on this old Pentium 3...). When I've completed my testings, I'll
&gt; let you know.</span >

Great! You could also have grabbed a pre-compiled 3.13 kernel off of rawhide,
if that's availble. I'm really not sure what the Fedora situation is though, so
I can't give specific advice.

<span class="quote">&gt; 
&gt; On the other hand, I have another small glitch: the maximum resolution
&gt; proposed by the monitor configuration utility of Fedora is 1024x768&#64;60Hz,
&gt; while my monitor preferred resolution is 1280x1024 and it can support up to
&gt; 75Hz resolution. I see that the xrandr output is not consistent with what I
&gt; get using monitor-get-edid+monitor-parse-edid, which returns the correct
&gt; data. Is this something related to the nouveau driver?</span >

I believe you have a different bug already open about this, yes?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390786969.acEF2.9348--

--===============1619076661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1619076661==--

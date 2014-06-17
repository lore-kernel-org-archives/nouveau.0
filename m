From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78439] [NVC1] Display corruption when DP connector
 is reattached
Date: Tue, 17 Jun 2014 12:29:13 +0000
Message-ID: <bug-78439-8800-JB9DyLZ17H@http.bugs.freedesktop.org/>
References: <bug-78439-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1444209428=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78439-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1444209428==
Content-Type: multipart/alternative; boundary="1403008153.12DEF62.21049"; charset="us-ascii"


--1403008153.12DEF62.21049
Date: Tue, 17 Jun 2014 12:29:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78439

--- Comment #19 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #18)
> Yes it helps. DP screen is no longer black.
> 
> The original issue has diminished too. The corrupted portion of the display
> is three times narrower. But I haven't tested whether this patch helps or
> one of the patches after that "bad revision"
> 8894f4919bc43f821775db2cfff4b917871b2102.

Well, the interesting thing is that the "bad" patch is doing nothing wrong. 
There is a change in behaviour in that we train the link at the highest rate
supported between the display and the GPU instead of the bare minimum required
to support the mode (something which is sensible for supporting MST, and which
the NVIDIA binary driver also does).

I've seen some odd behaviour on my GF108 with one particular DP->VGA adapter at
the high bit rate too, which the NVIDIA binary driver is also effected by,
however, I'm not sure it's the same as you're seeing.  Mine is random, and
works a lot of the time.  The bad log *does* look like the same symptoms (the
link trains successfully, but continually drops out afterwards).

Would it be at all possible for you to try NVIDIA's driver, and see how it
does?  And, if it works, get a trace[1] of it initialising the screen? 
Hopefully in your case it works perfectly fine, and I can find something we're
doing wrong for the high link rate.

[1] http://nouveau.freedesktop.org/wiki/MmioTrace/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403008153.12DEF62.21049
Date: Tue, 17 Jun 2014 12:29:13 +0000
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
   title="NEW --- - [NVC1] Display corruption when DP connector is reattached"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78439#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] Display corruption when DP connector is reattached"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78439">bug 78439</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=78439#c18">comment #18</a>)
<span class="quote">&gt; Yes it helps. DP screen is no longer black.
&gt; 
&gt; The original issue has diminished too. The corrupted portion of the display
&gt; is three times narrower. But I haven't tested whether this patch helps or
&gt; one of the patches after that &quot;bad revision&quot;
&gt; 8894f4919bc43f821775db2cfff4b917871b2102.</span >

Well, the interesting thing is that the &quot;bad&quot; patch is doing nothing wrong. 
There is a change in behaviour in that we train the link at the highest rate
supported between the display and the GPU instead of the bare minimum required
to support the mode (something which is sensible for supporting MST, and which
the NVIDIA binary driver also does).

I've seen some odd behaviour on my GF108 with one particular DP-&gt;VGA adapter at
the high bit rate too, which the NVIDIA binary driver is also effected by,
however, I'm not sure it's the same as you're seeing.  Mine is random, and
works a lot of the time.  The bad log *does* look like the same symptoms (the
link trains successfully, but continually drops out afterwards).

Would it be at all possible for you to try NVIDIA's driver, and see how it
does?  And, if it works, get a trace[1] of it initialising the screen? 
Hopefully in your case it works perfectly fine, and I can find something we're
doing wrong for the high link rate.

[1] <a href="http://nouveau.freedesktop.org/wiki/MmioTrace/">http://nouveau.freedesktop.org/wiki/MmioTrace/</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403008153.12DEF62.21049--

--===============1444209428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1444209428==--

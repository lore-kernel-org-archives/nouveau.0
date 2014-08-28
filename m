From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83168] [NV46] No display after suspend to RAM
Date: Thu, 28 Aug 2014 02:31:55 +0000
Message-ID: <bug-83168-8800-A92LC9foNl@http.bugs.freedesktop.org/>
References: <bug-83168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0954717213=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0954717213==
Content-Type: multipart/alternative; boundary="1409193115.b863E701.2396"; charset="us-ascii"


--1409193115.b863E701.2396
Date: Thu, 28 Aug 2014 02:31:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83168

--- Comment #3 from Neven Sajko <nsajko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #2)
> Has any kernel version worked for you? i.e. is this a recent regression, or
> was it always like this (or even worse)?
> 
> 0x6813c8 = PRMDIO.PAL_INDEX
> 
> The 680* ones are in PRAMDAC but not documented in envytools...
> 
> Weird that the core frequency gets detected as 200 after resume instead of
> 222 as it was on start...

(In reply to comment #2)
> Has any kernel version worked for you? i.e. is this a recent regression, or
> was it always like this (or even worse)?
> 
> 0x6813c8 = PRMDIO.PAL_INDEX
> 
> The 680* ones are in PRAMDAC but not documented in envytools...
> 
> Weird that the core frequency gets detected as 200 after resume instead of
> 222 as it was on start...

I think this was like it is for a few months, it isn't a recent          
regression.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409193115.b863E701.2396
Date: Thu, 28 Aug 2014 02:31:55 +0000
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
   title="NEW --- - [NV46] No display after suspend to RAM"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83168#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV46] No display after suspend to RAM"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83168">bug 83168</a>
              from <span class="vcard"><a class="email" href="mailto:nsajko&#64;gmail.com" title="Neven Sajko &lt;nsajko&#64;gmail.com&gt;"> <span class="fn">Neven Sajko</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=83168#c2">comment #2</a>)
<span class="quote">&gt; Has any kernel version worked for you? i.e. is this a recent regression, or
&gt; was it always like this (or even worse)?
&gt; 
&gt; 0x6813c8 = PRMDIO.PAL_INDEX
&gt; 
&gt; The 680* ones are in PRAMDAC but not documented in envytools...
&gt; 
&gt; Weird that the core frequency gets detected as 200 after resume instead of
&gt; 222 as it was on start...</span >

(In reply to <a href="show_bug.cgi?id=83168#c2">comment #2</a>)
<span class="quote">&gt; Has any kernel version worked for you? i.e. is this a recent regression, or
&gt; was it always like this (or even worse)?
&gt; 
&gt; 0x6813c8 = PRMDIO.PAL_INDEX
&gt; 
&gt; The 680* ones are in PRAMDAC but not documented in envytools...
&gt; 
&gt; Weird that the core frequency gets detected as 200 after resume instead of
&gt; 222 as it was on start...</span >

I think this was like it is for a few months, it isn't a recent          
regression.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409193115.b863E701.2396--

--===============0954717213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0954717213==--

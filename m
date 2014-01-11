From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21273] [NV17] PowerMac3,
 6 Driver can't detect video output and xserver doesn't start
Date: Sat, 11 Jan 2014 05:44:10 +0000
Message-ID: <bug-21273-8800-EX7SwjPDwG@http.bugs.freedesktop.org/>
References: <bug-21273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0990577766=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21273-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0990577766==
Content-Type: multipart/alternative; boundary="1389419050.2bDaEE71.28723"; charset="us-ascii"


--1389419050.2bDaEE71.28723
Date: Sat, 11 Jan 2014 05:44:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=21273

--- Comment #94 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #93)
> Created attachment 91839 [details]
> log loading kernel from git
> 
> I tried to add only one line:
> fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 1, all_heads, 2);
> 
> I see white horizontal lines on the screen and all hung up.

Ugh, looks like nouveau might have grown a bug on ppc or something -- the
traceback isn't related to the line that you added (hopefully!). What if you
apply it to a 3.10 kernel or whatever you were trying with earlier?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389419050.2bDaEE71.28723
Date: Sat, 11 Jan 2014 05:44:10 +0000
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
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273#c94">Comment # 94</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273">bug 21273</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=21273#c93">comment #93</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=91839" name="attach_91839" title="log loading kernel from git">attachment 91839</a> <a href="attachment.cgi?id=91839&amp;action=edit" title="log loading kernel from git">[details]</a></span>
&gt; log loading kernel from git
&gt; 
&gt; I tried to add only one line:
&gt; fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 1, all_heads, 2);
&gt; 
&gt; I see white horizontal lines on the screen and all hung up.</span >

Ugh, looks like nouveau might have grown a bug on ppc or something -- the
traceback isn't related to the line that you added (hopefully!). What if you
apply it to a 3.10 kernel or whatever you were trying with earlier?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389419050.2bDaEE71.28723--

--===============0990577766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0990577766==--

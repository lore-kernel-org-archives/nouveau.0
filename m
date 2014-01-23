From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21273] [NV17] PowerMac3,
 6 Driver can't detect video output and xserver doesn't start
Date: Thu, 23 Jan 2014 05:39:17 +0000
Message-ID: <bug-21273-8800-9zwQDUEmuu@http.bugs.freedesktop.org/>
References: <bug-21273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0054757705=="
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


--===============0054757705==
Content-Type: multipart/alternative; boundary="1390455557.15530DDd1.23652"; charset="us-ascii"


--1390455557.15530DDd1.23652
Date: Thu, 23 Jan 2014 05:39:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=21273

--- Comment #98 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Sorry to keep making you try stuff, but can you put up a log of a kernel with

if (of_machine_is_compatible("PowerMac3,6")) {
  fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 1, all_heads, 2);
  return;
}

[Also, looking at Stuart's patch that worked for you all that while ago...
perhaps instead of all_heads (3 in your case) it should be "2"? Worth trying
too, but unless it produces substantially diff/better results, I don't need a
log from it.]

(You can use 3.13 now -- the bug with instmem you ran into should be fixed
now.)

And boot with

nouveau.debug=trace drm.debug=0xe

This should produce a bunch of debug info, which may be helpful. Thanks for
that nvidiafb log too.

Also, to be clear -- that fabricate_dcb_output line changes behaviour from
"screen suspends due to no output" to "screen on with garbage on it", right?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390455557.15530DDd1.23652
Date: Thu, 23 Jan 2014 05:39:17 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273#c98">Comment # 98</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273">bug 21273</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Sorry to keep making you try stuff, but can you put up a log of a kernel with

if (of_machine_is_compatible(&quot;PowerMac3,6&quot;)) {
  fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 1, all_heads, 2);
  return;
}

[Also, looking at Stuart's patch that worked for you all that while ago...
perhaps instead of all_heads (3 in your case) it should be &quot;2&quot;? Worth trying
too, but unless it produces substantially diff/better results, I don't need a
log from it.]

(You can use 3.13 now -- the bug with instmem you ran into should be fixed
now.)

And boot with

nouveau.debug=trace drm.debug=0xe

This should produce a bunch of debug info, which may be helpful. Thanks for
that nvidiafb log too.

Also, to be clear -- that fabricate_dcb_output line changes behaviour from
&quot;screen suspends due to no output&quot; to &quot;screen on with garbage on it&quot;, right?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390455557.15530DDd1.23652--

--===============0054757705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0054757705==--

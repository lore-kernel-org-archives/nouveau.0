From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72952] [NV94] no HDMI output,
 xrands claims DVI-D-1 disconnected
Date: Sun, 19 Jan 2014 11:55:32 +0000
Message-ID: <bug-72952-8800-N5BycO4fhY@http.bugs.freedesktop.org/>
References: <bug-72952-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0574310384=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72952-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0574310384==
Content-Type: multipart/alternative; boundary="1390132532.e4cA2.13955"; charset="us-ascii"


--1390132532.e4cA2.13955
Date: Sun, 19 Jan 2014 11:55:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72952

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I think this issue might be the same one as bug #60680. Can you try the patch
at https://bugs.freedesktop.org/attachment.cgi?id=92319 and see if it helps? If
it doesn't, can you upload your vbios (/sys/kernel/debug/dri/0/vbios.rom) as
well as a dmesg booting with nouveau.debug=VBIOS=trace,PDISP=debug -- that
might show some clues.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390132532.e4cA2.13955
Date: Sun, 19 Jan 2014 11:55:32 +0000
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
   title="NEW --- - [NV94] no HDMI output, xrands claims DVI-D-1 disconnected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72952#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV94] no HDMI output, xrands claims DVI-D-1 disconnected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72952">bug 72952</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I think this issue might be the same one as <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="show_bug.cgi?id=60680">bug #60680</a>. Can you try the patch
at <a href="https://bugs.freedesktop.org/attachment.cgi?id=92319">https://bugs.freedesktop.org/attachment.cgi?id=92319</a> and see if it helps? If
it doesn't, can you upload your vbios (/sys/kernel/debug/dri/0/vbios.rom) as
well as a dmesg booting with nouveau.debug=VBIOS=trace,PDISP=debug -- that
might show some clues.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390132532.e4cA2.13955--

--===============0574310384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0574310384==--

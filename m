From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21273] [NV17] PowerMac3,
 6 Driver can't detect video output and xserver doesn't start
Date: Sun, 08 Sep 2013 04:50:58 +0000
Message-ID: <bug-21273-8800-BhOkR8v6Gb@http.bugs.freedesktop.org/>
References: <bug-21273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2107812312=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21273-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2107812312==
Content-Type: multipart/alternative; boundary="1378615858.0BdBA78F1.13266"; charset="us-ascii"


--1378615858.0BdBA78F1.13266
Date: Sun, 8 Sep 2013 04:50:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=21273

--- Comment #78 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The vast majority of DVI ports on graphics cards can do both digital and
analog. That's what makes DVI -> VGA adapters possible. Is the screen that you
have connected digital or analog?

Can you supply the output of

xrandr --verbose

when running with the "nv" driver? I just looked over the nv driver's codebase,
and unfortunately I don't see any relevant PowerMac hacks, so there must be
something it knows that nouveau doesn't.

Can you also upload a copy of your vbios? I think nouveau ignores it for NV17,
but would still be interesting to see what it says. (With nouveau loaded, you
can get it out of /sys/kernel/debug/dri/0/vbios.rom, or you can use the
envytools nvagetbios utility.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378615858.0BdBA78F1.13266
Date: Sun, 8 Sep 2013 04:50:58 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273#c78">Comment # 78</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273">bug 21273</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The vast majority of DVI ports on graphics cards can do both digital and
analog. That's what makes DVI -&gt; VGA adapters possible. Is the screen that you
have connected digital or analog?

Can you supply the output of

xrandr --verbose

when running with the &quot;nv&quot; driver? I just looked over the nv driver's codebase,
and unfortunately I don't see any relevant PowerMac hacks, so there must be
something it knows that nouveau doesn't.

Can you also upload a copy of your vbios? I think nouveau ignores it for NV17,
but would still be interesting to see what it says. (With nouveau loaded, you
can get it out of /sys/kernel/debug/dri/0/vbios.rom, or you can use the
envytools nvagetbios utility.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378615858.0BdBA78F1.13266--

--===============2107812312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2107812312==--

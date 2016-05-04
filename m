From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93887] [NV96] Amilo Xi 3650: G96M [GeForce 9600M
 GT]: HDMI monitor stays black after s2ram
Date: Wed, 04 May 2016 11:42:58 +0000
Message-ID: <bug-93887-8800-VGz7cyWllK@http.bugs.freedesktop.org/>
References: <bug-93887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0982833781=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0982833781==
Content-Type: multipart/alternative; boundary="14623621781.bD03.4823";
 charset="UTF-8"


--14623621781.bD03.4823
Date: Wed, 4 May 2016 11:42:58 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93887

--- Comment #37 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
To extract the VBIOS, look at
https://nouveau.freedesktop.org/wiki/DumpingVideoBios/, trying either of both
last options (nvagetbios or cat vbios.rom).

Regarding the MMIOtrace, I should have been more specific, sorry. I am looking
for a MMIOtrace of the blob being loaded with no external screen:

1. start the trace
2. modprobe nvidia
3. start X
4. `echo 'Plugging screen' > /sys/kernel/debug/tracing/trace_marker`
5. plug the screen and set it up to get an image
6. `echo 'Screen is ready' > /sys/kernel/debug/tracing/trace_marker`
7. stop the trace

and a similar one where the screen is already plugged in during the boot:


1. start the trace
2. modprobe nvidia
3. start X
#if is_needed
4. `echo 'Setting up screen' > /sys/kernel/debug/tracing/trace_marker`
5. set it up to get an image
6. `echo 'Screen is ready' > /sys/kernel/debug/tracing/trace_marker`
#endif
7. stop the trace

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14623621781.bD03.4823
Date: Wed, 4 May 2016 11:42:58 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monitor stays black after s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887#c37">Comment # 37</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monitor stays black after s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887">bug 93887</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>To extract the VBIOS, look at
<a href="https://nouveau.freedesktop.org/wiki/DumpingVideoBios/">https://nouveau.freedesktop.org/wiki/DumpingVideoBios/</a>, trying either of both
last options (nvagetbios or cat vbios.rom).

Regarding the MMIOtrace, I should have been more specific, sorry. I am looking
for a MMIOtrace of the blob being loaded with no external screen:

1. start the trace
2. modprobe nvidia
3. start X
4. `echo 'Plugging screen' &gt; /sys/kernel/debug/tracing/trace_marker`
5. plug the screen and set it up to get an image
6. `echo 'Screen is ready' &gt; /sys/kernel/debug/tracing/trace_marker`
7. stop the trace

and a similar one where the screen is already plugged in during the boot:


1. start the trace
2. modprobe nvidia
3. start X
#if is_needed
4. `echo 'Setting up screen' &gt; /sys/kernel/debug/tracing/trace_marker`
5. set it up to get an image
6. `echo 'Screen is ready' &gt; /sys/kernel/debug/tracing/trace_marker`
#endif
7. stop the trace</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14623621781.bD03.4823--

--===============0982833781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0982833781==--

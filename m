From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79518] nouveau causes lockup and reboot on GT215
Date: Wed, 06 Apr 2016 20:24:59 +0000
Message-ID: <bug-79518-8800-IFuBgdaX2g@http.bugs.freedesktop.org/>
References: <bug-79518-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0834826451=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79518-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0834826451==
Content-Type: multipart/alternative; boundary="14599742980.Ef63860.11450";
 charset="UTF-8"


--14599742980.Ef63860.11450
Date: Wed, 6 Apr 2016 20:24:58 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=79518

--- Comment #5 from Adam Borowski <kilobyte-b9QjgO8OEXPVItvQsEIGlw@public.gmane.org> ---
Created attachment 122779
  --> https://bugs.freedesktop.org/attachment.cgi?id=122779&action=edit
including boot with nouveau.debug=DRM=debug drm.debug=0xe

> Was there anything before the tlb flush timeout error?

Nothing since boot.  I don't know what messages are interesting to you, so
here's a dump since boot, this time with nouveau.debug=DRM=debug drm.debug=0xe

> Unfortunately I have no clue why those timeouts happen... basically it's an indication that the GPU is "done".

I believe my hardware itself is ok, at least as in "never had any issue with
the proprietary driver".  Those bastards dropped support for GT215 though...

> You could disable GL stuff for chromium, either launching it with LIBGL_ALWAYS_SOFTWARE=1 or by disabling stuff in about:flags.

I don't care about chromium, I got a better browser :p  But whatever GL calls
it does can be invoked by some other program later...

> Perhaps the memory comes up in a (slightly) funny state? You could try reclocking it and see if that improves matters, have a look in /sys/kernel/debug/dri/0/pstate for the available perf levels, you can echo those values in to change states.

What values would you suggest?  I'm afraid I did not find documentation that's
idiot-proof -- and I sadly got exactly 0 clue about this kind of stuff so I
require some handholding to give you useful debug info.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14599742980.Ef63860.11450
Date: Wed, 6 Apr 2016 20:24:58 +0000
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
   title="NEW - nouveau causes lockup and reboot on GT215"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79518#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau causes lockup and reboot on GT215"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79518">bug 79518</a>
              from <span class="vcard"><a class="email" href="mailto:kilobyte&#64;angband.pl" title="Adam Borowski &lt;kilobyte&#64;angband.pl&gt;"> <span class="fn">Adam Borowski</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=122779" name="attach_122779" title="including boot with nouveau.debug=DRM=debug drm.debug=0xe">attachment 122779</a> <a href="attachment.cgi?id=122779&amp;action=edit" title="including boot with nouveau.debug=DRM=debug drm.debug=0xe">[details]</a></span>
including boot with nouveau.debug=DRM=debug drm.debug=0xe

<span class="quote">&gt; Was there anything before the tlb flush timeout error?</span >

Nothing since boot.  I don't know what messages are interesting to you, so
here's a dump since boot, this time with nouveau.debug=DRM=debug drm.debug=0xe

<span class="quote">&gt; Unfortunately I have no clue why those timeouts happen... basically it's an indication that the GPU is &quot;done&quot;.</span >

I believe my hardware itself is ok, at least as in &quot;never had any issue with
the proprietary driver&quot;.  Those bastards dropped support for GT215 though...

<span class="quote">&gt; You could disable GL stuff for chromium, either launching it with LIBGL_ALWAYS_SOFTWARE=1 or by disabling stuff in about:flags.</span >

I don't care about chromium, I got a better browser :p  But whatever GL calls
it does can be invoked by some other program later...

<span class="quote">&gt; Perhaps the memory comes up in a (slightly) funny state? You could try reclocking it and see if that improves matters, have a look in /sys/kernel/debug/dri/0/pstate for the available perf levels, you can echo those values in to change states.</span >

What values would you suggest?  I'm afraid I did not find documentation that's
idiot-proof -- and I sadly got exactly 0 clue about this kind of stuff so I
require some handholding to give you useful debug info.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14599742980.Ef63860.11450--

--===============0834826451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0834826451==--

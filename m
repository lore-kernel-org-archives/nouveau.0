From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73274] NV44A (PCI) 3D screensaver CACHE_ERROR
Date: Sat, 04 Jan 2014 08:06:41 +0000
Message-ID: <bug-73274-8800-nIbjKMshtx@http.bugs.freedesktop.org/>
References: <bug-73274-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1567502323=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73274-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1567502323==
Content-Type: multipart/alternative; boundary="1388822801.cA8fCec1.2268"; charset="us-ascii"


--1388822801.cA8fCec1.2268
Date: Sat, 4 Jan 2014 08:06:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73274

--- Comment #1 from James Phillips <freedesktop-bmuJXYsvn0ihgqps0qF2+Q@public.gmane.org> ---
Created attachment 91479
  --> https://bugs.freedesktop.org/attachment.cgi?id=91479&action=edit
reconstructed dmesg from kern.log after soft lock-up.

Not only was this too long for dmesg, but I accidentally hit the power button
on the keyboard. I trimmed the relevant kern.log to capture the relevant data.

The soft-lock up happened within about 30 minutes (based on saved IRC logs). I
did not intervene for hours (explaining the repeated messages).

There really were two instances of bubble3d running: one for each display. One
appears to complain about the cache error, while the other complains about the
resulting CPU lock-up.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1388822801.cA8fCec1.2268
Date: Sat, 4 Jan 2014 08:06:41 +0000
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
   title="NEW --- - NV44A (PCI) 3D screensaver CACHE_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73274#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NV44A (PCI) 3D screensaver CACHE_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73274">bug 73274</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop&#64;phillipsjk.ca" title="James Phillips &lt;freedesktop&#64;phillipsjk.ca&gt;"> <span class="fn">James Phillips</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=91479" name="attach_91479" title="reconstructed dmesg from kern.log after soft lock-up.">attachment 91479</a> <a href="attachment.cgi?id=91479&amp;action=edit" title="reconstructed dmesg from kern.log after soft lock-up.">[details]</a></span>
reconstructed dmesg from kern.log after soft lock-up.

Not only was this too long for dmesg, but I accidentally hit the power button
on the keyboard. I trimmed the relevant kern.log to capture the relevant data.

The soft-lock up happened within about 30 minutes (based on saved IRC logs). I
did not intervene for hours (explaining the repeated messages).

There really were two instances of bubble3d running: one for each display. One
appears to complain about the cache error, while the other complains about the
resulting CPU lock-up.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1388822801.cA8fCec1.2268--

--===============1567502323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1567502323==--

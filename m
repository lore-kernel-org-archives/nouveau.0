From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35267] nouveau fails to load BIOS on EFI boot.
Date: Wed, 15 May 2013 07:58:34 +0000
Message-ID: <bug-35267-8800-Tzsw0S4Mhh@http.bugs.freedesktop.org/>
References: <bug-35267-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1245492987=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35267-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1245492987==
Content-Type: multipart/alternative; boundary="1368604714.e1F8553.17057"; charset="us-ascii"


--1368604714.e1F8553.17057
Date: Wed, 15 May 2013 07:58:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=35267

--- Comment #16 from John <john.collaros-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I just wanted to add a few things I forgot. Even though I can get X to start
and log into ubuntu Unity, it is a bit unstable. I ran GLX gears and got a
segfault on one occasion. The following output was in dmesg

[ 2605.678169] show_signal_msg: 60 callbacks suppressed
[ 2605.678174] glxgears[3789]: segfault at 164 ip 00007fd8b2e9ece9 sp
00007ffff12fdc40 error 4 in libGLcore.so.173.14.37[7fd8b29f5000+bc5000]
[ 2618.945307] NVRM: Xid (0001:00): 13, 0004 00000000 0000502d 00000104
00000000 00000100
[ 2622.963507] NVRM: Xid (0001:00): 36,  L2 -> L1


If I try to switch to a VT I get a blank screen. Switching back is not always
successful. Most of the time I get a blank screen for a while till it updates.
Mostly I can see the cursor moving. Occaasionally I have had X crash and
restart.

I seem to be getting graphics artifacts in some applications like firefox and
chrome. I also noticed running virt-manager graphical console in scaled mode
makes the CPU work very hard. The system has freezes where it doesn't respond
for a while then comes back.

It's not really a stable environment, am considering putting my old hard-disk
back in. Makes me glad I just didnt upgrade over the top of it. I switched out
for an SSD. It has made a difference, but I digress.

So, what is special about nvidia-173 that can seemingly intialise the hardware,
and nouveau and others fails.

I am attaching some files with some output, as well as my kern log which will
show successive boots, so you can see the NVRM failed to init messages before
the last successful boot.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1368604714.e1F8553.17057
Date: Wed, 15 May 2013 07:58:34 +0000
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
   title="NEW --- - nouveau fails to load BIOS on EFI boot."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=35267#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau fails to load BIOS on EFI boot."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=35267">bug 35267</a>
              from <span class="vcard"><a class="email" href="mailto:john.collaros&#64;gmail.com" title="John &lt;john.collaros&#64;gmail.com&gt;"> <span class="fn">John</span></a>
</span></b>
        <pre>I just wanted to add a few things I forgot. Even though I can get X to start
and log into ubuntu Unity, it is a bit unstable. I ran GLX gears and got a
segfault on one occasion. The following output was in dmesg

[ 2605.678169] show_signal_msg: 60 callbacks suppressed
[ 2605.678174] glxgears[3789]: segfault at 164 ip 00007fd8b2e9ece9 sp
00007ffff12fdc40 error 4 in libGLcore.so.173.14.37[7fd8b29f5000+bc5000]
[ 2618.945307] NVRM: Xid (0001:00): 13, 0004 00000000 0000502d 00000104
00000000 00000100
[ 2622.963507] NVRM: Xid (0001:00): 36,  L2 -&gt; L1


If I try to switch to a VT I get a blank screen. Switching back is not always
successful. Most of the time I get a blank screen for a while till it updates.
Mostly I can see the cursor moving. Occaasionally I have had X crash and
restart.

I seem to be getting graphics artifacts in some applications like firefox and
chrome. I also noticed running virt-manager graphical console in scaled mode
makes the CPU work very hard. The system has freezes where it doesn't respond
for a while then comes back.

It's not really a stable environment, am considering putting my old hard-disk
back in. Makes me glad I just didnt upgrade over the top of it. I switched out
for an SSD. It has made a difference, but I digress.

So, what is special about nvidia-173 that can seemingly intialise the hardware,
and nouveau and others fails.

I am attaching some files with some output, as well as my kern log which will
show successive boots, so you can see the NVRM failed to init messages before
the last successful boot.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1368604714.e1F8553.17057--

--===============1245492987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1245492987==--

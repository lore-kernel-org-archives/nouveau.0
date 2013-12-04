From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70388] [NV34] failed to idle channel 0xcccc0000
Date: Wed, 04 Dec 2013 21:04:27 +0000
Message-ID: <bug-70388-8800-UQkqT8VUu4@http.bugs.freedesktop.org/>
References: <bug-70388-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1906303192=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70388-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1906303192==
Content-Type: multipart/alternative; boundary="1386191067.3e3c4c0.12727"; charset="us-ascii"


--1386191067.3e3c4c0.12727
Date: Wed, 4 Dec 2013 21:04:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70388

--- Comment #16 from Rostislav Krasny <rosti.bsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #15)
> Please take a look at https://bugs.freedesktop.org/show_bug.cgi?id=69375#c7
> and see if doing that helps. I see that, at the very least, your kernel was
> compiled with gcc 4.8, which likely means libdrm was too.

Installed fresh Fedora 19 with latest RPMs, including libdrm-2.4.47-1.fc19.i686
package, that has the above patch in it. Unfortunatelly this doesn't help:

Dec  4 22:01:12 localhost abrt-hook-ccpp[2105]: Saved core dump of pid 1553
(/usr/bin/Xorg) to /var/tmp/abrt/ccpp-2013-12-04-22:01:11-1553 (21499904 bytes)
Dec  4 22:01:12 localhost abrt-server[2106]: Generating core_backtrace
Dec  4 22:01:12 localhost abrt-server[2106]: Generating backtrace
Dec  4 22:01:15 localhost abrt-server[2106]: journalctl: unrecognized option
'--system'
Dec  4 22:01:27 localhost kernel: [  534.189018] nouveau E[ X[1553]] failed to
idle channel 0xcccc0000 [X[1553]]
Dec  4 22:01:42 localhost kernel: [  549.189017] nouveau E[ X[1553]] failed to
idle channel 0xcccc0000 [X[1553]]
Dec  4 22:01:42 localhost kdm[309]: X server for display :0 terminated
unexpectedly
Dec  4 22:01:42 localhost kdm[309]: plymouth should quit after server startup
Dec  4 22:01:42 localhost NetworkManager[372]: <warn> error requesting auth for
org.freedesktop.NetworkManager.wifi.share.open: (3)
GDBus.Error:org.freedesktop.DBus.Error.NameHasNoOwner:
GDBus.Error:org.freedesktop.DBus.Error.NameHasNoOwner: Could not get UID of
name ':1.56': no such name
Dec  4 22:01:42 localhost NetworkManager[372]: <warn> error requesting auth for
org.freedesktop.NetworkManager.wifi.share.protected: (3)
GDBus.Error:org.freedesktop.DBus.Error.NameHasNoOwner:
GDBus.Error:org.freedesktop.DBus.Error.NameHasNoOwner: Could not get UID of
name ':1.56': no such name
Dec  4 22:01:42 localhost NetworkManager[372]: <warn> error requesting auth for
org.freedesktop.NetworkManager.wifi.share.open: (3)
GDBus.Error:org.freedesktop.DBus.Error.NameHasNoOwner:
GDBus.Error:org.freedesktop.DBus.Error.NameHasNoOwner: Could not get UID of
name ':1.56': no such name
Dec  4 22:01:57 localhost kernel: [  564.388018] nouveau E[kwin[1815]] failed
to idle channel 0xcccc0000 [kwin[1815]]
Dec  4 22:02:12 localhost kernel: [  579.388016] nouveau E[kwin[1815]] failed
to idle channel 0xcccc0000 [kwin[1815]]
Dec  4 22:02:12 localhost kdm[309]: Quitting Plymouth with transition
Dec  4 22:02:12 localhost kdm[309]: Is Plymouth still running? no


(gdb) bt
#0  0xb777e424 in __kernel_vsyscall ()
#1  0xb7235936 in __GI_raise (sig=sig@entry=6) at
../nptl/sysdeps/unix/sysv/linux/raise.c:56
#2  0xb7237173 in __GI_abort () at abort.c:90
#3  0x080b98ea in OsAbort () at utils.c:1299
#4  0x080d2d97 in ddxGiveUp (error=error@entry=EXIT_ERR_ABORT) at
xf86Init.c:1075
#5  0x080d2e3b in AbortDDX (error=error@entry=EXIT_ERR_ABORT) at
xf86Init.c:1119
#6  0x080b4eb2 in AbortServer () at log.c:767
#7  0x080b598f in FatalError (f=f@entry=0x81f83f4 "Caught signal %d (%s).
Server aborting\n") at log.c:908
#8  0x080b6c76 in OsSigHandler (signo=11, sip=0xbfa247cc, unused=0xbfa2484c) at
osinit.c:147
#9  <signal handler called>
#10 __memcpy_ia32 () at ../sysdeps/i386/i686/memcpy.S:74
#11 0xb42f4008 in ?? ()
(gdb)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386191067.3e3c4c0.12727
Date: Wed, 4 Dec 2013 21:04:27 +0000
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
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388">bug 70388</a>
              from <span class="vcard"><a class="email" href="mailto:rosti.bsd&#64;gmail.com" title="Rostislav Krasny &lt;rosti.bsd&#64;gmail.com&gt;"> <span class="fn">Rostislav Krasny</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=70388#c15">comment #15</a>)
<span class="quote">&gt; Please take a look at <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV4E] GPU lockup when using chrome/flash"
   href="show_bug.cgi?id=69375#c7">https://bugs.freedesktop.org/show_bug.cgi?id=69375#c7</a>
&gt; and see if doing that helps. I see that, at the very least, your kernel was
&gt; compiled with gcc 4.8, which likely means libdrm was too.</span >

Installed fresh Fedora 19 with latest RPMs, including libdrm-2.4.47-1.fc19.i686
package, that has the above patch in it. Unfortunatelly this doesn't help:

Dec  4 22:01:12 localhost abrt-hook-ccpp[2105]: Saved core dump of pid 1553
(/usr/bin/Xorg) to /var/tmp/abrt/ccpp-2013-12-04-22:01:11-1553 (21499904 bytes)
Dec  4 22:01:12 localhost abrt-server[2106]: Generating core_backtrace
Dec  4 22:01:12 localhost abrt-server[2106]: Generating backtrace
Dec  4 22:01:15 localhost abrt-server[2106]: journalctl: unrecognized option
'--system'
Dec  4 22:01:27 localhost kernel: [  534.189018] nouveau E[ X[1553]] failed to
idle channel 0xcccc0000 [X[1553]]
Dec  4 22:01:42 localhost kernel: [  549.189017] nouveau E[ X[1553]] failed to
idle channel 0xcccc0000 [X[1553]]
Dec  4 22:01:42 localhost kdm[309]: X server for display :0 terminated
unexpectedly
Dec  4 22:01:42 localhost kdm[309]: plymouth should quit after server startup
Dec  4 22:01:42 localhost NetworkManager[372]: &lt;warn&gt; error requesting auth for
org.freedesktop.NetworkManager.wifi.share.open: (3)
GDBus.Error:org.freedesktop.DBus.Error.NameHasNoOwner:
GDBus.Error:org.freedesktop.DBus.Error.NameHasNoOwner: Could not get UID of
name ':1.56': no such name
Dec  4 22:01:42 localhost NetworkManager[372]: &lt;warn&gt; error requesting auth for
org.freedesktop.NetworkManager.wifi.share.protected: (3)
GDBus.Error:org.freedesktop.DBus.Error.NameHasNoOwner:
GDBus.Error:org.freedesktop.DBus.Error.NameHasNoOwner: Could not get UID of
name ':1.56': no such name
Dec  4 22:01:42 localhost NetworkManager[372]: &lt;warn&gt; error requesting auth for
org.freedesktop.NetworkManager.wifi.share.open: (3)
GDBus.Error:org.freedesktop.DBus.Error.NameHasNoOwner:
GDBus.Error:org.freedesktop.DBus.Error.NameHasNoOwner: Could not get UID of
name ':1.56': no such name
Dec  4 22:01:57 localhost kernel: [  564.388018] nouveau E[kwin[1815]] failed
to idle channel 0xcccc0000 [kwin[1815]]
Dec  4 22:02:12 localhost kernel: [  579.388016] nouveau E[kwin[1815]] failed
to idle channel 0xcccc0000 [kwin[1815]]
Dec  4 22:02:12 localhost kdm[309]: Quitting Plymouth with transition
Dec  4 22:02:12 localhost kdm[309]: Is Plymouth still running? no


(gdb) bt
#0  0xb777e424 in __kernel_vsyscall ()
#1  0xb7235936 in __GI_raise (sig=sig&#64;entry=6) at
../nptl/sysdeps/unix/sysv/linux/raise.c:56
#2  0xb7237173 in __GI_abort () at abort.c:90
#3  0x080b98ea in OsAbort () at utils.c:1299
#4  0x080d2d97 in ddxGiveUp (error=error&#64;entry=EXIT_ERR_ABORT) at
xf86Init.c:1075
#5  0x080d2e3b in AbortDDX (error=error&#64;entry=EXIT_ERR_ABORT) at
xf86Init.c:1119
#6  0x080b4eb2 in AbortServer () at log.c:767
#7  0x080b598f in FatalError (f=f&#64;entry=0x81f83f4 &quot;Caught signal %d (%s).
Server aborting\n&quot;) at log.c:908
#8  0x080b6c76 in OsSigHandler (signo=11, sip=0xbfa247cc, unused=0xbfa2484c) at
osinit.c:147
#9  &lt;signal handler called&gt;
#10 __memcpy_ia32 () at ../sysdeps/i386/i686/memcpy.S:74
#11 0xb42f4008 in ?? ()
(gdb)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386191067.3e3c4c0.12727--

--===============1906303192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1906303192==--

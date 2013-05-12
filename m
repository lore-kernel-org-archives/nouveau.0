From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 52411] NV43 [GeForce 6600] nouveau in linux kernel
 3.4.0 to 3.4.5 hangs at boot
Date: Sun, 12 May 2013 19:41:10 +0000
Message-ID: <bug-52411-8800-M1kR3UplxW@http.bugs.freedesktop.org/>
References: <bug-52411-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1882644671=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-52411-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1882644671==
Content-Type: multipart/alternative; boundary="1368387670.c1dBd82.31516"; charset="us-ascii"


--1368387670.c1dBd82.31516
Date: Sun, 12 May 2013 19:41:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=52411

--- Comment #2 from Hans de Graaff <hans-aqmcjHYS7FBg9hUCZPvPmw@public.gmane.org> ---
I've been seeing this also, with the latest kernel that I could run being
3.3.8. Today I did some more digging, and it appears that the last line is
actually a red herring. For some reason not all printk's actually make it to
the screen. Perhaps the video card is getting confused by something and stops
printing lines at some point.

In any case I found out that my problem actually seems to be listed in this
unsolved bug: https://bugzilla.redhat.com/show_bug.cgi?id=832548

I've "fixed" things on my end my by simply skipping all the nouveau perf
entries in nouveau_perf_init in nouveau_perf.c. (I added continue right within
the while loop). Obviously this doesn't get me any performance levels, but at
least things don't crash, and other than that the card seems to work as
expected.

I'd be happy to provide more information if needed, just let me know what you
need.

I've got the exact same card as the OP:
03:00.0 VGA compatible controller: NVIDIA Corporation NV43 [GeForce 6600] (rev
a2)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1368387670.c1dBd82.31516
Date: Sun, 12 May 2013 19:41:10 +0000
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
   title="NEW --- - NV43 [GeForce 6600] nouveau in linux kernel 3.4.0 to 3.4.5 hangs at boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=52411#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NV43 [GeForce 6600] nouveau in linux kernel 3.4.0 to 3.4.5 hangs at boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=52411">bug 52411</a>
              from <span class="vcard"><a class="email" href="mailto:hans&#64;degraaff.org" title="Hans de Graaff &lt;hans&#64;degraaff.org&gt;"> <span class="fn">Hans de Graaff</span></a>
</span></b>
        <pre>I've been seeing this also, with the latest kernel that I could run being
3.3.8. Today I did some more digging, and it appears that the last line is
actually a red herring. For some reason not all printk's actually make it to
the screen. Perhaps the video card is getting confused by something and stops
printing lines at some point.

In any case I found out that my problem actually seems to be listed in this
unsolved bug: <a href="https://bugzilla.redhat.com/show_bug.cgi?id=832548">https://bugzilla.redhat.com/show_bug.cgi?id=832548</a>

I've &quot;fixed&quot; things on my end my by simply skipping all the nouveau perf
entries in nouveau_perf_init in nouveau_perf.c. (I added continue right within
the while loop). Obviously this doesn't get me any performance levels, but at
least things don't crash, and other than that the card seems to work as
expected.

I'd be happy to provide more information if needed, just let me know what you
need.

I've got the exact same card as the OP:
03:00.0 VGA compatible controller: NVIDIA Corporation NV43 [GeForce 6600] (rev
a2)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1368387670.c1dBd82.31516--

--===============1882644671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1882644671==--

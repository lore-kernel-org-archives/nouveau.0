From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Sat, 14 Dec 2013 11:30:05 +0000
Message-ID: <bug-58378-8800-7Mio6LzE5a@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1826982689=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1826982689==
Content-Type: multipart/alternative; boundary="1387020605.3CDf8e5.23386"; charset="us-ascii"


--1387020605.3CDf8e5.23386
Date: Sat, 14 Dec 2013 11:30:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #26 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
Hi again,

sorry, it took longer than needed for me to find my way through compiling
recent kernels with rpmbuild and an appropriate spec file.

The result of my testing is negative: The bug is still included in the most
recent 3.13-rc3 kernel... :-(

From the attached dmesg output (which in both cases, includes the time when the
issue was seen and my screen was completely garbled), it looks to me that there
are no signs - not even in debug mode - of anything going wrong, so if I am
right with this assumption, I think this supports your theory that the root
cause of the severe screen corruption indeed is a "fencing" issue...

In the meantime, I have created a git repository on my machine and produced two
3.6-based tarballs for before and after the "mega patch".

I will now move forward to adapt a 3.6 kernel rpmbuild spec file and then build
two kernels for these two snapshots.

I should be able to update you on my progress some time tomorrow...

Thanks & best regards,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387020605.3CDf8e5.23386
Date: Sat, 14 Dec 2013 11:30:05 +0000
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
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>Hi again,

sorry, it took longer than needed for me to find my way through compiling
recent kernels with rpmbuild and an appropriate spec file.

The result of my testing is negative: The bug is still included in the most
recent 3.13-rc3 kernel... :-(

From the attached dmesg output (which in both cases, includes the time when the
issue was seen and my screen was completely garbled), it looks to me that there
are no signs - not even in debug mode - of anything going wrong, so if I am
right with this assumption, I think this supports your theory that the root
cause of the severe screen corruption indeed is a &quot;fencing&quot; issue...

In the meantime, I have created a git repository on my machine and produced two
3.6-based tarballs for before and after the &quot;mega patch&quot;.

I will now move forward to adapt a 3.6 kernel rpmbuild spec file and then build
two kernels for these two snapshots.

I should be able to update you on my progress some time tomorrow...

Thanks &amp; best regards,
Andreas</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387020605.3CDf8e5.23386--

--===============1826982689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1826982689==--

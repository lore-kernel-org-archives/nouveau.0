From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Tue, 17 Dec 2013 22:09:08 +0000
Message-ID: <bug-58378-8800-dMB5fDqz5k@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0411554173=="
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


--===============0411554173==
Content-Type: multipart/alternative; boundary="1387318148.d4C148345.5046"; charset="us-ascii"


--1387318148.d4C148345.5046
Date: Tue, 17 Dec 2013 22:09:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #45 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
Hmm...

While my card definitely is not at all defective (it works the exact same way
it always has), I indeed also have some issues that make it impossible for me
to still use the "blob" even on an attic distro like RHEL6:

The most recent version of the NVidia proprietary driver that worked fine for
me was their 285.09 (which can no longer be used even on RHEL6 due to the fact
that it relies on an outdated X11 ABI (AFAIK).

Any more recent version of NVidia's driver (and most interestingly, on Linux as
well as on Windows 7 x64!) - even though NVidia states that Quadro NVS 130M
would still be supported with their latest drivers - has an issue which causes
sudden complete hangs every once in a while (between a few seconds to few
hours), but completely unpredictably...

Unfortunately, NVidia tech support is unable/unwilling to help with this issue
(I tried for several months without any progress...).

I just did some Google research: Do you know that an 8400M (as well as my NVS
130M) does only support VDPAU "feature set A", but most VDPAU software relies
on feature sets C or D being implemented by the cards!?

Would it make sense to address the above questions about the feature set
implemented by these early G86 cards and how to properly activate these
features directly to NVidia (AFAIK, they recently offered some help by
answering questions from nouveau developers)?

In order to move forward, I will try to comment out the single line

 { "CRYPT", 0, 0x74c1, nv84_bo_move_exec, nv50_bo_move_init },

in a current 3.12.4 build, and report back on what happens...

Best regards,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387318148.d4C148345.5046
Date: Tue, 17 Dec 2013 22:09:08 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c45">Comment # 45</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>Hmm...

While my card definitely is not at all defective (it works the exact same way
it always has), I indeed also have some issues that make it impossible for me
to still use the &quot;blob&quot; even on an attic distro like RHEL6:

The most recent version of the NVidia proprietary driver that worked fine for
me was their 285.09 (which can no longer be used even on RHEL6 due to the fact
that it relies on an outdated X11 ABI (AFAIK).

Any more recent version of NVidia's driver (and most interestingly, on Linux as
well as on Windows 7 x64!) - even though NVidia states that Quadro NVS 130M
would still be supported with their latest drivers - has an issue which causes
sudden complete hangs every once in a while (between a few seconds to few
hours), but completely unpredictably...

Unfortunately, NVidia tech support is unable/unwilling to help with this issue
(I tried for several months without any progress...).

I just did some Google research: Do you know that an 8400M (as well as my NVS
130M) does only support VDPAU &quot;feature set A&quot;, but most VDPAU software relies
on feature sets C or D being implemented by the cards!?

Would it make sense to address the above questions about the feature set
implemented by these early G86 cards and how to properly activate these
features directly to NVidia (AFAIK, they recently offered some help by
answering questions from nouveau developers)?

In order to move forward, I will try to comment out the single line

 { &quot;CRYPT&quot;, 0, 0x74c1, nv84_bo_move_exec, nv50_bo_move_init },

in a current 3.12.4 build, and report back on what happens...

Best regards,
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

--1387318148.d4C148345.5046--

--===============0411554173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0411554173==--

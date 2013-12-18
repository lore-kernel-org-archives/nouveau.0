From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Wed, 18 Dec 2013 00:58:35 +0000
Message-ID: <bug-58378-8800-ZE2xNkiYG5@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1709393464=="
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


--===============1709393464==
Content-Type: multipart/alternative; boundary="1387328316.EFBb3e6.23849"; charset="us-ascii"


--1387328316.EFBb3e6.23849
Date: Wed, 18 Dec 2013 00:58:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #46 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Well, given that it doesn't work on the blob makes it sound like you have some
sort of funkiness in your hardware. One unsubstantiated theory is that the vdec
clock is *disabled*, and pcrypt is hooked up to that clock. Or perhaps that
clock is somehow broken. It'd be interesting to see whether the old blob
version can be made to work, but I wouldn't spend _too_ much time on it. May be
easy to do with an older livecd or something.

So, in order to completely disable PCRYPT without patching your system you can
boot with "nouveau.config=PCRYPT=0" in your kernel cmdline (since 3.7, I
think). It will also disallow userspace from using PCRYPT, which is probably
for the best if it's really broken. (Whereas just commenting it out there
prevents a very specific use-case of it.)

With a pre-3.13 kernel, you can also try adding nouveau.perflvl_wr=7777
nouveau.perflvl=1 which will force reclocking to happen on boot (to level '1'
which in your case is comparable to what you had been booting to anyways), and
just might get PCRYPT going (if the clock theory is right). Or hang your
machine. (Or both!) With 3.13 you'll need to apply a patch to enable the
reclocking functionality. [Obviously test this theory without the PCRYPT
disable stuff.]

BTW, to people who are not Andreas: Please post a full kernel log of a boot
with nouveau in a semi-recent kernel, that should reveal whether you guys are
all having the same issue or not.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387328316.EFBb3e6.23849
Date: Wed, 18 Dec 2013 00:58:36 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c46">Comment # 46</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Well, given that it doesn't work on the blob makes it sound like you have some
sort of funkiness in your hardware. One unsubstantiated theory is that the vdec
clock is *disabled*, and pcrypt is hooked up to that clock. Or perhaps that
clock is somehow broken. It'd be interesting to see whether the old blob
version can be made to work, but I wouldn't spend _too_ much time on it. May be
easy to do with an older livecd or something.

So, in order to completely disable PCRYPT without patching your system you can
boot with &quot;nouveau.config=PCRYPT=0&quot; in your kernel cmdline (since 3.7, I
think). It will also disallow userspace from using PCRYPT, which is probably
for the best if it's really broken. (Whereas just commenting it out there
prevents a very specific use-case of it.)

With a pre-3.13 kernel, you can also try adding nouveau.perflvl_wr=7777
nouveau.perflvl=1 which will force reclocking to happen on boot (to level '1'
which in your case is comparable to what you had been booting to anyways), and
just might get PCRYPT going (if the clock theory is right). Or hang your
machine. (Or both!) With 3.13 you'll need to apply a patch to enable the
reclocking functionality. [Obviously test this theory without the PCRYPT
disable stuff.]

BTW, to people who are not Andreas: Please post a full kernel log of a boot
with nouveau in a semi-recent kernel, that should reveal whether you guys are
all having the same issue or not.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387328316.EFBb3e6.23849--

--===============1709393464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1709393464==--

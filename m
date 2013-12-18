From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Wed, 18 Dec 2013 13:20:00 +0000
Message-ID: <bug-58378-8800-U2CdHJ4Xer@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0067090039=="
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


--===============0067090039==
Content-Type: multipart/alternative; boundary="1387372800.5Bfd5.8454"; charset="us-ascii"


--1387372800.5Bfd5.8454
Date: Wed, 18 Dec 2013 13:20:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #47 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
Hi - it's me again ;-)

> Well, given that it doesn't work on the blob makes it sound like you have some
> sort of funkiness in your hardware. One unsubstantiated theory is that the 
> vdec clock is *disabled*, and pcrypt is hooked up to that clock. Or perhaps 
> that clock is somehow broken. It'd be interesting to see whether the old blob
> version can be made to work, but I wouldn't spend _too_ much time on it. May 
> be easy to do with an older livecd or something.

I could try and do an install of RHEL6.2 (before the ABI change) onto an USB
HDD. On this version, 285.09 still ran fine. What exactly would you want me to
check with the "blob"?

Is there any diagnostic tool that could check about my "vdec clock" or pcrypt
status?

In the meantime, I have verified that with the single line

 { "CRYPT", 0, 0x74c1, nv84_bo_move_exec, nv50_bo_move_init },

commented out, a 3.12.4 kernel works fine - no corruption seen.

> So, in order to completely disable PCRYPT without patching your system you
> can boot with "nouveau.config=PCRYPT=0" in your kernel cmdline (since 3.7, I > think). It will also disallow userspace from using PCRYPT, which is probably > for the best if it's really broken. (Whereas just commenting it out there 
> prevents a very specific use-case of it.)

Also, booting both a stock 3.12.4 kernel and even the current RHEL 6.5 2.32-431
kernel with kernel commend line option "nouveau.config=PCRYPT=0" seems to work
fine, which means that my basic issue is already resolved, as with this option,
I already seem to be able to make sure that future stock RHEL kernels won't
break my screen all the time... ;-)

> With a pre-3.13 kernel, you can also try adding nouveau.perflvl_wr=7777 
> nouveau.perflvl=1 which will force reclocking to happen on boot (to level '1' 
> which in your case is comparable to what you had been booting to anyways), 
> and just might get PCRYPT going (if the clock theory is right). Or hang your 
> machine. (Or both!) With 3.13 you'll need to apply a patch to enable the 
> reclocking functionality. [Obviously test this theory without the PCRYPT 
> disable stuff.]

Can you please provide more details about this?

I tried to pass the below options to stock kernel version 3.13.0-rc4 (as of Dec
16) but got the following message:

Command line: ro root=UUID=034d34cd-a464-4ee3-8db9-d6061a318a16 rd_NO_LUKS
LANG=en_US.UTF-8  KEYBOARDTYPE=pc KEYTABLE=de-latin1-nodeadkeys rd_NO_MD
SYSFONT=latarcyrheb-sun16 rd_NO_LVM rd_NO_DM nouveau.perflvl_wr=7777
nouveau.perflvl=1
[...]
nouveau: unknown parameter 'perflvl_wr' ignored
nouveau: unknown parameter 'perflvl' ignored

and then of course got the distorted screen again.

So what exactly do I need to do in order to be able to pass these two
parameters and see whether reclocking my "vdec" clock helps to successfully use
the pcrypt feature?

Many thanks one more time,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387372800.5Bfd5.8454
Date: Wed, 18 Dec 2013 13:20:00 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c47">Comment # 47</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>Hi - it's me again ;-)

<span class="quote">&gt; Well, given that it doesn't work on the blob makes it sound like you have some
&gt; sort of funkiness in your hardware. One unsubstantiated theory is that the 
&gt; vdec clock is *disabled*, and pcrypt is hooked up to that clock. Or perhaps 
&gt; that clock is somehow broken. It'd be interesting to see whether the old blob
&gt; version can be made to work, but I wouldn't spend _too_ much time on it. May 
&gt; be easy to do with an older livecd or something.</span >

I could try and do an install of RHEL6.2 (before the ABI change) onto an USB
HDD. On this version, 285.09 still ran fine. What exactly would you want me to
check with the &quot;blob&quot;?

Is there any diagnostic tool that could check about my &quot;vdec clock&quot; or pcrypt
status?

In the meantime, I have verified that with the single line

 { &quot;CRYPT&quot;, 0, 0x74c1, nv84_bo_move_exec, nv50_bo_move_init },

commented out, a 3.12.4 kernel works fine - no corruption seen.

<span class="quote">&gt; So, in order to completely disable PCRYPT without patching your system you
&gt; can boot with &quot;nouveau.config=PCRYPT=0&quot; in your kernel cmdline (since 3.7, I &gt; think). It will also disallow userspace from using PCRYPT, which is probably &gt; for the best if it's really broken. (Whereas just commenting it out there 
&gt; prevents a very specific use-case of it.)</span >

Also, booting both a stock 3.12.4 kernel and even the current RHEL 6.5 2.32-431
kernel with kernel commend line option &quot;nouveau.config=PCRYPT=0&quot; seems to work
fine, which means that my basic issue is already resolved, as with this option,
I already seem to be able to make sure that future stock RHEL kernels won't
break my screen all the time... ;-)

<span class="quote">&gt; With a pre-3.13 kernel, you can also try adding nouveau.perflvl_wr=7777 
&gt; nouveau.perflvl=1 which will force reclocking to happen on boot (to level '1' 
&gt; which in your case is comparable to what you had been booting to anyways), 
&gt; and just might get PCRYPT going (if the clock theory is right). Or hang your 
&gt; machine. (Or both!) With 3.13 you'll need to apply a patch to enable the 
&gt; reclocking functionality. [Obviously test this theory without the PCRYPT 
&gt; disable stuff.]</span >

Can you please provide more details about this?

I tried to pass the below options to stock kernel version 3.13.0-rc4 (as of Dec
16) but got the following message:

Command line: ro root=UUID=034d34cd-a464-4ee3-8db9-d6061a318a16 rd_NO_LUKS
LANG=en_US.UTF-8  KEYBOARDTYPE=pc KEYTABLE=de-latin1-nodeadkeys rd_NO_MD
SYSFONT=latarcyrheb-sun16 rd_NO_LVM rd_NO_DM nouveau.perflvl_wr=7777
nouveau.perflvl=1
[...]
nouveau: unknown parameter 'perflvl_wr' ignored
nouveau: unknown parameter 'perflvl' ignored

and then of course got the distorted screen again.

So what exactly do I need to do in order to be able to pass these two
parameters and see whether reclocking my &quot;vdec&quot; clock helps to successfully use
the pcrypt feature?

Many thanks one more time,
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

--1387372800.5Bfd5.8454--

--===============0067090039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0067090039==--

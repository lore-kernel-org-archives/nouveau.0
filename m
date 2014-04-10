From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76732] Kworker using 100% CPU
Date: Thu, 10 Apr 2014 08:37:09 +0000
Message-ID: <bug-76732-8800-LF9I6B7Eh4@http.bugs.freedesktop.org/>
References: <bug-76732-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0343263658=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76732-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0343263658==
Content-Type: multipart/alternative; boundary="1397119029.C617e2.3846"; charset="us-ascii"


--1397119029.C617e2.3846
Date: Thu, 10 Apr 2014 08:37:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76732

--- Comment #39 from patrick.clara-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
(In reply to comment #38)
> (In reply to comment #37)
> > I think I should add that it happens only if I boot in pure EFI mode. If I
> > boot in EFI mode with CSM enabled, on the second load it behaves as usual.
> > 
> > I tried loading nouveau at boot with "config=NvForcePost=1". This seems to
> > workaround the problem for now. Also X starts corectly.
> > 
> > Will do some more testing...
> 
> Are you booting on a Macbook with something like rEFIt or rEFInd? How are
> you booting pure CSM if so? I'd like to try to duplicate this.

I have an Asus Zenbook UX51VZ and using simply GRUB (The EFI version
obviously), no rEFIt or rEFInd.

Maybe I could not explain it clear enough.
If I boot in pure EFI mode, unloading and loading nouveau again, makes nouveau
think the gpu is not initialized, or did not do the post. (Which I think the
bios should do, but not sure). Therefore, as you can see by comparing the two
last dmesgs i attached, nouveau is executing a big chunk of the vbios. After
doing so CPU load is normal and everythink seems to work as it should, at least
for now.

In the other case, where loading, unloading and loading again doesn't make any
difference, i did not boot in pure CSM mode. I booted in EFI mode but with CSM
enabled. These things actually go beyond my knowledge, but as far I understand,
enabling CSM while still booting in EFI mode, enables legacy functionality like
PCIROM, VGA setup and things like that.

I now tried als the pure CSM boot but there is no difference between pure CSM
and EFI with CSM enabled.


In any case the interesting thing in the dmesg of the second load in pure EFI
is this line:
nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised 

The behavior of nouveau, if it thinks the gpu is not initialized can be forced
by passing this parameter to nouveau: "config=NvForcePost=1".
Either in grub with "nouveau.config=NvForcePost=1" or in /etc/modprobe/...

So probably it would be more interesting trying this than to replicate the
strange behavior of unloading and loading again.

"config=NvForcePost=1", for me, works in pure EFI, EFI with CSM and also in
pure CSM.



One last thing:
I suppose that my system is newer running the init scripts in vbios during
POST, but I think there is more. As this patch describes
(http://www.spinics.net/lists/linux-pci/msg29828.html), the bios should also
set up VGA (whatever it means).
On my system, booting in pure EFI "cat /sys/class/drm/card0/device/boot_vga"
prints 0 and therefore the X server doesn't find my gpu and fails to start.
If CSM is enabled, and also in pure CSM mode, it prints 1 as it should.

Just for my curiosity, could you please check how your machine behaves
regarding this boot_vga?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397119029.C617e2.3846
Date: Thu, 10 Apr 2014 08:37:09 +0000
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
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732#c39">Comment # 39</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732">bug 76732</a>
              from <span class="vcard"><a class="email" href="mailto:patrick.clara&#64;gmail.com" title="patrick.clara&#64;gmail.com">patrick.clara&#64;gmail.com</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=76732#c38">comment #38</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=76732#c37">comment #37</a>)
&gt; &gt; I think I should add that it happens only if I boot in pure EFI mode. If I
&gt; &gt; boot in EFI mode with CSM enabled, on the second load it behaves as usual.
&gt; &gt; 
&gt; &gt; I tried loading nouveau at boot with &quot;config=NvForcePost=1&quot;. This seems to
&gt; &gt; workaround the problem for now. Also X starts corectly.
&gt; &gt; 
&gt; &gt; Will do some more testing...
&gt; 
&gt; Are you booting on a Macbook with something like rEFIt or rEFInd? How are
&gt; you booting pure CSM if so? I'd like to try to duplicate this.</span >

I have an Asus Zenbook UX51VZ and using simply GRUB (The EFI version
obviously), no rEFIt or rEFInd.

Maybe I could not explain it clear enough.
If I boot in pure EFI mode, unloading and loading nouveau again, makes nouveau
think the gpu is not initialized, or did not do the post. (Which I think the
bios should do, but not sure). Therefore, as you can see by comparing the two
last dmesgs i attached, nouveau is executing a big chunk of the vbios. After
doing so CPU load is normal and everythink seems to work as it should, at least
for now.

In the other case, where loading, unloading and loading again doesn't make any
difference, i did not boot in pure CSM mode. I booted in EFI mode but with CSM
enabled. These things actually go beyond my knowledge, but as far I understand,
enabling CSM while still booting in EFI mode, enables legacy functionality like
PCIROM, VGA setup and things like that.

I now tried als the pure CSM boot but there is no difference between pure CSM
and EFI with CSM enabled.


In any case the interesting thing in the dmesg of the second load in pure EFI
is this line:
nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised 

The behavior of nouveau, if it thinks the gpu is not initialized can be forced
by passing this parameter to nouveau: &quot;config=NvForcePost=1&quot;.
Either in grub with &quot;nouveau.config=NvForcePost=1&quot; or in /etc/modprobe/...

So probably it would be more interesting trying this than to replicate the
strange behavior of unloading and loading again.

&quot;config=NvForcePost=1&quot;, for me, works in pure EFI, EFI with CSM and also in
pure CSM.



One last thing:
I suppose that my system is newer running the init scripts in vbios during
POST, but I think there is more. As this patch describes
(<a href="http://www.spinics.net/lists/linux-pci/msg29828.html">http://www.spinics.net/lists/linux-pci/msg29828.html</a>), the bios should also
set up VGA (whatever it means).
On my system, booting in pure EFI &quot;cat /sys/class/drm/card0/device/boot_vga&quot;
prints 0 and therefore the X server doesn't find my gpu and fails to start.
If CSM is enabled, and also in pure CSM mode, it prints 1 as it should.

Just for my curiosity, could you please check how your machine behaves
regarding this boot_vga?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397119029.C617e2.3846--

--===============0343263658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0343263658==--

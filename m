From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77674] [NVE7] "failed to read DPCD" on wake up with
 external monitor
Date: Tue, 24 Jun 2014 17:58:40 +0000
Message-ID: <bug-77674-8800-uiMuXydqlU@http.bugs.freedesktop.org/>
References: <bug-77674-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1805430146=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77674-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1805430146==
Content-Type: multipart/alternative; boundary="1403632719.376C52c1.28934"; charset="us-ascii"


--1403632719.376C52c1.28934
Date: Tue, 24 Jun 2014 17:58:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77674

--- Comment #5 from Dzmitry Lazerka <dlazerka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #1)
> (In reply to comment #0)
> > Hi folks,
> > I have:
> > 
> > 01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK107GLM
> > [Quadro K1000M] [10de:0ffc] (rev a1)
> > (one year old thinkpad laptop)
> > 
> > and I'm unable to wake up. Well, not be, but my "Linux 3.11-2-amd64 #1 SMP
> > Debian 3.11.8-1 (2013-11-13) x86_64 GNU/Linux" (Mint, Debian Edition,
> > "testing").
> > Optimus is disabled in BIOS (only discrete is used). On waking up I see four
> > lines:
> > 
> > [ 8618.926501] mei_me 0000:00:16.0: suspend
> > [ 8623.309085] nouveau E[  PDISP][000:01:00.0] DP:0006:0f48: failed to read
> > DPCD
> > [ 8625.220708] dpm_run_callback(): usb_dev_resume+0x0/0x10 [usbcore] returns
> > -32
> > [ 8625.220712] PM: Device 4-1.8.1.1.1 failed to resume async: error -32
> > 
> > 
> > Reproducible only with external monitors (via dock station).
> 
> Could you confirm that this still happens with the latest kernel (3.14.1)?
> If it does, can you grab dmesg when you boot with
> 
> nouveau.debug=VBIOS=trace,PDISP=trace drm.debug=0xe
> 
> (including the suspend/resume bits).
> 

Hi Ilia, sorry for the late reply. I'll try to update my kernel (although I
switched to Nvidia drivers because I needed WebGL). Let me try the new kernel.
What config to put the "nouveau.debug=VBIOS=trace,PDISP=trace drm.debug=0xe"
line?

> > 
> > 
> > Sorry, not sure how to get Nouveau version.
> > $ apt-cache showpkg xserver-xorg-video-nouveau
> > ...
> > Dependencies:
> > 1:1.0.10-1 - libc6 (2 2.15)
> > libdrm-nouveau2 (2 2.4.38)
> > libdrm2 (2 2.4.25)
> > libudev1 (2 183)
> > xorg-video-abi-14 (0 (null))
> > xserver-xorg-core (2 2:1.13.99.901)
> > libgl1-mesa-dri (2 9.0)
> > xserver-xorg-video-nouveau:i386 (0 (null))
> > if that helps.
> 
> Not related to your issues, but there have been a lot of 3d driver
> improvements since mesa 9.0... you might want to upgrade. 10.1 has been out
> for months now, and 10.1.1 just got released. And if you want optimus to
> work, get xorg 1.14.3 or later... should give you much better battery life.

Well, that was Mint Debian Edition (based on Debian Testing), I use "apt-get
upgrade" tells me to. If I could install newer version through apt-get, that
would be cool.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403632719.376C52c1.28934
Date: Tue, 24 Jun 2014 17:58:39 +0000
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
   title="NEW --- - [NVE7] &quot;failed to read DPCD&quot; on wake up with external monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77674#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] &quot;failed to read DPCD&quot; on wake up with external monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77674">bug 77674</a>
              from <span class="vcard"><a class="email" href="mailto:dlazerka&#64;gmail.com" title="Dzmitry Lazerka &lt;dlazerka&#64;gmail.com&gt;"> <span class="fn">Dzmitry Lazerka</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=77674#c1">comment #1</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=77674#c0">comment #0</a>)
&gt; &gt; Hi folks,
&gt; &gt; I have:
&gt; &gt; 
&gt; &gt; 01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK107GLM
&gt; &gt; [Quadro K1000M] [10de:0ffc] (rev a1)
&gt; &gt; (one year old thinkpad laptop)
&gt; &gt; 
&gt; &gt; and I'm unable to wake up. Well, not be, but my &quot;Linux 3.11-2-amd64 #1 SMP
&gt; &gt; Debian 3.11.8-1 (2013-11-13) x86_64 GNU/Linux&quot; (Mint, Debian Edition,
&gt; &gt; &quot;testing&quot;).
&gt; &gt; Optimus is disabled in BIOS (only discrete is used). On waking up I see four
&gt; &gt; lines:
&gt; &gt; 
&gt; &gt; [ 8618.926501] mei_me 0000:00:16.0: suspend
&gt; &gt; [ 8623.309085] nouveau E[  PDISP][000:01:00.0] DP:0006:0f48: failed to read
&gt; &gt; DPCD
&gt; &gt; [ 8625.220708] dpm_run_callback(): usb_dev_resume+0x0/0x10 [usbcore] returns
&gt; &gt; -32
&gt; &gt; [ 8625.220712] PM: Device 4-1.8.1.1.1 failed to resume async: error -32
&gt; &gt; 
&gt; &gt; 
&gt; &gt; Reproducible only with external monitors (via dock station).
&gt; 
&gt; Could you confirm that this still happens with the latest kernel (3.14.1)?
&gt; If it does, can you grab dmesg when you boot with
&gt; 
&gt; nouveau.debug=VBIOS=trace,PDISP=trace drm.debug=0xe
&gt; 
&gt; (including the suspend/resume bits).
&gt; </span >

Hi Ilia, sorry for the late reply. I'll try to update my kernel (although I
switched to Nvidia drivers because I needed WebGL). Let me try the new kernel.
What config to put the &quot;nouveau.debug=VBIOS=trace,PDISP=trace drm.debug=0xe&quot;
line?

<span class="quote">&gt; &gt; 
&gt; &gt; 
&gt; &gt; Sorry, not sure how to get Nouveau version.
&gt; &gt; $ apt-cache showpkg xserver-xorg-video-nouveau
&gt; &gt; ...
&gt; &gt; Dependencies:
&gt; &gt; 1:1.0.10-1 - libc6 (2 2.15)
&gt; &gt; libdrm-nouveau2 (2 2.4.38)
&gt; &gt; libdrm2 (2 2.4.25)
&gt; &gt; libudev1 (2 183)
&gt; &gt; xorg-video-abi-14 (0 (null))
&gt; &gt; xserver-xorg-core (2 2:1.13.99.901)
&gt; &gt; libgl1-mesa-dri (2 9.0)
&gt; &gt; xserver-xorg-video-nouveau:i386 (0 (null))
&gt; &gt; if that helps.
&gt; 
&gt; Not related to your issues, but there have been a lot of 3d driver
&gt; improvements since mesa 9.0... you might want to upgrade. 10.1 has been out
&gt; for months now, and 10.1.1 just got released. And if you want optimus to
&gt; work, get xorg 1.14.3 or later... should give you much better battery life.</span >

Well, that was Mint Debian Edition (based on Debian Testing), I use &quot;apt-get
upgrade&quot; tells me to. If I could install newer version through apt-get, that
would be cool.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403632719.376C52c1.28934--

--===============1805430146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1805430146==--

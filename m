From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Sun, 28 Jul 2013 17:53:35 +0000
Message-ID: <bug-67051-8800-uwcxhwBHsa@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0174862131=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0174862131==
Content-Type: multipart/alternative; boundary="1375034015.8Cc810.11722"; charset="us-ascii"


--1375034015.8Cc810.11722
Date: Sun, 28 Jul 2013 17:53:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #100 from Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This is strange.  The compile (make) fails.
I've compiled a few kernels in my life.  Never happened before:
Twice.

First:
 ....
  CC [M]  drivers/net/wireless/brcm80211/brcmfmac/dhd_linux.o
  CC [M]  drivers/net/wireless/b43legacy/pio.o
  CC [M]  drivers/net/wireless/b43/wa.o
  CC [M]  drivers/net/wireless/b43/dma.o
  CC [M]  drivers/net/wireless/brcm80211/brcmfmac/btcoex.o
  LD [M]  drivers/net/wireless/b43legacy/b43legacy.o
  CC [M]  drivers/net/wireless/b43/pio.o
  CC [M]  drivers/net/wireless/b43/rfkill.o
  LD [M]  drivers/net/wireless/brcm80211/brcmfmac/brcmfmac.o
  LD [M]  drivers/net/wireless/b43/b43.o
  LD      drivers/net/built-in.o
make: *** [drivers] Error 2

real    4m8.390s
user    7m39.033s
sys     0m27.441s
2

Second time:
 ....
  CC      net/xfrm/xfrm_sysctl.o
  CC      net/xfrm/xfrm_replay.o
  LD      drivers/input/input-core.o
  LD      drivers/input/built-in.o
make: *** [drivers] Error 2
make: *** Waiting for unfinished jobs....
  CC [M]  net/xfrm/xfrm_algo.o
  CC [M]  net/wireless/ethtool.o
  CC [M]  net/xfrm/xfrm_user.o
  LD      net/xfrm/built-in.o
  CC [M]  net/wireless/mesh.o
  CC [M]  net/wireless/ap.o
  CC [M]  net/wireless/trace.o
  LD      net/wireless/built-in.o
  LD [M]  net/wireless/cfg80211.o
  LD      net/built-in.o

real    3m53.609s
user    7m11.009s
sys     0m26.165s
2

Note:  (FWIW) typical successful completion time: about 5m 28s
------

1.  I re-tried the compile of yesterday (with mthd-1).  Perfect again.
I then retraced the very same steps, except with the new mthd-2.
As shown above, still bad.

Comments (I'm still in shock):
2. Is it possible that you really meant debug-_1_ (Comment 98)?
(I've gone with debug-3 exclusively so far, assuming that was a typo)

3. To troubleshoot (if need be) I can do just 'make' (as opposed to make -j4)
Slower but more explicit.

4. For clarity/completeness, this is what I always do:

cd /
rm -fr linux-3.10.1
time tar xJf /usr/local/downloads/linux-3.10.1.tar.xz ; echo $?
cd linux-3.10.1
make mrproper ; echo $?
cp -p /boot/config/config-3.10.1-3-P5E-74G .config
make menuconfig
make oldconfig ; echo $?
*** Apply the indicated patches ***
time make -j4 ; echo $?
*** If the 4th patch is mthd-2:  twice (consistently) fail.
*** If the 4th patch is mthd-1:  always OK

Any ideas, suggestions?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375034015.8Cc810.11722
Date: Sun, 28 Jul 2013 17:53:35 +0000
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
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c100">Comment # 100</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:alupu01&#64;gmail.com" title="Alex &lt;alupu01&#64;gmail.com&gt;"> <span class="fn">Alex</span></a>
</span></b>
        <pre>This is strange.  The compile (make) fails.
I've compiled a few kernels in my life.  Never happened before:
Twice.

First:
 ....
  CC [M]  drivers/net/wireless/brcm80211/brcmfmac/dhd_linux.o
  CC [M]  drivers/net/wireless/b43legacy/pio.o
  CC [M]  drivers/net/wireless/b43/wa.o
  CC [M]  drivers/net/wireless/b43/dma.o
  CC [M]  drivers/net/wireless/brcm80211/brcmfmac/btcoex.o
  LD [M]  drivers/net/wireless/b43legacy/b43legacy.o
  CC [M]  drivers/net/wireless/b43/pio.o
  CC [M]  drivers/net/wireless/b43/rfkill.o
  LD [M]  drivers/net/wireless/brcm80211/brcmfmac/brcmfmac.o
  LD [M]  drivers/net/wireless/b43/b43.o
  LD      drivers/net/built-in.o
make: *** [drivers] Error 2

real    4m8.390s
user    7m39.033s
sys     0m27.441s
2

Second time:
 ....
  CC      net/xfrm/xfrm_sysctl.o
  CC      net/xfrm/xfrm_replay.o
  LD      drivers/input/input-core.o
  LD      drivers/input/built-in.o
make: *** [drivers] Error 2
make: *** Waiting for unfinished jobs....
  CC [M]  net/xfrm/xfrm_algo.o
  CC [M]  net/wireless/ethtool.o
  CC [M]  net/xfrm/xfrm_user.o
  LD      net/xfrm/built-in.o
  CC [M]  net/wireless/mesh.o
  CC [M]  net/wireless/ap.o
  CC [M]  net/wireless/trace.o
  LD      net/wireless/built-in.o
  LD [M]  net/wireless/cfg80211.o
  LD      net/built-in.o

real    3m53.609s
user    7m11.009s
sys     0m26.165s
2

Note:  (FWIW) typical successful completion time: about 5m 28s
------

1.  I re-tried the compile of yesterday (with mthd-1).  Perfect again.
I then retraced the very same steps, except with the new mthd-2.
As shown above, still bad.

Comments (I'm still in shock):
2. Is it possible that you really meant debug-_1_ (<a href="show_bug.cgi?id=67051#c98">Comment 98</a>)?
(I've gone with debug-3 exclusively so far, assuming that was a typo)

3. To troubleshoot (if need be) I can do just 'make' (as opposed to make -j4)
Slower but more explicit.

4. For clarity/completeness, this is what I always do:

cd /
rm -fr linux-3.10.1
time tar xJf /usr/local/downloads/linux-3.10.1.tar.xz ; echo $?
cd linux-3.10.1
make mrproper ; echo $?
cp -p /boot/config/config-3.10.1-3-P5E-74G .config
make menuconfig
make oldconfig ; echo $?
*** Apply the indicated patches ***
time make -j4 ; echo $?
*** If the 4th patch is mthd-2:  twice (consistently) fail.
*** If the 4th patch is mthd-1:  always OK

Any ideas, suggestions?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375034015.8Cc810.11722--

--===============0174862131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0174862131==--

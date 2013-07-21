From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Sun, 21 Jul 2013 01:21:43 +0000
Message-ID: <bug-67051-8800-HBrpDxwQt8@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1328517864=="
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


--===============1328517864==
Content-Type: multipart/alternative; boundary="1374369703.781CD0.20754"; charset="us-ascii"


--1374369703.781CD0.20754
Date: Sun, 21 Jul 2013 01:21:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #41 from Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

> Don't know what "make install" really does, I've never used it. 

My bad (my "quick thought" was way too quick).
I was talking about 'make module_install'.

Anyway, to make it more precise and not affected by my state of exhaustion,
I present my script I use"

#!/bin/bash -e
# AFTER 
#  cd /root/linux
#  git checkout 8e9e3d2deacc460fbb8a4691140318f6e85e6891
#  Make changes (apply, remove patches, etc.)
cd /root/linux
make mrproper &&
cp -p /boot/config/config-3.7.0-rc4+-1-P5E-74G .config
make menuconfig
make oldconfig && ls -ogtr .config*
time make -j4 ; echo $?
make modules_install &&
ls -ogtr /lib/modules
cd /boot &&
 cp -p /root/linux/arch/i386/boot/bzImage LFSkernel-3.7.0-1 &&
 cp -p /root/linux/System.map System.map-3.7.0-1 &&
 ln -fs LFSkernel-3.7.0-1 LFSkernel &&
 ln -fs System.map-3.7.0-1 System.map && ls -ogtr
set +e
read -s -n1 -t20 -p "(Hit a key to continue)" ; echo
reboot

and attach the standard '.config' (see above).  Not perfection by any standards
but it is based on the 3.7.10 version and it adequate for these tests.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374369703.781CD0.20754
Date: Sun, 21 Jul 2013 01:21:43 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c41">Comment # 41</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:alupu01&#64;gmail.com" title="Alex &lt;alupu01&#64;gmail.com&gt;"> <span class="fn">Alex</span></a>
</span></b>
        <pre>
<span class="quote">&gt; Don't know what &quot;make install&quot; really does, I've never used it. </span >

My bad (my &quot;quick thought&quot; was way too quick).
I was talking about 'make module_install'.

Anyway, to make it more precise and not affected by my state of exhaustion,
I present my script I use&quot;

#!/bin/bash -e
# AFTER 
#  cd /root/linux
#  git checkout 8e9e3d2deacc460fbb8a4691140318f6e85e6891
#  Make changes (apply, remove patches, etc.)
cd /root/linux
make mrproper &amp;&amp;
cp -p /boot/config/config-3.7.0-rc4+-1-P5E-74G .config
make menuconfig
make oldconfig &amp;&amp; ls -ogtr .config*
time make -j4 ; echo $?
make modules_install &amp;&amp;
ls -ogtr /lib/modules
cd /boot &amp;&amp;
 cp -p /root/linux/arch/i386/boot/bzImage LFSkernel-3.7.0-1 &amp;&amp;
 cp -p /root/linux/System.map System.map-3.7.0-1 &amp;&amp;
 ln -fs LFSkernel-3.7.0-1 LFSkernel &amp;&amp;
 ln -fs System.map-3.7.0-1 System.map &amp;&amp; ls -ogtr
set +e
read -s -n1 -t20 -p &quot;(Hit a key to continue)&quot; ; echo
reboot

and attach the standard '.config' (see above).  Not perfection by any standards
but it is based on the 3.7.10 version and it adequate for these tests.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374369703.781CD0.20754--

--===============1328517864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1328517864==--

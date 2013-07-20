From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Sat, 20 Jul 2013 22:12:34 +0000
Message-ID: <bug-67051-8800-M0kkLDg52r@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1318977003=="
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


--===============1318977003==
Content-Type: multipart/alternative; boundary="1374358354.FEEfff0.753"; charset="us-ascii"


--1374358354.FEEfff0.753
Date: Sat, 20 Jul 2013 22:12:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #35 from Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Ilia,

> 8e9e3d2deacc460fbb8a4691140318f6e85e6891 + 
> hdmi-1.patch + hdminva3.patch + hdminva3-3.patch

Not good news:  Good 'eld#3.0',  No HDMI sound

I'd like you to take a little time to review my procedure, correct it if
necessary, and thus keep us in sync.

cd /root/linux                                  # Linus directory
make mrproper
git checkout 8e9e3d2deacc460fbb8a4691140318f6e85e6891
# At this point, files to be patched are each copied ('cp -p') to <name>-orig.
cd /root/Temp                                   # Patch directory
cp -p ../linux/drivers/gpu/drm/nouveau/core/engine/disp/hdanva3.c-orig
hdanva3.c
cp -p ../linux/drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c-orig
hdminva3.c
cp -p ../linux/drivers/gpu/drm/nouveau/core/engine/disp/hdminv84.c-orig
hdminv84.c
#
patch -Np8 -i hdmi-1.patch ; echo $?
patch -Np8 -i hdminva3.patch ; echo $?
patch -Np8 -i hdminva3-3.patch ; echo $?
cp -p {hdanva3,hdminva3,hdminv84}.c                  
/root/linux/drivers/gpu/drm/nouveau/core/engine/disp/
# Build, reboot, test:
cat /proc/asound/card1/eld#3.0                  # Good, Bad?
aplay -D plughw:1,9 test.wav                    # HDMI sound?

-- Alex

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374358354.FEEfff0.753
Date: Sat, 20 Jul 2013 22:12:34 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c35">Comment # 35</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:alupu01&#64;gmail.com" title="Alex &lt;alupu01&#64;gmail.com&gt;"> <span class="fn">Alex</span></a>
</span></b>
        <pre>Hi Ilia,

<span class="quote">&gt; 8e9e3d2deacc460fbb8a4691140318f6e85e6891 + 
&gt; hdmi-1.patch + hdminva3.patch + hdminva3-3.patch</span >

Not good news:  Good 'eld#3.0',  No HDMI sound

I'd like you to take a little time to review my procedure, correct it if
necessary, and thus keep us in sync.

cd /root/linux                                  # Linus directory
make mrproper
git checkout 8e9e3d2deacc460fbb8a4691140318f6e85e6891
# At this point, files to be patched are each copied ('cp -p') to &lt;name&gt;-orig.
cd /root/Temp                                   # Patch directory
cp -p ../linux/drivers/gpu/drm/nouveau/core/engine/disp/hdanva3.c-orig
hdanva3.c
cp -p ../linux/drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c-orig
hdminva3.c
cp -p ../linux/drivers/gpu/drm/nouveau/core/engine/disp/hdminv84.c-orig
hdminv84.c
#
patch -Np8 -i hdmi-1.patch ; echo $?
patch -Np8 -i hdminva3.patch ; echo $?
patch -Np8 -i hdminva3-3.patch ; echo $?
cp -p {hdanva3,hdminva3,hdminv84}.c                  
/root/linux/drivers/gpu/drm/nouveau/core/engine/disp/
# Build, reboot, test:
cat /proc/asound/card1/eld#3.0                  # Good, Bad?
aplay -D plughw:1,9 test.wav                    # HDMI sound?

-- Alex</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374358354.FEEfff0.753--

--===============1318977003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1318977003==--
